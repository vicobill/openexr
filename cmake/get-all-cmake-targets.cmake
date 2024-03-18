function (get_all_cmake_targets out_var current_dir)
    get_property(targets DIRECTORY ${current_dir} PROPERTY BUILDSYSTEM_TARGETS)
    get_property(subdirs DIRECTORY ${current_dir} PROPERTY SUBDIRECTORIES)

    foreach(subdir ${subdirs})
        get_all_cmake_targets(subdir_targets ${subdir})
        list(APPEND targets ${subdir_targets})
    endforeach()

    set(${out_var} ${targets} PARENT_SCOPE)
endfunction()

function (group_sources_under current_dir)
    get_all_cmake_targets(_all_targets ${current_dir})
    set_target_properties(${_all_targets} PROPERTIES FOLDER ${current_dir})
endfunction()

# TEST
# Run at end of top-level CMakeLists
# get_all_cmake_targets(all_targets ${CMAKE_CURRENT_LIST_DIR})
