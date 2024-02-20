cmake_minimum_required(VERSION 3.17)
project(cpp-template CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG ${CMAKE_BINARY_DIR}/bin)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE ${CMAKE_BINARY_DIR}/bin)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_DEBUG ${CMAKE_BINARY_DIR}/bin)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_RELEASE ${CMAKE_BINARY_DIR}/bin)

include(packages.cmake)

add_subdirectory(src/cmd)
add_subdirectory(src/main)
add_subdirectory(src/test)

target_link_libraries(test PRIVATE main-lib)

get_property(apps DIRECTORY src/cmd PROPERTY BUILDSYSTEM_TARGETS)

foreach(app ${apps})
    target_link_libraries(${app} PRIVATE main-lib)
endforeach()

if("${LINT}")
    # TODO: Use cppcheck
    find_program(CLANG_TIDY NAMES "clang-tidy" REQUIRED)
    set(CLANG_TIDY_COMMAND "${CLANG_TIDY};-p;${CMAKE_CURRENT_BINARY_DIR};--use-color")
    set_target_properties(${apps} PROPERTIES CXX_CLANG_TIDY "${CLANG_TIDY_COMMAND}")
endif()
