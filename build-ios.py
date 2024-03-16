"""
在MacOSX机器上构建ios库，默认生成 x86_64 和 arm64的FAT库
默认生成Xcode工程
"""

import os

R = os.getcwd()

def ensure_dir(dir):
    d = os.path.join(R,dir)
    if not os.path.exists():
        os.makedirs(d)


def get_toolchain_cmake():
    return os.path.join(R,"cmake/toolchain/ios.toolchain.cmake")

def get_cmake_exe():
    return "cmake"

def build_ios(dir):
    cmake = get_cmake_exe()
    tc = get_toolchain_cmake()
    cmd = f"{cmake} -DCMAKE_TOOLCHAIN_FILE={tc} -DPLATFORM=OS64COMBINED -DCMAKE_BUILD_TYPE=Release -G \"Xcode\" -B {dir}"
    print(cmd)
    os.system(cmd)

    os.system(f"{cmake} --build {dir} --config Release")



build_ios("build-ios")

