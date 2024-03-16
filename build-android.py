""" 默认使用Ninja构建android arm-v8a 版本库
cmake调用的是NDK目录下的cmake/3.22.1/bin/cmake.exe
android toolchain 使用的是NDK目录下的 android.toolchain.cmake
NDK目录由系统变量： NDK_ROOT 或 ANDROID_NDK_HOME、ANDROID_NDK_ROOT 获取
SDK目录由系统变量：ANDROID_SDK_HOME、ANDROID_SDK_ROOT或ANDROID_SDK 获取
 """


import os
import subprocess

ANDROID_ARCHS = ["arm64-v8a","armeabi-v7a","x86_64","x86"]

R = os.getcwd()

def ensure_dir(dir):
    d = os.path.join(R,dir)
    if not os.path.exists():
        os.makedirs(d)
def get_android_ndk_home():
    root = os.getenv("ANDROID_NDK_HOME")
    if root == "":
        root = os.getenv("ANDROID_NDK_ROOT")
    if root == "":
        root = os.getenv("NDK_ROOT")
    return root

def get_android_sdk_home():
    root = os.getenv("ANDROID_SDK_HOME")
    if root == "":
        root = os.getenv("ANDROID_SDK_ROOT")
    if root == "":
        root = os.getenv("ANDROID_SDK")
    return root

def get_android_cmake():
    """获取Android SDK中安装的cmake，这里默认为 3.22.1 版本"""
    d = get_android_sdk_home()
    return f"{d}/cmake/3.22.1/bin/cmake.exe"

def get_android_toolchain_cmake():
    """获取NDK下的android.toolchain.cmake文件"""
    return f"{get_android_ndk_home()}/build/cmake/android.toolchain.cmake"

def build_android(dir,abi):
    tc = get_android_toolchain_cmake()
    print(tc)
    ndk = get_android_ndk_home()
    print(ndk)
    cmake = get_android_cmake()
    cmd = f"{cmake} -DCMAKE_TOOLCHAIN_FILE={tc} -DANDROID_ABI={abi} \
        -DANDROID_PLATFORM=android-21 -DANDROID_NDK={ndk} -DCMAKE_BUILD_TYPE=Release -G \"Ninja\" -B {dir}"
    print(cmd)

    subprocess.run(cmd)

    cmd2 = f"{cmake} --build {dir} --config Release"
    subprocess.run(cmd2)

    # os.system(cmd)
    # os.system(cmd2)


for abi in ANDROID_ARCHS:
  build_android(f"build-android-{abi}",abi)

