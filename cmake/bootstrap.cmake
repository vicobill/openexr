## 获取 GIT_BRANCH,GIT_COMMIT_HASH,GIT_COMMIT_DATE 三个变量

# Find Git commit details to put into versions.h later
# Get the current working branch
find_package(Git REQUIRED)
execute_process(COMMAND ${GIT_EXECUTABLE} symbolic-ref --short -q HEAD
    WORKING_DIRECTORY       ${PROJECT_SOURCE_DIR}
    OUTPUT_VARIABLE         GIT_BRANCH
    OUTPUT_STRIP_TRAILING_WHITESPACE
    TIMEOUT 4 ERROR_QUIET)
# Get the latest abbreviated commit hash of the working branch
execute_process(COMMAND ${GIT_EXECUTABLE} log -1 --format=%h
    WORKING_DIRECTORY       ${PROJECT_SOURCE_DIR}
    OUTPUT_VARIABLE         GIT_COMMIT_HASH
    OUTPUT_STRIP_TRAILING_WHITESPACE
    TIMEOUT 4 ERROR_QUIET)
# Get the latest commit date of the working branch
execute_process(COMMAND ${GIT_EXECUTABLE} log -1 --format=%cd --date=short
    WORKING_DIRECTORY       ${PROJECT_SOURCE_DIR}
    OUTPUT_VARIABLE         GIT_COMMIT_DATE
    OUTPUT_STRIP_TRAILING_WHITESPACE
    TIMEOUT 4 ERROR_QUIET)


###############################################
## Detect 编译器版本
get_filename_component(CMAKE_MAKE_NAME "${CMAKE_MAKE_PROGRAM}" NAME_WE)
if(CMAKE_MAKE_NAME STREQUAL "MSBuild")
    execute_process(COMMAND "${CMAKE_MAKE_PROGRAM}" /nologo /version
        OUTPUT_VARIABLE         CMAKE_MAKE_VERSION
        OUTPUT_STRIP_TRAILING_WHITESPACE ERROR_QUIET)
    set(CMAKE_MAKE_VERSION "MSBuild ${CMAKE_MAKE_VERSION}")
elseif(CMAKE_MAKE_NAME STREQUAL "ninja")
    execute_process(COMMAND "${CMAKE_MAKE_PROGRAM}" --version
        OUTPUT_VARIABLE         CMAKE_MAKE_VERSION
        OUTPUT_STRIP_TRAILING_WHITESPACE ERROR_QUIET)
    set(CMAKE_MAKE_VERSION "Ninja ${CMAKE_MAKE_VERSION}")
elseif(CMAKE_MAKE_NAME STREQUAL "xcodebuild")
    execute_process(COMMAND "${CMAKE_MAKE_PROGRAM}" -version
        OUTPUT_VARIABLE         CMAKE_MAKE_VERSION
        OUTPUT_STRIP_TRAILING_WHITESPACE ERROR_QUIET)
    string(REGEX REPLACE "\n.*" "" CMAKE_MAKE_VERSION "${CMAKE_MAKE_VERSION}")
else()
    execute_process(COMMAND "${CMAKE_MAKE_PROGRAM}" --version
        OUTPUT_VARIABLE         CMAKE_MAKE_VERSION
        OUTPUT_STRIP_TRAILING_WHITESPACE ERROR_QUIET)
    string(REGEX REPLACE "\n.*" "" CMAKE_MAKE_VERSION "${CMAKE_MAKE_VERSION}")
endif()
if(DEFINED ENV{VisualStudioVersion})
    set(VS_VERSION $ENV{VisualStudioVersion})
endif()


# --------- Set compiler parameters ---------
if(MSVC)
    # using Visual Studio C++
    add_definitions(-D_CRT_SECURE_NO_WARNINGS)
    # use multicore
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /MP")
elseif(CMAKE_CXX_COMPILER_ID STREQUAL AppleClang)
    # force libc++, not libstdc++ for Xcode 10
    # https://developer.apple.com/documentation/xcode_release_notes/xcode_10_release_notes#3035631
    set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -stdlib=libc++ -lc++abi")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -stdlib=libc++")
endif()


# try to use clcache/ccache to speed up builds
if(NOT CCACHE_PROGRAM)
    if(MSVC)
        find_program(CCACHE_PROGRAM clcache)
        set(_PARAM --help)
    else()
        find_program(CCACHE_PROGRAM ccache)
        set(_PARAM --version)
    endif()
    if(CCACHE_PROGRAM)
        execute_process(COMMAND "${CCACHE_PROGRAM}" ${_PARAM}
            OUTPUT_VARIABLE CCACHE_VERSION
            OUTPUT_STRIP_TRAILING_WHITESPACE ERROR_QUIET)
        string(REGEX REPLACE "\n.*" "" CCACHE_VERSION "${CCACHE_VERSION}")
        string(REGEX REPLACE ".* " "" CCACHE_VERSION "${CCACHE_VERSION}")
        string(REGEX REPLACE "^v" "" CCACHE_VERSION "${CCACHE_VERSION}")
        if(CCACHE_VERSION)
            message(STATUS "Found compile cache tool: ${CCACHE_PROGRAM} (found version \"${CCACHE_VERSION}\")")
        else()
            message(STATUS "Found compile cache tool: ${CCACHE_PROGRAM}")
        endif()
    else()
        message(STATUS "Could NOT find compile cache tool (ccache or clcache)")
    endif()
    unset(_PARAM)
