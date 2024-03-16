cmake_minimum_required(VERSION 3.14)

include(cmake/prelude.cmake)

project(
    uni-native
    VERSION 0.1.0
    DESCRIPTION "Short description"
    HOMEPAGE_URL "https://example.com/"
    LANGUAGES CXX
)

include(cmake/project-is-top-level.cmake)
include(cmake/variables.cmake)

# ---- Declare library ----

add_library(
    uni-native_uni-native
    source/uni-native.cpp
)
add_library(uni-native::uni-native ALIAS uni-native_uni-native)

include(GenerateExportHeader)
generate_export_header(
    uni-native_uni-native
    BASE_NAME uni-native
    EXPORT_FILE_NAME export/uni-native/uni-native_export.hpp
    CUSTOM_CONTENT_FROM_VARIABLE pragma_suppress_c4251
)

if(NOT BUILD_SHARED_LIBS)
  target_compile_definitions(uni-native_uni-native PUBLIC UNI_NATIVE_STATIC_DEFINE)
endif()

set_target_properties(
    uni-native_uni-native PROPERTIES
    CXX_VISIBILITY_PRESET hidden
    VISIBILITY_INLINES_HIDDEN YES
    VERSION "${PROJECT_VERSION}"
    SOVERSION "${PROJECT_VERSION_MAJOR}"
    EXPORT_NAME uni-native
    OUTPUT_NAME uni-native
)

target_include_directories(
    uni-native_uni-native ${warning_guard}
    PUBLIC
    "\$<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/include>"
)

target_include_directories(
    uni-native_uni-native SYSTEM
    PUBLIC
    "\$<BUILD_INTERFACE:${PROJECT_BINARY_DIR}/export>"
)

target_compile_features(uni-native_uni-native PUBLIC cxx_std_17)

# ---- Install rules ----

if(NOT CMAKE_SKIP_INSTALL_RULES)
  include(cmake/install-rules.cmake)
endif()

# ---- Developer mode ----

if(NOT uni-native_DEVELOPER_MODE)
  return()
elseif(NOT PROJECT_IS_TOP_LEVEL)
  message(
      AUTHOR_WARNING
      "Developer mode is intended for developers of uni-native"
  )
endif()

include(cmake/dev-mode.cmake)
