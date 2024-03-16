if(PROJECT_IS_TOP_LEVEL)
  set(
      CMAKE_INSTALL_INCLUDEDIR "include/uni-native-${PROJECT_VERSION}"
      CACHE STRING ""
  )
  set_property(CACHE CMAKE_INSTALL_INCLUDEDIR PROPERTY TYPE PATH)
endif()

include(CMakePackageConfigHelpers)
include(GNUInstallDirs)

# find_package(<package>) call for consumers to find this project
set(package uni-native)

install(
    DIRECTORY
    include/
    "${PROJECT_BINARY_DIR}/export/"
    DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}"
    COMPONENT uni-native_Development
)

install(
    TARGETS uni-native_uni-native
    EXPORT uni-nativeTargets
    RUNTIME #
    COMPONENT uni-native_Runtime
    LIBRARY #
    COMPONENT uni-native_Runtime
    NAMELINK_COMPONENT uni-native_Development
    ARCHIVE #
    COMPONENT uni-native_Development
    INCLUDES #
    DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}"
)

write_basic_package_version_file(
    "${package}ConfigVersion.cmake"
    COMPATIBILITY SameMajorVersion
)

# Allow package maintainers to freely override the path for the configs
set(
    uni-native_INSTALL_CMAKEDIR "${CMAKE_INSTALL_LIBDIR}/cmake/${package}"
    CACHE STRING "CMake package config location relative to the install prefix"
)
set_property(CACHE uni-native_INSTALL_CMAKEDIR PROPERTY TYPE PATH)
mark_as_advanced(uni-native_INSTALL_CMAKEDIR)

install(
    FILES cmake/install-config.cmake
    DESTINATION "${uni-native_INSTALL_CMAKEDIR}"
    RENAME "${package}Config.cmake"
    COMPONENT uni-native_Development
)

install(
    FILES "${PROJECT_BINARY_DIR}/${package}ConfigVersion.cmake"
    DESTINATION "${uni-native_INSTALL_CMAKEDIR}"
    COMPONENT uni-native_Development
)

install(
    EXPORT uni-nativeTargets
    NAMESPACE uni-native::
    DESTINATION "${uni-native_INSTALL_CMAKEDIR}"
    COMPONENT uni-native_Development
)

if(PROJECT_IS_TOP_LEVEL)
  include(CPack)
endif()
