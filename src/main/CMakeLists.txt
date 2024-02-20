project(main-lib)
file(GLOB_RECURSE SOURCES "*.h *.c *.hpp *.cpp")

if(SOURCES)
  add_library(${PROJECT_NAME} ${SOURCES})
  target_include_directories(${PROJECT_NAME} PUBLIC .)
else()
  add_library(${PROJECT_NAME} INTERFACE)
endif()
