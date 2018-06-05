project(library_a_test)

# define list of sources
set(sources
  test_module_a.cc
  test_main.cc
)

# add an executable (with main function)
add_executable(library_a_test
  ${sources}
)

# link gtest libraries and the library being tested
if (WIN32)
  target_link_libraries(library_a_test
    library_a
    ${GTEST_LIBRARIES}
    ${GTEST_MAIN_LIBRARIES}
  )
else()
  target_link_libraries(library_a_test
    library_a
    ${GTEST_LIBRARIES}
    ${GTEST_MAIN_LIBRARIES}
    pthread
  )
endif()

# cmake stuff
add_test(NAME library_a_test WORKING_DIRECTORY ${EXECUTABLE_OUTPUT_PATH} COMMAND ${EXECUTABLE_OUTPUT_PATH}/library_a_test)

# add include directories
target_include_directories(library_a_test
  PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/../src
    ${GTEST_INCLUDE_DIRS}
)
