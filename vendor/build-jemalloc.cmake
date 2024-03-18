file(GLOB_RECURSE JEMALLOC_SOURCES jemalloc/src/*.c)
set(JEMALLOC_INCLUDE_DIR jemalloc/include)

add_library(jemalloc ${JEMALLOC_SOURCES})
target_include_directories(jemalloc PUBLIC ${JEMALLOC_INCLUDE_DIR})
