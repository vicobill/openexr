# ============ 构建 file ================={{
set(FILE_VERSION 5.45)


set(WIN_COMPAT_SOURCES
    file/src/asctime_r.c
    file/src/asprintf.c
    file/src/ctime_r.c
    file/src/dprintf.c
    file/src/getline.c
    file/src/gmtime_r.c
    file/src/localtime_r.c
    file/src/pread.c
    file/src/strcasestr.c
    file/src/strlcat.c
    file/src/strlcpy.c
    file/src/vasprintf.c
    file/src/fmtcheck.c

)
set(LIBMAGIC_SOURCE_FILES
    ${WIN_COMPAT_SOURCES}
    file/src/apprentice.c
    file/src/apptype.c
    file/src/ascmagic.c
    file/src/buffer.c
    file/src/cdf.c
    file/src/cdf_time.c
    file/src/compress.c
    file/src/der.c
    file/src/encoding.c
    file/src/fsmagic.c
    file/src/funcs.c
    file/src/is_json.c
    file/src/is_tar.c
    file/src/is_csv.c
    file/src/is_simh.c
    file/src/print.c
    file/src/readcdf.c
    file/src/softmagic.c
    ${CMAKE_CURRENT_BINARY_DIR}/file/src/magic.c # 自定义的2个文件
    ${CMAKE_CURRENT_BINARY_DIR}/file/src/readelf.c

)


# replace the version in the magic.h.in and write it to magic.h
# 写入版本信息到 magic.h 文件中
file(READ file/src/magic.h.in MAGIC_H_CONTENT)
string(REPLACE "." "" FILE_VERSION_WITHOUT_DOT "${FILE_VERSION}")
string(REPLACE "X.YY" ${FILE_VERSION_WITHOUT_DOT} MAGIC_H_CONTENT_NEW "${MAGIC_H_CONTENT}")
file(WRITE ${CMAKE_CURRENT_BINARY_DIR}/file/src/magic.h "${MAGIC_H_CONTENT_NEW}")

if(WIN32)
    set(HAVE_UNISTD_H 1)
    set(HAVE_GETOPT_H 1)
    set(HAVE_DIRENT_H 1)

    # 自定义文件
    file(READ file/src/readelf.c READELF_C_CONTENT)
    string(CONCAT READELF_C_CONTENT_NEW "#include <dirent.h>\n" "${READELF_C_CONTENT}")
    file(WRITE ${CMAKE_CURRENT_BINARY_DIR}/file/src/readelf.c "${READELF_C_CONTENT_NEW}")

    file(READ file/src/magic.c MAGIC_C_CONTENT)
    string(CONCAT MAGIC_C_CONTENT_NEW "#include <dirent.h>\n" "${MAGIC_C_CONTENT}")
    file(WRITE ${CMAKE_CURRENT_BINARY_DIR}/file/src/magic.c "${MAGIC_C_CONTENT_NEW}")

    # WARNING: 比较特殊
    file(READ file/src/file.h HEADER_CONTENT LIMIT 256 )
    string(REGEX MATCH  "#undef S_IFLNK" HAS_UNDEFED ${HEADER_CONTENT}  )

    # cmake_print_variables(HEADER_CONTENT HAS_UNDEFED)
    if(NOT HAS_UNDEFED)
        file(READ file/src/file.h FILE_H_CONTENT)

        string(CONCAT FILE_H_CONTENT_NEW
                    "#ifdef WIN32\n#include <unistd.h>\n#include <dirent.h>\n#undef S_IFLNK\n#undef S_IFSOCK\n#endif\n"
                    "${FILE_H_CONTENT}"
        )
        file(WRITE file/src/file.h "${FILE_H_CONTENT_NEW}")
    endif()

    # patch test.c and include <getopt.h>
    file(READ file/tests/test.c TEST_C_CONTENT)
    string(CONCAT TEST_C_CONTENT_NEW "#include <getopt.h>\n" "${TEST_C_CONTENT}")
    file(WRITE ${CMAKE_CURRENT_BINARY_DIR}/file/tests/test.c "${TEST_C_CONTENT_NEW}")
else()
  configure_file(file/src/magic.c   ${CMAKE_CURRENT_BINARY_DIR}/file/src/magic.c    COPYONLY)
  configure_file(file/src/readelf.c ${CMAKE_CURRENT_BINARY_DIR}/file/src/readelf.c  COPYONLY)
  configure_file(file/tests/test.c  ${CMAKE_CURRENT_BINARY_DIR}/file/tests/test.c   COPYONLY)
endif()

# 额外的生成文件
configure_file(
  ${CMAKE_CURRENT_SOURCE_DIR}/magic-config.h.in
  ${CMAKE_CURRENT_BINARY_DIR}/file/src/config.h
  @ONLY)

set(MAGIC_LIB_NAME magic)
if(WIN32)
    set(MAGIC_LIB_NAME libmagic)
endif()

add_library(${MAGIC_LIB_NAME} SHARED ${LIBMAGIC_SOURCE_FILES})

# 同时生成 libmagic-static.lib 静态库
add_library(${MAGIC_LIB_NAME}-static STATIC $<TARGET_OBJECTS:${MAGIC_LIB_NAME}>)
set_target_properties(${MAGIC_LIB_NAME}-static PROPERTIES OUTPUT_NAME ${MAGIC_LIB_NAME})

