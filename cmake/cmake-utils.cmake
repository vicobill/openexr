# Creates a custom "graphviz" target that outputs useful information
# about the project's (and sub target) lib deps/linkage relationships
function(run_active_cmake_diagnostics)
    # enabled with -D DEPENDENCY_DIAGNOSTICS=ON
    if(DEPENDENCY_DIAGNOSTICS MATCHES ON)
        # prints a dependency hierarchy for all targets in project
        set_property(GLOBAL PROPERTY GLOBAL_DEPENDS_DEBUG_MODE ON)
    endif()

    # enabled with -D GRAPHVIZ_OUTPUT=ON
    if(GRAPHVIZ_OUTPUT MATCHES ON)
        # Outputs graphviz dot files and generates png images showing dependency
        # relationships for top level project and all targets it contains.
        # All files will be generated in src/build/graphviz_output by default.
        #
        # Note: png image graph generation requires graphviz to be installed
        include(${CMAKE_SOURCE_DIR}/CMakeGraphVizOptions.cmake)
        add_custom_target(graphviz ALL

            # TODO: wipe out ${CMAKE_BINARY_DIR}/graphviz_output dir here
            COMMAND ${CMAKE_COMMAND} "--graphviz=${CMAKE_BINARY_DIR}/graphviz_output/${PROJECT_NAME}.dot" .
            COMMAND for dot_file in \$$\(find "${CMAKE_BINARY_DIR}/graphviz_output/*.dot*" ! -name \"*.png\" \)\; do echo \"Generating \$\${dot_file}.png\" && dot -Tpng \"\$$dot_file\" -o \"\$$dot_file.png\" \; done;
            WORKING_DIRECTORY "${CMAKE_BINARY_DIR}"
        )
    endif()
endfunction(run_active_cmake_diagnostics)

# function to output all CMAKE variables along with their
# values using a case insentive regex match
#
# examples:
# 1. print all cmake variables:
#    > dump_cmake_variables(".*")
# 2. print all boolt cmake variables:
#    > dump_cmake_variables("^boost.*")
function(dump_cmake_variables)
    get_cmake_property(_vars VARIABLES)
    list(SORT _vars)

    foreach(_var ${_vars})
        if(ARGV0)
            unset(MATCHED)

            # case insenstitive match
            string(TOLOWER "${ARGV0}" ARGV0_lower)
            string(TOLOWER "${_var}" _var_lower)

            string(REGEX MATCH ${ARGV0_lower} MATCHED ${_var_lower})

            if(NOT MATCHED)
                continue()
            endif()
        endif()


        set(_value ${${_var}})
        list(LENGTH _value _val_list_len)
        if(_val_list_len GREATER 1)
            message(DEBUG "    [${_var}] =>")
            foreach(_val ${_value})
                message(DEBUG "        - ${_val}")
            endforeach()
        else()
            message(DEBUG "    [${_var}] => ${_value}")
        endif()
    endforeach()
endfunction()

# prints a collection of useful C++ project configuration values
function(print_project_variables)
    message(DEBUG "")
    message(DEBUG "DEBUG CMake Cache Variable Dump")
    message(DEBUG "=============================================")
    message(DEBUG "")
    dump_cmake_variables(".*")

    message(NOTICE "")
    message(NOTICE "Project Configuration Settigs: " ${PROJECT_NAME})
    message(NOTICE "=============================================")
    message(NOTICE "")
    message(NOTICE "Build Configuration")
    message(NOTICE "    CMAKE_SYSTEM_PROCESSOR:..................: " ${CMAKE_SYSTEM_PROCESSOR})
    message(NOTICE "    CMAKE_HOST_SYSTEM_NAME:..................: " ${CMAKE_HOST_SYSTEM_NAME})
    message(NOTICE "    CMAKE_BUILD_TYPE:........................: " ${CMAKE_BUILD_TYPE})
    message(NOTICE "    CMAKE_CXX_COMPILER_ARCHITECTURE_ID:......: " ${CMAKE_CXX_COMPILER_ARCHITECTURE_ID})
    message(NOTICE "    CMAKE_CXX_STANDARD:......................: " ${CMAKE_CXX_STANDARD})
    message(NOTICE "    CMAKE_CXX_COMPILER_VERSION:..............: " ${CMAKE_CXX_COMPILER_VERSION})
    message(NOTICE "    CMAKE_CXX_SIZEOF_DATA_PTR:...............: " ${CMAKE_CXX_SIZEOF_DATA_PTR})
    message(NOTICE "    CMAKE_GENERATOR:.........................: " ${CMAKE_GENERATOR})
    message(NOTICE "    CMAKE_VERSION:...........................: " ${CMAKE_VERSION})
    message(NOTICE "    CMAKE_MINIMUM_REQUIRED_VERSION:..........: " ${CMAKE_MINIMUM_REQUIRED_VERSION})
    message(NOTICE "    VCPKG_TARGET_TRIPLET.....................: " ${VCPKG_TARGET_TRIPLET})
    message(NOTICE "    CMAKE_DEBUG_POSTFIX......................: " ${CMAKE_DEBUG_POSTFIX})
    message(NOTICE "")
    message(NOTICE "CMake Paths")
    message(NOTICE "    CMAKE_CURRENT_SOURCE_DIR.................: " ${CMAKE_CURRENT_SOURCE_DIR})
    message(NOTICE "    CMAKE_TOOLCHAIN_FILE:....................: " ${CMAKE_TOOLCHAIN_FILE})
    message(NOTICE "    CMAKE_SOURCE_DIR:........................: " ${CMAKE_SOURCE_DIR})
    message(NOTICE "    CMAKE_COMMAND:...........................: " ${CMAKE_COMMAND})
    message(NOTICE "    CLANG_FORMAT_PROGRAM:....................: " ${CLANG_FORMAT_PROGRAM})
    message(NOTICE "    SCONS_PROGRAM:...........................: " ${SCONS_PROGRAM})
    message(NOTICE "    CMAKE_CXX_COMPILER:......................: " ${CMAKE_CXX_COMPILER})
    message(NOTICE "    CMAKE_LINKER:............................: " ${CMAKE_LINKER})
    message(NOTICE "    CMAKE_BUILD_TOOL:........................: " ${CMAKE_BUILD_TOOL})
    message(NOTICE "    vcpkg_executable:........................: " ${vcpkg_executable})
    message(NOTICE "    godot_debug_editor_executable:...........: " ${godot_debug_editor_executable})
    message(NOTICE "    CMAKE_INSTALL_PREFIX:....................: " ${CMAKE_INSTALL_PREFIX})
    message(NOTICE "    CMAKE_BINARY_DIR:........................: " ${CMAKE_BINARY_DIR})
    message(NOTICE "    GDEXTENSION_LIB_PATH:....................: " ${GDEXTENSION_LIB_PATH})
    message(NOTICE "")
endfunction(print_project_variables)

# ================ cat(in_file out_file) ==========
# 把IN_FILE文件内容附加到OUT_FILE中
function(cat IN_FILE OUT_FILE)
  file(READ ${IN_FILE} CONTENTS)
  file(APPEND ${OUT_FILE} "${CONTENTS}")
endfunction()


# set_if_undefined(<variable> [<value>]...)
#
# Set variable if it is not defined.
macro(set_if_undefined variable)
    if(NOT DEFINED "${variable}")
        set("${variable}" ${ARGN})
    endif()
endmacro()


# win_copy_deps_to_target_dir(<target> [<target-dep>]...)
#
# Creates custom command to copy runtime dependencies to target's directory after building the target.
# Function does nothing if platform is not Windows and ignores all dependencies except shared libraries.
# On CMake 3.21 or newer, function uses TARGET_RUNTIME_DLLS generator expression to obtain list of runtime
# dependencies. Specified dependencies (if any) are still used to find and copy PDB files for debug builds.
function(win_copy_deps_to_target_dir target)
    if(NOT WIN32)
        return()
    endif()

    set(has_runtime_dll_genex NO)

    if(CMAKE_MAJOR_VERSION GREATER 3 OR CMAKE_MINOR_VERSION GREATER_EQUAL 21)
        set(has_runtime_dll_genex YES)

        add_custom_command(TARGET ${target} POST_BUILD
            COMMAND ${CMAKE_COMMAND} -P "${mylib_SOURCE_DIR}/cmake/silent_copy.cmake"
                "$<TARGET_RUNTIME_DLLS:${target}>" "$<TARGET_FILE_DIR:${target}>"
            COMMAND_EXPAND_LISTS)
    endif()

    foreach(dep ${ARGN})
        get_target_property(dep_type ${dep} TYPE)

        if(dep_type STREQUAL "SHARED_LIBRARY")
            if(NOT has_runtime_dll_genex)
                add_custom_command(TARGET ${target} POST_BUILD
                    COMMAND ${CMAKE_COMMAND} -P "${mylib_SOURCE_DIR}/cmake/silent_copy.cmake"
                        "$<TARGET_FILE:${dep}>" "$<TARGET_PDB_FILE:${dep}>" "$<TARGET_FILE_DIR:${target}>"
                    COMMAND_EXPAND_LISTS)
            else()
                add_custom_command(TARGET ${target} POST_BUILD
                    COMMAND ${CMAKE_COMMAND} -P "${mylib_SOURCE_DIR}/cmake/silent_copy.cmake"
                        "$<TARGET_PDB_FILE:${dep}>" "$<TARGET_FILE_DIR:${target}>"
                    COMMAND_EXPAND_LISTS)
            endif()
        endif()
    endforeach()
endfunction()


function(is_standalone out_var)
if(CMAKE_SYSTEM_NAME STREQUAL "Linux" OR
    CMAKE_SYSTEM_NAME STREQUAL "Darwin" OR
    CMAKE_SYSTEM_NAME STREQUAL "Windows")
  set(out_var 1 PARENT_SCOPE)
  endif()
endfunction()
