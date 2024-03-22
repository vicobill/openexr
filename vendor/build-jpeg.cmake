set(jpeg_res_dir ${R_EXTRA}/jpeg-res)
# Use configure_file insted of file(COPY)
# to ensure files are updated in src directory
configure_file(
  ${jpeg_res_dir}/CMakeLists.txt
  ${CMAKE_CURRENT_SOURCE_DIR}/libjpeg/CMakeLists.txt
  COPYONLY
)
configure_file(
    ${jpeg_res_dir}/ConfigureJConfig.cmake
  ${CMAKE_CURRENT_SOURCE_DIR}/libjpeg/ConfigureJConfig.cmake
  COPYONLY
)
configure_file(
    ${jpeg_res_dir}/jconfig.h.in
  ${CMAKE_CURRENT_SOURCE_DIR}/libjpeg/jconfig.h.in
  COPYONLY
)
configure_file(
    ${jpeg_res_dir}/libjpeg.pc.cmakein
  ${CMAKE_CURRENT_SOURCE_DIR}/libjpeg/libjpeg.pc.cmakein
  COPYONLY
)
configure_file(
    ${jpeg_res_dir}/libjpeg.la.in
  ${CMAKE_CURRENT_SOURCE_DIR}/libjpeg/libjpeg.la.in
  COPYONLY
)
configure_file(
    ${jpeg_res_dir}/test-libjpeg.sh
  ${CMAKE_CURRENT_SOURCE_DIR}/libjpeg/test-libjpeg.sh
  COPYONLY
)

# Enable testing here AND in libjpeg CMakelists.txt
enable_testing()

# Build libjpeg
# add_subdirectory(libjpeg)
PREQ_LIB(jpeg libjpeg)
set(JPEG_LIBRARY ${JPEG_LIBRARY})
add_library(JPEG::JPEG ALIAS ${JPEG_LIBRARY})
set(JPEG_INCLUDE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/libjpeg)

message(STATUS "<<<<<<<<<<<<<<<<<<<<< END build-jpeg.cmake <<<<<<<<<<<<<<<<<")
