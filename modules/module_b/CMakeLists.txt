project(module_b)

set(sources
  src/source_b_1.cc
)

add_library(library_b
  ${sources}
)

target_include_directories(library_b
  PUBLIC
    $<INSTALL_INTERFACE:include>
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

target_link_libraries(library_b
  library_a
)

target_compile_options(library_b
  PRIVATE
	-Wall
)

target_compile_features(library_b
  PRIVATE
    cxx_std_11
)

set_target_properties(library_b
  PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${CMAKE_CURRENT_SOURCE_DIR}/include"
  ARCHIVE_OUTPUT_DIRECTORY "${LIBRARY_OUTPUT_PATH}"
  LIBRARY_OUTPUT_DIRECTORY "${LIBRARY_OUTPUT_PATH}"
)

add_subdirectory(test)