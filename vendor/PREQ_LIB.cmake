# zlib/png integration hack - removes all the errors related to export
# (zlib doesn't export; libpng wants to; in this case we don't care).
set(SKIP_INSTALL_EXPORT TRUE)

# If this is built standalone, and not part of an embedded project,
# define the build directory.

if(PROJECT_IS_TOP_LEVEL)
    if(NOT DEFINED DEPS_INSTALL_PREFIX)
        set(DEPS_INSTALL_PREFIX "${CMAKE_BINARY_DIR}" CACHE STRING "Installation Prefix" FORCE)
    endif()

    get_property(
        CMAKE_INSTALL_PREFIX_DOCS
        DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
        PROPERTY CMAKE_INSTALL_PREFIX
        FULL_DOCS
    )

    set(CMAKE_INSTALL_PREFIX ${DEPS_INSTALL_PREFIX} CACHE STRING "${CMAKE_INSTALL_PREFIX_DOCS}" FORCE)

    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_INSTALL_PREFIX}/lib)
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_INSTALL_PREFIX}/lib)
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_INSTALL_PREFIX}/bin)
    set(CMAKE_PDB_OUTPUT_DIRECTORY ${CMAKE_INSTALL_PREFIX}/pdb)

    # 设置依赖库目录
    link_directories(${CMAKE_INSTALL_PREFIX}/lib)
endif()

include(CMakePrintHelpers)

#[[ 处理子目录中预先依赖的库；
# 例如, pcre2 依赖 zlib 库，则需要先调用 PREQ_LIB(zlib)
#]]
macro(PREQ_LIB lib)
    string(TOUPPER ${lib} LIBUPR)
    set(${LIBUPR}_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/${lib}")

    add_subdirectory(${${LIBUPR}_DIRECTORY})
    # 获取DIRECTORY作用域的一个属性
    # 从对应目录下，获取 CMAKE_CURRENT_BINARY_DIR 变量定义，保存为 XXX_BUILD_DIRECTORY
    get_directory_property(${LIBUPR}_BUILD_DIRECTORY
        DIRECTORY ${${LIBUPR}_DIRECTORY}
        DEFINITION CMAKE_CURRENT_BINARY_DIR)

    # 从依赖库目录下，获取对应的
    get_directory_property(${LIBUPR}_STATIC
        DIRECTORY ${${LIBUPR}_DIRECTORY}
        DEFINITION ${lib}_static)

    if (NOT ${LIBUPR}_STATIC)
        get_directory_property(${LIBUPR}_STATIC
        DIRECTORY ${${LIBUPR}_DIRECTORY}
        DEFINITION ${lib}-static)
    endif()
    if (NOT ${LIBUPR}_STATIC)
        get_directory_property(${LIBUPR}_STATIC
        DIRECTORY ${${LIBUPR}_DIRECTORY}
        DEFINITION ${lib}static)
    endif()
    if (NOT ${LIBUPR}_STATIC)
        get_directory_property(${LIBUPR}_STATIC
        DIRECTORY ${${LIBUPR}_DIRECTORY}
        DEFINITION ${lib})
    endif()

    get_directory_property(${LIBUPR}_SHARED
        DIRECTORY ${${LIBUPR}_DIRECTORY}
        DEFINITION ${lib})

    set(${LIBUPR}_INCLUDE_DIR ${${LIBUPR}_DIRECTORY})
    set(${LIBUPR}_LIBRARY ${lib})

    message(STATUS "-------------------------------------------------")
    cmake_print_variables(${LIBUPR}_DIRECTORY  ${LIBUPR}_BUILD_DIRECTORY
       ${lib} ${LIBUPR}_STATIC ${LIBUPR}_SHARED ${LIBUPR}_LIB_NAME_STATIC ${LIBUPR}_LIB_NAME
       ${LIBUPR}_LIBRARY ${LIBUPR}_INCLUDE_DIR)
    message(STATUS "-------------------------------------------------")

    if(NOT PROJECT_IS_TOP_LEVEL)
        #[[
        使 LIB_DIRECTORY, LIB_BUILD_DIRCTORY,LIB_STATIC, LIB_SHARED 等在全局可用
        ]]
        set(${LIBUPR}_DIRECTORY        ${${LIBUPR}_DIRECTORY}       PARENT_SCOPE)
        set(${LIBUPR}_BUILD_DIRECTORY  ${${LIBUPR}_BUILD_DIRECTORY} PARENT_SCOPE)
        set(${LIBUPR}_STATIC           ${${LIBUPR}_STATIC}          PARENT_SCOPE)
        set(${LIBUPR}_SHARED           ${${LIBUPR}_SHARED}          PARENT_SCOPE)
        # Setup the dependencies include directories, sending it upward for use.
        # 可以通过 include_directories(${DEPS_INCLUDE_DIRECTORIES}) 包含库的目录
        if(NOT DEFINED DEPS_INCLUDE_DIRECTORIES)
            set(DEPS_INCLUDE_DIRECTORIES ${${LIBUPR}_DIRECTORY} ${${LIBUPR}_BUILD_DIRECTORY} PARENT_SCOPE)
        else()
            # Already defined requires append semantics
            list(APPEND DEPS_INCLUDE_DIRECTORIES ${${LIBUPR}_DIRECTORY} ${${LIBUPR}_BUILD_DIRECTORY})
        endif()
    endif()

