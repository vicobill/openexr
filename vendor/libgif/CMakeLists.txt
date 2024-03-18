cmake_minimum_required(VERSION 3.22)

project(libgif 
VERSION 5.2.2
LANGUAGES C)

set(GIF_SOURCES 
dgif_lib.c egif_lib.c gifalloc.c gif_err.c gif_font.c 
gif_hash.c openbsd-reallocarray.c
)

set(GIF_HEADERS
gif_hash.h  gif_lib.h  gif_lib_private.h
)

add_library(libgif SHARED ${GIF_SOURCES} ${GIF_HEADERS})
target_include_directories(libgif INTERFACE ${CMAKE_CURRENT_SOURCE_DIR})

