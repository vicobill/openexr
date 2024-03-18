
file(GLOB_RECURSE LCMS2_SOURCES     "${CMAKE_CURRENT_SOURCE_DIR}/LCMS2/src/*.c")
set(LCMS2_INCLUDE_DIR               "${CMAKE_CURRENT_SOURCE_DIR}/LCMS2/include")

file(TO_CMAKE_PATH "${LCMS2_INCLUDE_DIR}" LCMS2_INCLUDE_DIR)

message(STATUS "=============LCMS2================")
cmake_print_variables(LCMS2_INCLUDE_DIR)
message(STATUS "=============LCMS2================")

add_library(LCMS2 ${LCMS2_SOURCES})
target_include_directories(LCMS2 PUBLIC ${LCMS2_INCLUDE_DIR})
set(LCMS2_LIBRARIES LCMS2)

