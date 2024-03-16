cmake_minimum_required(VERSION 3.22)

project(example-ios)

enable_testing()

enable_language(CXX)
enable_language(OBJC)

MESSAGE( STATUS "CMAKE_CXX_FLAGS: " ${CMAKE_CXX_FLAGS} )
MESSAGE( STATUS "CMAKE_OBJC_FLAGS: " ${CMAKE_OBJC_FLAGS} )

include(CheckCXXSymbolExists)
check_cxx_symbol_exists(kqueue sys/event.h HAVE_KQUEUE)

if (NOT HAVE_KQUEUE)
message(STATUS "kqueue NOT found!")
else()
message(STATUS "kqueue found!")
endif()

find_library(APPKIT_LIBRARY AppKit )
if (NOT APPKIT_LIBRARY)
message(STATUS "AppKit.framework NOT found!")
else()
message(STATUS "AppKit.framework found! ${APPKIT_LIBRARY}")
endif()

find_library(FOUNDATION_LIBRARY Foundation)
if(NOT FOUNDATION_LIBRARY)
    message(STATUS "Foundation.framework NOT found!")
else()
    message(STATUS "Foundation.framework found! ${FOUNDATION_LIBRARY}")
endif()

find_library(UIKIT_LIBRARY UIKit)
if (NOT UIKIT_LIBRARY)
  message(STATUS "UIKit.framework NOT found!")
else()
  message(STATUS "UIKit.framework found! ${UIKIT_LIBRARY}")
endif()


# Hook up XCTest for the supported plaforms (all but WatchOS)
if(NOT PLATFORM MATCHES ".*WATCHOS.*")
  # Use the standard find_package, broken between 3.14.0 and 3.14.4 at least for XCtest...
  find_package(XCTest)
  # Fallback: Try to find XCtest as host package via toochain macro (should always work)
  find_host_package(XCTest REQUIRED)
endif()

# 包含当前项目的目录
include_directories(${example-ios_SOURCE_DIR})

include(CheckTypeSize)
check_type_size(time_t SIZEOF_TIME_T)

set(SOURCES 
    HelloWorld.cpp
    HelloWorldIOS.mm)

set(HEADERS
    HelloWorld.hpp
    HelloWorldIOS.h)

if(BUILD_SHARED)
    add_library(example SHARED ${SOURCES} ${HEADERS})
    target_link_libraries(example ${FOUNDATION_LIBRARY})
    target_compile_definitions(example PUBLIC IS_BUILDING_SHARED)
    message(STATUS "Building shared version...")
else()
    add_library(example STATIC ${SOURCES} ${HEADERS})
    target_link_libraries(example ${FOUNDATION_LIBRARY})
    message(STATUS "Building static version...")
endif()

# 设置默认安装路径为../example-app/example-lib 目录
if(CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT)
    set(CMAKE_INSTALL_PREFIX ${example-ios_SOURCE_DIR}/../example-ios-app/example-lib CACHE PATH "Install path" FORCE)
endif(CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT)

# 可执行文件
if(PLATFORM MATCHES "MAC.*")
    set(APP_NAME TestApp)
    # 设置可执行文件为macosx下的bundle
    add_executable(${APP_NAME} MACOSX_BUNDLE main.cpp)
    set_target_properties(${APP_NAME} PROPERTIES
        BUNDLE True 
        MACOSX_BUNDLE_GUI_IDENTIFIER    com.ztgame.qiu.helloworld
        MACOSX_BUNDLE_NAME              helloworld
        MACOSX_BUNDLE_BUNDLE_VERSION    "0.1"
        MACOSX_BUNDLE_SHORT_VERSION_STRING "0.1"
        )
        
endif()

# XCode项目的调试信息设置
set_xcode_property(example GCC_GENERATE_DEBUGGING_SYMBOLS YES "All")

# 安装
if (PLATFORM MATCHES "MAC.*")
    install(TARGETS ${APP_NAME}
        BUNDLE DESTINATION . COMPONENT Runtime 
        RUNTIME DESTINATION bin COMPONENT Runtime 
        LIBRARY DESTINATION lib 
        ARCHIVE DESTINATION lib/static
    )
    # 别忘了后缀 .app
    set(APPS "${CMAKE_INSTALL_PREFIX}/${APP_NAME}.app")

    # 查找依赖项的路径
    set(DIRS ${CMAKE_BINARY_DIR})

    install(CODE "include(BundleUtilities)
        fixup_bundle(\"${APPS}\" \"\" \"${DIRS}\")"
    )

    set(CPACK_GENERATOR "DRAGNDROP")
    include(CPack)
else()
    install(TARGETS example 
        LIBRARY DESTINATION lib
        ARCHIVE DESTINATION lib/static
    )
endif()

install(FILES ${HEADERS} DESTINATION include)