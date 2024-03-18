include(./PREQ_LIB.cmake)
# include(./build-jemalloc.cmake)
include(./build-LCMS2.cmake)
set(LCMS2_LIBRARY LCMS2)


# add_subdirectory(libdeflate)
# add_subdirectory(openexr)
# add_subdirectory(libheif)
# add_subdirectory(brotli)
# add_subdirectory(Imath)
# add_subdirectory(pcre2)

# include(./libjpeg-turbo.cmake)

# include(FetchContent)



# add_subdirectory(zlib-ng)
# add_subdirectory(minizip-ng)

add_subdirectory(LibRaw-cmake)
set(RAW_LIBRARY raw)



# add_subdirectory(giflib-5.2.2)

include(./build-libmagic.cmake)


## ======================= ImageMagick
# include(./build-imagemagick.cmake)

# include(./folder-targets.cmake)
