cmake_minimum_required(VERSION 3.20)
project(ConanExample VERSION 1.0.0)

# Find conan (or ask user for a path if not found)
find_program(CONAN_EXECUTABLE conan REQUIRED)
# Call conan to ensure all packages are downloaded and accessible
execute_process(
    COMMAND ${CONAN_EXECUTABLE} install ${CMAKE_SOURCE_DIR}
    WORKING_DIRECTORY ${CMAKE_BINARY_DIR}
)

# Add conan generated CMake find modules to module path
# Note: Alternative options exists for this
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_BINARY_DIR})
set(CMAKE_PREFIX_PATH ${CMAKE_MODULE_PATH} ${CMAKE_BINARY_DIR})

# Basic CMake project
find_package(ZLIB REQUIRED)

add_executable(ConanExample main.c)
target_link_libraries(ConanExample PRIVATE ZLIB::ZLIB)
