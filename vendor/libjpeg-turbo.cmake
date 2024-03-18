# 以ExternalProject的形式，依赖 libjpeg-turbo
set(JPEG_TURBO_ROOT ${CMAKE_CURRENT_SOURCE_DIR}/vendor/libjpeg-turbo)
include(ExternalProject)
ExternalProject_Add(libjpeg-turbo
  PREFIX            ${CMAKE_CURRENT_SOURCE_DIR}/vendor/ibjpeg-turbo
  GIT_REPOSITORY    https://github.com/libjpeg-turbo/libjpeg-turbo
  GIT_TAG           3.0.2
  CONFIGURE_COMMAND "cd ${JPEG_TURBO_ROOT} && cmake -DCMAKE_INSTALL_PREFIX=${JPEG_TURBO_ROOT}/ ."
  BUILD_COMMAND     "cd ${JPEG_TURBO_ROOT} && cmake --build ."
  INSTALL_COMMAND   "cd ${JPEG_TURBO_ROOT} && cmake --install ."
)

set(JPEG_TURBO_LIB ${JPEG_TURBO_ROOT}/libjpeg-turbo.lib)
set(JPET_TURBO_INCLUDE_DIR ${JPEG_TURBO_ROOT}/include)


# include(FetchContent)
# FetchContent_Declare(
#   libjpeg-turbo
#   GIT_REPOSITORY   https://github.com/libjpeg-turbo/libjpeg-turbo.git
#   GIT_TAG          3.0.2
# )
# FetchContent_MakeAvailable(libjpeg-turbo)
