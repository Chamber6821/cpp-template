project(test)
file(GLOB_RECURSE TESTS "*Test.cpp")
file(WRITE ${PROJECT_BINARY_DIR}/null.cpp "")
add_executable(${PROJECT_NAME} ${PROJECT_BINARY_DIR}/null.cpp ${TESTS})

FetchContent_Declare(
  doctest
  GIT_REPOSITORY https://github.com/doctest/doctest.git
  GIT_TAG v2.4.11
)
FetchContent_MakeAvailable(doctest)
target_link_libraries(${PROJECT_NAME} PRIVATE doctest_with_main)

include(${FETCHCONTENT_BASE_DIR}/doctest-src/scripts/cmake/doctest.cmake)
doctest_discover_tests(${PROJECT_NAME})
