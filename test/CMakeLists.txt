cmake_minimum_required(VERSION 3.14)

project(uni-nativeTests LANGUAGES CXX)

include(../cmake/project-is-top-level.cmake)
include(../cmake/folders.cmake)

# ---- Dependencies ----

if(PROJECT_IS_TOP_LEVEL)
  find_package(uni-native REQUIRED)
  enable_testing()
endif()

# ---- Tests ----

add_executable(uni-native_test source/uni-native_test.cpp)
target_link_libraries(uni-native_test PRIVATE uni-native::uni-native)
target_compile_features(uni-native_test PRIVATE cxx_std_17)

add_test(NAME uni-native_test COMMAND uni-native_test)

# ---- End-of-file commands ----

add_folders(Test)
