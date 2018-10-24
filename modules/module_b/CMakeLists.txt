project(module_b)

# set list of sources, needs to be extended when new source arrives
set(sources
  src/source_b_1.cc
)

# define a library (static by default -> liblibrary_b.a or library_a.lib will be generated)
add_library(library_b
  ${sources}
)

# include directories
target_include_directories(library_b
  PUBLIC
    $<INSTALL_INTERFACE:include>
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

# link library_b
target_link_libraries(library_b
  library_a
)

# add compiler flags
target_compile_options(library_b
  PRIVATE
		-Wall
)

target_compile_features(library_b
  PRIVATE
    cxx_std_11
)

if (BUILD_TEST)
	add_subdirectory(test)
endif()