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

if (BUILD_TEST)
	add_subdirectory(test)
endif()
