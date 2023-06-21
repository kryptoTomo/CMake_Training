cmake_minimum_required(VERSION 3.3)

if(NOT DEFINED CMAKE_CXX_STANDARD)
  set(CMAKE_CXX_STANDARD 11)
  set(CMAKE_CXX_STANDARD_REQUIRED True)
endif()

project(Consumer)

find_package(MathFunctions REQUIRED)

add_library(consumer consumer.cxx)
target_link_libraries(consumer PUBLIC MathFunctions)

# install the consumer library
install(TARGETS consumer DESTINATION bin EXPORT ConsumerTargets)

# install the configuration targets
install(EXPORT ConsumerTargets
  FILE ConsumerTargets.cmake
  DESTINATION lib/cmake/Consumer
)

include(CMakePackageConfigHelpers)
# generate the config file that is includes the exports
configure_package_config_file(${CMAKE_CURRENT_SOURCE_DIR}/Config.cmake.in
  "${CMAKE_CURRENT_BINARY_DIR}/ConsumerConfig.cmake"
  INSTALL_DESTINATION "lib/cmake/example"
  NO_SET_AND_CHECK_MACRO
  NO_CHECK_REQUIRED_COMPONENTS_MACRO
  )

# install the configuration file
install(FILES
  ${CMAKE_CURRENT_BINARY_DIR}/ConsumerConfig.cmake
  DESTINATION lib/cmake/Consumer
  )

# generate the export targets for the build tree
# needs to be after the install(TARGETS ) command
export(EXPORT ConsumerTargets
  FILE "${CMAKE_CURRENT_BINARY_DIR}/ConsumerTargets.cmake"
)
