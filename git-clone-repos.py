# 根据submodule的url进行下载

import os
import subprocess
import multiprocessing as mp
from tqdm import tqdm


submodules = []
with open(".gitmodules") as f:
    path = None
    url = None
    lines = f.readlines()
    def _strip(x):
        return x.strip()
    for line in lines:
        words = list(map(_strip,line.split("=")))
        if len(words) > 1:
            if words[0] == "path":
                path = words[-1]
            elif words[0] == "url":
                url = words[-1]
            # print(f"path:{path} url:{url}")

        if path is not None and url is not None:
            # print(f"add submodule: {path} {url}")
            submodules.append((path,url))
            path = None
            url = None

def work(url,path):
    cmd = git_clone_cmd(url,path)
    subprocess.run(cmd)

    # 设置为源地址
    cwd = os.getcwd()
    os.chdir(path)
    subprocess.run(f"git remote set-url origin {url}")
    os.chdir(cwd)


def update_progress_bar(_):
    progress_bar.update()

def git_clone_cmd(url, path):
    proxyurl = url.replace('github.com','githubfast.com')
    cmd = f"git clone {proxyurl} {path}"
    print(cmd)
    return cmd

NUMBER_OF_TASKS = len(submodules)
progress_bar = tqdm(total=NUMBER_OF_TASKS)

if __name__ == '__main__':
    pool = mp.Pool(NUMBER_OF_TASKS)

    for path,url in submodules:
        pool.apply_async(work, (url,path,), callback=update_progress_bar)

    pool.close()
    pool.join()