endmacro()

option(PNG_LINK_ZLIB_STATIC "Use a static zlib library for libpng builds" ON)
# zlib (requires nothing)
set(ZLIB_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/zlib")
add_subdirectory(${ZLIB_DIRECTORY})

get_directory_property(ZLIB_BUILD_DIRECTORY
    DIRECTORY ${ZLIB_DIRECTORY}
    DEFINITION CMAKE_CURRENT_BINARY_DIR)

# not needed, but paranoia for the future.
get_directory_property(zlib
    DIRECTORY ${ZLIB_DIRECTORY}
    DEFINITION zlib)

# not needed, but paranoia for the future.
get_directory_property(zlibstatic
    DIRECTORY ${ZLIB_DIRECTORY}
    DEFINITION zlibstatic)

if(PNG_LINK_ZLIB_STATIC)
    set(ZLIB_LIBRARY $<TARGET_LINKER_FILE:zlibstatic>)
else()
    set(ZLIB_LIBRARY zlib)
endif()
set(ZLIB_INCLUDE_DIR ${ZLIB_DIRECTORY} ${ZLIB_BUILD_DIRECTORY})

# # ======================================
# # libpng (requiring zlib)
# set(LIBPNG_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/libpng")

# # libpng needs a hand.
# include_directories(
#     ${ZLIB_DIRECTORY} ${ZLIB_BUILD_DIRECTORY}
#     ${LIBPNG_DIRECTORY} ${LIBPNG_BUILD_DIRECTORY})

# add_subdirectory(${LIBPNG_DIRECTORY})

# get_directory_property(LIBPNG_BUILD_DIRECTORY
#     DIRECTORY ${LIBPNG_DIRECTORY}
#     DEFINITION CMAKE_CURRENT_BINARY_DIR)

# get_directory_property(LIBPNG_STATIC
#     DIRECTORY ${LIBPNG_DIRECTORY}
#     DEFINITION PNG_LIB_NAME_STATIC)

# get_directory_property(LIBPNG_SHARED
#     DIRECTORY ${LIBPNG_DIRECTORY}
#     DEFINITION PNG_LIB_NAME)

# set(PNG_LIBRARY $<TARGET_FILE:${LIBPNG_STATIC}>)
# set(PNG_PNG_INCLUDE_DIR ${LIBPNG_DIRECTORY})

# ========================
# openjpeg
set(ENABLE_LIB_ONLY 1)
PREQ_LIB(bzip2)
set(BZIP2_LIBRARY "bz2")
unset(ENABLE_LIB_ONLY)
# PREQ_LIB(libjpeg-turbo)
# PREQ_LIB(libtiff)
# set(TIFF_LIBRARY libtiff)
# set(TIFF_INCLUDE_DIR ${LIBTIFF_DIRECTORY}/libtiff)
# PREQ_LIB(openjpeg)
