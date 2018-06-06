project(sts-library)

cmake_minimum_required(VERSION 3.9)

set(SW_VERSION_MAJOR 0)
set(SW_VERSION_MINOR 0)
set(SW_VERSION_PATCH 1)

# whether to build unit tests or not
option(BUILD_TEST "Build Unit Tests" ON)
# whether to build examples or not
option(BUILD_EXAMPLE "Build Examples" ON)
# dynamic or static libraries
option(BUILD_SHARED_LIBS "Build Shared Libs" OFF)

# all executables will be generated here
set(EXECUTABLE_OUTPUT_PATH ${CMAKE_SOURCE_DIR}/bin)
# all libraries will be generated here
set(LIBRARY_OUTPUT_PATH ${CMAKE_SOURCE_DIR}/lib)

if(BUILD_TEST)
  enable_testing()
  include(cmake/googletest.cmake)

  # valgrind is a dynamic analyser tool, it will be normally applied on unit tests
  find_program(VALGRIND "valgrind")
endif(BUILD_TEST)

add_subdirectory(modules)
