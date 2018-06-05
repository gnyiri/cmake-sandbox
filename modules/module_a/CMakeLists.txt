project(module_a)

set(sources
  src/source_a_1.cc
)

add_library(library_a
  ${sources}
)

target_include_directories(library_a
  PUBLIC
    $<INSTALL_INTERFACE:include>
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

target_compile_options(library_a
  PRIVATE
	-Wall
)

target_compile_features(library_a
  PRIVATE
    cxx_std_11
)

set_target_properties(library_a
  PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${CMAKE_CURRENT_SOURCE_DIR}/include"
  ARCHIVE_OUTPUT_DIRECTORY "${LIBRARY_OUTPUT_PATH}"
  LIBRARY_OUTPUT_DIRECTORY "${LIBRARY_OUTPUT_PATH}"
)

add_subdirectory(test)
