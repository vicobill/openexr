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

#[[
PREQ_LIB(lib [libdir])
@param lib: 库的名称 例如 bz2
@param libdir: 库路径 例如 bzip2

处理子目录中预先依赖的库；
# 例如, pcre2 依赖 zlib 库，则需要先调用 PREQ_LIB(zlib)
#]]
macro(PREQ_LIB lib)
    string(TOUPPER ${lib} LIBUPR)
    # message(STATUS "C: ${ARGC}")
    # message(STATUS "0: ${ARGV0}")
    # message(STATUS "1: ${ARGV1}")
    # message(STATUS "2: ${ARGV2}")
    if (${ARGC} GREATER 1)
        set(libdir ${ARGV1})
        # message(STATUS "xxxxxxxxx1xxxxxxxxx ${libdir}")
    else()
        set(libdir ${lib})
        # message(STATUS "xxxxxxxxx2xxxxxxxxx ${libdir}")
    endif()
    set(${LIBUPR}_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/${libdir}")

    add_subdirectory(${${LIBUPR}_DIRECTORY})
    # 获取DIRECTORY作用域的一个属性
    # 从对应目录下，获取 CMAKE_CURRENT_BINARY_DIR 变量定义，保存为 XXX_BUILD_DIRECTORY
    get_directory_property(${LIBUPR}_BUILD_DIRECTORY
        DIRECTORY ${${LIBUPR}_DIRECTORY}
        DEFINITION CMAKE_CURRENT_BINARY_DIR)

    get_directory_property(${LIBUPR}_STATIC
        DIRECTORY ${${LIBUPR}_DIRECTORY}
        DEFINITION ${lib}_LIBNAME)

    if (NOT ${LIBUPR}_STATIC)
        if (TARGET ${lib}_static)
            set(${LIBUPR}_STATIC ${lib}_static)
        elseif(TARGET ${lib}-static)
            set(${LIBUPR}_STATIC ${lib}-static)
        elseif(TARGET ${lib}static)
            set(${LIBUPR}_STATIC ${lib}static)
        elseif(TARGET ${lib})
            set(${LIBUPR}_STATIC ${lib})
        endif()
    endif()

    get_directory_property(${LIBUPR}_SHARED
        DIRECTORY ${${LIBUPR}_DIRECTORY}
        DEFINITION ${lib})

    if(NOT ${LIBUPR}_SHARED)
        if(TARGET ${lib}_shared)
            set(${LIBUPR}_SHARED ${lib}_shared)
        elseif(TARGET ${lib})
            set(${LIBUPR}_SHARED ${lib})
        endif()
    endif()



    # 设置 find_package 通常设定的属性
    set(${LIBUPR}_INCLUDE_DIRS ${${LIBUPR}_DIRECTORY} ${${LIBUPR}_BUILD_DIRECTORY})
    set(${LIBUPR}_INCLUDE_DIR ${${LIBUPR}_DIRECTORY} )
    set(${LIBUPR}_LIBRARIES ${${LIBUPR}_STATIC} ${lib})
    set(${LIBUPR}_LIBRARY ${${LIBUPR}_STATIC})

    message(STATUS "-------------------------------------------------")
    cmake_print_variables(${LIBUPR}_DIRECTORY  ${LIBUPR}_BUILD_DIRECTORY
       ${lib} ${LIBUPR}_STATIC ${LIBUPR}_SHARED ${LIBUPR}_LIBNAME_STATIC ${LIBUPR}_LIBNAME
       ${LIBUPR}_LIBRARIES ${LIBUPR}_INCLUDE_DIRS ${LIBUPR}_LIBRARY ${LIBUPR}_INCLUDE_DIR)
    message(STATUS "-------------------------------------------------")

    get_all_cmake_targets(_all_cmake_targets ${${LIBUPR}_DIRECTORY})
    set_target_properties(${_all_cmake_targets} PROPERTIES FOLDER ${lib})

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
endmacro(PREQ_LIB)

# ============================================================================= #

PREQ_LIB(zlib zlib)
link_directories(${CMAKE_LIBRARY_OUTPUT_DIRECTORY}/lib)
# FIXED error about: link zlib.obj ，主要是缺少ALIAS设定
add_library(ZLIB::ZLIB ALIAS zlibstatic)

PREQ_LIB(brotli)

set(ENABLE_LIB_ONLY 1)
PREQ_LIB(bz2 bzip2)
set(BZIP2_LIBRARIES ${BZ2_LIBRARIES})
set(BZIP2_INCLUDE_DIR ${BZ2_INCLUDE_DIR})
unset(ENABLE_LIB_ONLY)

PREQ_LIB(Imath)
PREQ_LIB(gif libgif)
set(GIF_LIBRARY libgif)
set(GIF_INCLUDE_DIR ${GIF_DIRECTORY})
# PREQ_LIB(libxml2)

set(PNG_SHARED OFF)
set(PNG_TOOLS OFF)
PREQ_LIB(png libpng)
set(PNG_LIBRARY png_static)
set(PNG::PNG $<TARGET:${PNG_LIBRARY}>)
set(PNG_PNG_INCLUDE_DIR ${PNG_INCLUDE_DIR})
group_sources_under(libpng)


include(./build-jpeg.cmake)
set(JPEG_LIBRARY jpeg_static)
set(JPEG::JPEG $<TARGET:${JPEG_LIBRARY}>)


PREQ_LIB(Deflate libdeflate)
set(Deflate_LIBRARY libdeflate_static)
set(Deflate_INCLUDE_DIRS ${DEFLATE_INCLUDE_DIRS})

PREQ_LIB(de265 libde265)
set(LIBDE265_LIBRARY de265)
set(LIBDE265_INCLUDE_DIR ${DE265_INCLUDE_DIR})

PREQ_LIB(WebP libwebp)

# set(AOM_TARGET_CPU "generic")
# PREQ_LIB(libaom) # preq Perl


set(ALLOW_IN_SOURCE_BUILD 1)
PREQ_LIB(libjasper jasper)


set(tiff-tools OFF)
set(tiff-tools-unsupported OFF)
set(tiff-tests OFF)
set(tiff-contrib OFF)
set(tiff-docs OFF)
PREQ_LIB(tiff libtiff)
set(TIFF_LIBRARIES tiff)
set(TIFF_LIBNAME tiff)
set(TIFF_INCLUDE_DIRS ${TIFF_DIRECTORY}/libtiff ${TIFF_BUILD_DIRECTORY})

include(./build-LCMS2.cmake)
set(LCMS2_LIBRARY LCMS2)
set(LCMS2_INCLUDE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/LCMS2/include)



set(BUILD_THIRDPARTY OFF)
set(LCMS2_INCLUDE_DIR)
add_subdirectory(openjpeg)
group_sources_under(openjpeg)

PREQ_LIB(OpenEXR openexr)




# PREQ_LIB(AOM libaom)

# PREQ_LIB(libjxl)

# set(BUILD_EXAMPLES OFF)
# PREQ_LIB(heif libheif)
# unset(BUILD_EXAMPLES)
# add_subdirectory(libheif)
# group_sources_under(libheif)


# add_subdirectory(pcre2)


# include(./libjpeg-turbo.cmake)
# PREQ_LIB(libjpeg-turbo)
# include(FetchContent)

# add_subdirectory(zlib-ng)
# add_subdirectory(minizip-ng)

add_subdirectory(LibRaw-cmake)
set(RAW_LIBRARY raw)


include(./build-libmagic.cmake)


## ======================= ImageMagick
# include(./build-imagemagick.cmake)

# include(./folder-targets.cmake)
