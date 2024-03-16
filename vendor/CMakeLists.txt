# include(./pre-libpng.cmake)

# add_subdirectory(libdeflate)
# add_subdirectory(openexr)
# add_subdirectory(libheif)
# add_subdirectory(brotli)
# add_subdirectory(Imath)
# add_subdirectory(pcre2)

# include(./libjpeg-turbo.cmake)

# include(FetchContent)

# FetchContent_Declare(
#   libjpeg-turbo
#   GIT_REPOSITORY   https://github.com/libjpeg-turbo/libjpeg-turbo.git
#   GIT_TAG          3.0.2
# )
# FetchContent_MakeAvailable(libjpeg-turbo)

# add_subdirectory(zlib-ng)
# add_subdirectory(minizip-ng)



# add_subdirectory(giflib-5.2.2)

include(./build-libmagic.cmake)


## ======================= ImageMagick
# include(./build-imagemagick.cmake)

# include(./folder-targets.cmake)
