
# options
set(MAGICKCORE_QUANTUM_DEPTH 16 CACHE STRING "MagickCore Quantum Depth,values 8/16/24/32")
set(MAGICKCORE_HDRI_ENABLE OFF CACHE BOOL "MagickCore HDRI support")
option(MAGICKCORE_BUILD_MODULES "build coders & filters as modules" OFF)



option(ImageMagick_BUILD_SHARED "将ImageMagick编译为动态库(dll,so)" OFF)


# add_subdirectory(ImageMagick-7/MagickCore)

file(GLOB_RECURSE MAGICK_CODERS_SOURCES ImageMagick-7/coders/*.c)
file(GLOB_RECURSE MAGICK_CODERS_HEADERS ImageMagick-7/coders/*.h)
file(GLOB MAGICK_FILTERS_SOURCES ImageMagick-7/filters/*.c)
file(GLOB MAGICK_FILTERS_HEADERS ImageMagick-7/filters/*.h)
file(GLOB_RECURSE MAGICK_CORE_SOURCES ImageMagick-7/MagickCore/*.c)
file(GLOB_RECURSE MAGICK_CORE_HEADERS ImageMagick-7/MagickCore/*.h)
file(GLOB MAGICK_WAND_SOURCES ImageMagick-7/MagickWand/*.c)
file(GLOB MAGICK_WAND_HEADERS ImageMagick-7/MagickWand/*.h)

add_library(libImageMagick SHARED
  ${MAGICK_CODERS_SOURCES}
  ${MAGICK_CODERS_HEADERS}
  ${MAGICK_FILTERS_SOURCES}
  ${MAGICK_FILTERS_HEADERS}
  ${MAGICK_CORE_SOURCES}
  ${MAGICK_CORE_HEADERS}
  ${MAGICK_WAND_SOURCES}
  ${MAGICK_WAND_HEADERS})

# 在IDE下按相对目录进行代码分组
get_target_property(libImageMagick_Files libImageMagick SOURCES)
source_group(TREE ${CMAKE_CURRENT_SOURCE_DIR}/ImageMagick-7 FILES ${libImageMagick_Files})


if(HAVE_RESTRICT_KEYWORD)
  set(_magickcore_restrict restrict)
elseif(HAVE___RESTRICT_KEYWORD)
  set(_magickcore_restrict __restrict)
elseif(HAVE___RESTRICT___KEYWORD)
  set(_magickcore_restrict __restrict__)
endif()

find_package(Threads QUIET )
if(Threads_FOUND AND CMAKE_USE_PTHREADS_INIT)
  set(HAVE_PTHREAD CMAKE_USE_PTHREADS_INIT)
endif()


include(./imagemagick-config-file.cmake)


target_include_directories(libImageMagick PUBLIC
ImageMagick-7/
${DEPS_INCLUDE_DIRECTORIES}

openjpeg/src/lib/openjp2
openjpeg/src/lib/openjpip

libtiff/libtiff

libjpeg-turbo
libpng
libwebp/src
openexr/src/lib/Iex
openexr/src/lib/IlmThread
openexr/src/lib/OpenEXR
openexr/src/lib/OpenEXRCore
openexr/src/lib/OpenEXRUtil
)
target_compile_options(libImageMagick PUBLIC
  # -fopenmp -Wall -g -O2 -mtune=core2 -fexceptions -pthread -DMAGICKCORE_HDRI_ENABLE=1 -DMAGICKCORE_QUANTUM_DEPTH=16 -DMAGICKCORE_CHANNEL_MASK_DEPTH=32
  -DMAGICKCORE_HDRI_ENABLE=0
  -DMAGICKCORE_QUANTUM_DEPTH=16
  -D_MT
  -DMAGICKCORE_CHANNEL_MASK_DEPTH=32
  -DHAVE_CONFIG_H
)

if (ImageMagick_BUILD_SHARED)
  target_compile_options(libImageMagick PRIVATE  -D_DLL )
else()
  target_compile_options(libImageMagick PRIVATE  -D_LIB )
endif()


target_link_libraries(libImageMagick ${JPEG_TURBO_LIB}
  libgif zlibstatic libdeflate_static
  brotlicommon brotlidec brotlienc
  openjp2
  libjemalloc
  OpenEXRCore OpenEXR OpenEXRUtil IlmThread Iex
  webp
  )
