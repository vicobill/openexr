
# options 
set(MAGICKCORE_QUANTUM_DEPTH 16 CACHE STRING "MagickCore Quantum Depth,values 8/16/24/32")
set(MAGICKCORE_HDRI_ENABLE OFF CACHE BOOL "MagickCore HDRI support")
option(MAGICKCORE_BUILD_MODULES "build coders & filters as modules" OFF)


option(WITH_JEMALLOC "use jemalloc as memory allocator library" ON)
option(WITH_TCMALLOC "use tcmalloc as memory allocator library" OFF)
option(WITH_DMALLOC "use dmalloc as memory allocator library" OFF)

option(WITH_AUTOTRACE "build ImageMagick with `AutoTrace` library" OFF)
option(WITH_BZIP2 "build ImageMagick with `bzip2` library" OFF)
option(WITH_CAIRO "build ImageMagick with `cairo` library" OFF)
option(WITH_LIBHEIF "build ImageMagick with libheif" OFF)
option(WITH_JBIG "build ImageMagick with JBIG" OFF)
option(WITH_JPEG "build ImageMagick with JPEG" ON)
option(WITH_JXL "build ImageMagick with jpeg-xl library" OFF)
option(WITH_LCMS "build ImageMagick with LCMS library" OFF)
option(WITH_OPENJP2 "build ImageMagick with OpenJpeg library" ON)
option(WITH_LQR "build ImageMagick with LQR library" OFF)
option(WITH_LTDL "build ImageMagick  with LTDL(use for OpenCL)" OFF)
option(WITH_LZMA "build ImageMagick with LZMA library" OFF) 
option(WITH_OPENEXR "build ImageMagick with OpenEXR library" ON)
option(WITH_PANGOCAIRO "build ImageMagick with Pango Cairo library" OFF)
option(WITH_PNG "build ImageMagick with PNG library" ON)
option(WITH_RAQM "build ImageMagick with RAQM library" OFF)
option(WITH_RAW "build ImageMagick with libraw library" OFF)
option(WITH_RSVG "build ImageMagick with `rsvg` library" OFF)
option(WITH_TIFF "build ImageMagick with `libtiff` library" OFF)
option(WITH_WEBPMUX "build ImageMagick with WebP Mux library" OFF)
option(WITH_WEBP "build ImageMagick with `WebP`  library" ON)
option(WITH_WMF "build ImageMagick with WMF  library" OFF)
option(WITH_XML "build ImageMagick with `libxml2` library" OFF)
option(WITH_ZIP "build ImageMagick with `zip` library" OFF)
option(WITH_ZLIB "build ImageMagick with `zlib` library" ON)
option(WITH_ZSTD "build ImageMagick with `zstd` library" OFF)
option(WITH_FLIF "build ImageMagick with `flif` library" OFF)
option(WITH_FONTCONFIG "build ImageMagick with `FontConfig` library" OFF)
option(WITH_FLASHPIX "build ImageMagick with `FlashPIX` library" OFF)
option(WITH_FREETYPE "build ImageMagick with `FreeType` library" OFF)
option(WITH_GHOSTSCRIPT "build ImageMagick with `GhostScript` library" OFF)
option(WITH_GVC "build ImageMagick with `GVC` library" OFF)

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
