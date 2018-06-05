set(PACKAGE_NAME "googletest")

find_package(GTest)

if(GTEST_FOUND)
  message(STATUS "${PACKAGE_NAME} was found!")
else()
  message(STATUS "${PACKAGE_NAME} needs to be built as external project!")

  include(ExternalProject)

  ExternalProject_Add(${PACKAGE_NAME}-project
    URL ${CMAKE_SOURCE_DIR}/submodules/${PACKAGE_NAME}/
    PREFIX "${CMAKE_CURRENT_BINARY_DIR}/lib/submodules/${PACKAGE_NAME}"
    # BUILD_IN_SOURCE 1
    CMAKE_ARGS -DCMAKE_CXX_FLAGS=/D_SILENCE_TR1_NAMESPACE_DEPRECATION_WARNING -DCMAKE_ARCHIVE_OUTPUT_DIRECTORY_DEBUG:PATH=DebugLibs -DCMAKE_ARCHIVE_OUTPUT_DIRECTORY_RELEASE:PATH=ReleaseLibs -Dgtest_force_shared_crt=ON -DBUILD_GTEST=ON -DCMAKE_INSTALL_PREFIX=<INSTALL_DIR>
    LOG_DOWNLOAD ON
    LOG_CONFIGURE ON
    LOG_BUILD ON
    LOG_INSTALL ON
  )

  ExternalProject_Get_Property(${PACKAGE_NAME}-project install_dir)
  ExternalProject_Get_Property(${PACKAGE_NAME}-project binary_dir)
  ExternalProject_Get_Property(${PACKAGE_NAME}-project source_dir)

  file(MAKE_DIRECTORY ${install_dir}/include)

  add_library(gtest STATIC IMPORTED)
  set_property(TARGET gtest PROPERTY IMPORTED_LOCATION ${install_dir}/lib/gtest.lib)
  set_property(TARGET gtest APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${install_dir}/include)
  add_dependencies(gtest ${PACKAGE_NAME}-project)
  set(GTEST_LIBRARIES gtest)

  add_library(gtest_main STATIC IMPORTED)
  set_property(TARGET gtest_main PROPERTY IMPORTED_LOCATION ${install_dir}/lib/gtest_main.lib)
  set_property(TARGET gtest_main APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${install_dir}/include)
  add_dependencies(gtest_main ${PACKAGE_NAME}-project)
  set(GTEST_MAIN_LIBRARIES gtest_main) 
endif()

message(STATUS "${PACKAGE_NAME} library: ${GTEST_LIBRARIES}")
message(STATUS "${PACKAGE_NAME} main library: ${GTEST_MAIN_LIBRARIES}")
message(STATUS "${PACKAGE_NAME} include directory: ${GTEST_INCLUDE_DIRS}")
