"""
默认生成vs2022 x64 工程进行编译
"""

import os
import subprocess

def get_cmake_exe():
    return "cmake"

def build_win(dir):
    cmake = get_cmake_exe()
    cmd = f"{cmake} -DCMAKE_BUILD_TYPE=Release -G \"Visual Studio 17 2022\" -A x64 -B {dir}"
    print(cmd)

    subprocess.run(cmd)

    cmd2 = f"{cmake} --build {dir} --config Release"
    subprocess.run(cmd2)

build_win("build-win")