target_compile_definitions(${MAGIC_LIB_NAME}
    PUBLIC HAVE_CONFIG_H VERSION="${FILE_VERSION}" PCRE2_STATIC)

set(MAGIC_INCLUDE_DIRS
pcre2/src
${CMAKE_CURRENT_SOURCE_DIR}/pcre2/src
file/src
${CMAKE_CURRENT_BINARY_DIR}/file/src/)

target_include_directories( ${MAGIC_LIB_NAME}
    PUBLIC ${MAGIC_INCLUDE_DIRS}
)

add_subdirectory(pcre2)


target_link_libraries(${MAGIC_LIB_NAME} pcre2-posix)
if(WIN32)
    target_compile_definitions(${MAGIC_LIB_NAME} INTERFACE WIN32_LEAN_AND_MEAN WIN32)
    target_include_directories(${MAGIC_LIB_NAME}
        PRIVATE ${R_EXTRA}/file-win ${R_EXTRA}/file-win/dirent/include ${R_EXTRA}/file-win/getopt)
    target_link_libraries(${MAGIC_LIB_NAME} shlwapi)
    target_include_directories(pcre2test
        PRIVATE ${R_EXTRA}/file-win ${R_EXTRA}/file-win/dirent/include ${R_EXTRA}/file-win/getopt)
    target_include_directories(pcre2grep
        PRIVATE ${R_EXTRA}/file-win ${R_EXTRA}/file-win/dirent/include ${R_EXTRA}/file-win/getopt)
endif()

# copy /pcre2posix.h to regex.h so it can be used as posix regex libary
configure_file(
    ${CMAKE_CURRENT_SOURCE_DIR}/pcre2/src/pcre2posix.h
    ${CMAKE_CURRENT_SOURCE_DIR}/pcre2/src/regex.h
    COPYONLY
)

add_executable(file             file/src/file.c)
add_executable(file_test        ${CMAKE_CURRENT_BINARY_DIR}/file/tests/test.c)
target_link_libraries(file      ${MAGIC_LIB_NAME} pcre2-posix)
target_link_libraries(file_test ${MAGIC_LIB_NAME} pcre2-posix)
add_dependencies(file ${MAGIC_LIB_NAME}-static) # 添加依赖项，libmagic-static 会先编译
add_dependencies(file_test ${MAGIC_LIB_NAME}-static)
if(WIN32)
    target_link_libraries(file      shlwapi)
    target_link_libraries(file_test shlwapi)
    # 这里的包含目录，隐含了 libmagic-static 的包含目录
    target_include_directories(file
        PUBLIC ${MAGIC_INCLUDE_DIRS}
        PRIVATE ${R_EXTRA}/file-win ${R_EXTRA}/file-win/dirent/include ${R_EXTRA}/file-win/getopt)
    target_include_directories(file_test
        PUBLIC ${MAGIC_INCLUDE_DIRS}
        PRIVATE ${R_EXTRA}/file-win ${R_EXTRA}/file-win/dirent/include ${R_EXTRA}/file-win/getopt)
endif()

# this tests all because of time-zone or crlf errors
set(DISABLED_TESTS
    gedcom
    fit-map-data
    regex-eol
    # it seems like the detection of multiple files is not working
    # to be tested after pcre update
    multiple
)

enable_testing()
file(GLOB TESTFILES "file/tests/*.testfile")
foreach(TEST_FILE ${TESTFILES})
    # extract testname from path and generate command
    string(REGEX MATCH "(.*)\.testfile" TESTPATH ${TEST_FILE})
    set(TESTPATH ${CMAKE_MATCH_1})
    string(REGEX MATCH "([a-zA-Z0-9_]|-|\\.)+$" TESTNAME ${TESTPATH})
    if(NOT ${TESTNAME} IN_LIST DISABLED_TESTS)
        add_test(NAME ${TESTNAME}
            COMMAND ${CMAKE_CURRENT_BINARY_DIR}/file_test ${TEST_FILE} ${TESTPATH}.result)
    endif()
endforeach()

## 生成magic.mgc文件
# Following is the compilation of the magic file
set(MAGIC_FRAGMENT_DIR      file/magic/Magdir)
file(GLOB MAGIC_FRAGMENTS   ${MAGIC_FRAGMENT_DIR}/*)

# Prepare a temporary file to "cat" to:
file(WRITE magic.in "")

# Call the "cat" function for each input file
foreach(MAGIC_FRAGMENT ${MAGIC_FRAGMENTS})
    cat(${MAGIC_FRAGMENT} magic.in)
endforeach()

# Copy the temporary file to the final location
configure_file(magic.in magic COPYONLY)

add_custom_command(
    OUTPUT magic.mgc
    COMMAND file -C -m magic
    DEPENDS file
    COMMENT "Compiling magic file"
)
is_standalone(IS_STANDALONE)
# 非PC下不运行
if(IS_STANDALONE)
    add_custom_target(magic_mgc ALL DEPENDS magic.mgc)
    set_target_properties(magic_mgc PROPERTIES FOLDER libmagic)
endif()
set_target_properties(file file_test PROPERTIES FOLDER libmagic/tests)
set_target_properties(${MAGIC_LIB_NAME} ${MAGIC_LIB_NAME}-static PROPERTIES FOLDER libmagic)

# ======================================}}

