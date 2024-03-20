# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "D:/project/UniNative/uni-native/vendor/vendor/ibjpeg-turbo/src/libjpeg-turbo"
  "D:/project/UniNative/uni-native/vendor/vendor/ibjpeg-turbo/src/libjpeg-turbo-build"
  "D:/project/UniNative/uni-native/vendor/vendor/ibjpeg-turbo"
  "D:/project/UniNative/uni-native/vendor/vendor/ibjpeg-turbo/tmp"
  "D:/project/UniNative/uni-native/vendor/vendor/ibjpeg-turbo/src/libjpeg-turbo-stamp"
  "D:/project/UniNative/uni-native/vendor/vendor/ibjpeg-turbo/src"
  "D:/project/UniNative/uni-native/vendor/vendor/ibjpeg-turbo/src/libjpeg-turbo-stamp"
)

set(configSubDirs Debug;Release;MinSizeRel;RelWithDebInfo)
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "D:/project/UniNative/uni-native/vendor/vendor/ibjpeg-turbo/src/libjpeg-turbo-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "D:/project/UniNative/uni-native/vendor/vendor/ibjpeg-turbo/src/libjpeg-turbo-stamp${cfgdir}") # cfgdir has leading slash
endif()