endif()
if(CCACHE_PROGRAM)
    if(MSVC)
        get_filename_component(CCACHE_EXEC "${CCACHE_PROGRAM}" NAME CACHE)
        get_filename_component(CCACHE_PATH "${CCACHE_PROGRAM}" DIRECTORY CACHE)
        file(TO_NATIVE_PATH "${CCACHE_PATH}" CCACHE_PATH)
        if(NOT CMAKE_VERSION VERSION_LESS 3.13)
            list(APPEND CMAKE_VS_GLOBALS
                "CLToolExe=${CCACHE_EXEC}"
                "CLToolPath=${CCACHE_PATH}"
                "TrackFileAccess=false")
        elseif(NOT DEFINED ENV{VCPKG_ROOT})
            function(any_target_hook)
                set(NON_COMPILE_TARGETS INTERFACE IMPORTED UNKNOWN ALIAS)
                list(FIND NON_COMPILE_TARGETS "${ARGV1}" found)
                if(${found} GREATER -1)
                    return()
                endif()

                set_target_properties(${ARGV0} PROPERTIES VS_GLOBAL_CLToolExe       "${CCACHE_EXEC}")
                set_target_properties(${ARGV0} PROPERTIES VS_GLOBAL_CLToolPath      "${CCACHE_PATH}")
                set_target_properties(${ARGV0} PROPERTIES VS_GLOBAL_TrackFileAccess false)
            endfunction()

            function(add_library)
                _add_library(${ARGN})
                any_target_hook(${ARGN})
            endfunction()

            function(add_executable)
                _add_executable(${ARGN})
                any_target_hook(${ARGN})
            endfunction()
        endif()
    else()
        if(NOT CMAKE_VERSION VERSION_LESS 3.4)
            set(CMAKE_C_COMPILER_LAUNCHER "${CCACHE_PROGRAM}")
            set(CMAKE_CXX_COMPILER_LAUNCHER "${CCACHE_PROGRAM}")
        else()
            set_property(GLOBAL PROPERTY RULE_LAUNCH_COMPILE "${CCACHE_PROGRAM}")
            set_property(GLOBAL PROPERTY RULE_LAUNCH_LINK "${CCACHE_PROGRAM}")
        endif()
    endif()
endif()



if(CMAKE_COMPILER_IS_GNUCXX)
	# GCC C++11 support
	# from http://stackoverflow.com/questions/10984442/how-to-detect-c11-support-of-a-compiler-with-cmake
	#
	execute_process(COMMAND ${CMAKE_C_COMPILER} -dumpversion OUTPUT_VARIABLE GCC_VERSION)
	if (GCC_VERSION VERSION_GREATER 4.7 OR GCC_VERSION VERSION_EQUAL 4.7)
		message(STATUS "C++11 activated.")
		add_definitions("-std=gnu++11")
	elseif(GCC_VERSION VERSION_GREATER 4.3 OR GCC_VERSION VERSION_EQUAL 4.3)
		message(WARNING "C++0x activated. If you get any errors update to a compiler which fully supports C++11")
		add_definitions("-std=gnu++0x")
	else ()
		message(FATAL_ERROR "C++11 needed. Therefore a gcc compiler with a version higher than 4.3 is needed.")
	endif()

	add_definitions(
		-Wall
		-Wextra
		-Wno-unknown-pragmas #learn_more: output is spammed like shit by all those #pragma mark items
	)

	if(CMAKE_BUILD_TYPE MATCHES "Release")
		set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O3")
		set(CMAKE_EXE_LINKER_FLAGS "-s")
	endif()

elseif ("${CMAKE_CXX_COMPILER_ID}" MATCHES "Clang")
	# Clang C++11 support
	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=gnu++11")

	add_definitions(
		-Wall
		-Wextra
		-Wno-unused-parameter
	)

	if(CMAKE_BUILD_TYPE MATCHES "Release")
		set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O3")
		set(CMAKE_EXE_LINKER_FLAGS "-s")
	endif()

elseif(MSVC)
	add_definitions(
		/D_CRT_SECURE_NO_WARNINGS
		/wd4068
		/DNOMINMAX
		/D_USE_MATH_DEFINES
	)
	set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} /MT")	#static link to msv runtime (MSVCR(P)xxx.dll)
	#set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} /MTd")
endif()

set_property(GLOBAL PROPERTY USE_FOLDERS ON)	#msvc / xcode: group files in project

include(ProcessorCount)
ProcessorCount(NUM_PROC)


# Support folders in IDEs
set_property(GLOBAL PROPERTY USE_FOLDERS ON)


# dll和lib 放在lib目录下；可执行文件放在 bin 目录下。
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
# 设置默认安装路径
set(CMAKE_INSTALL_PREFIX
    ${CMAKE_BINARY_DIR}/install
    CACHE PATH "Installation Directory")

