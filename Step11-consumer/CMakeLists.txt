cmake_minimum_required(VERSION 3.3)
project(Consumer)

find_package(MathFunctions 1.0 REQUIRED)

add_executable(Tutorial tutorial.cxx)
target_link_libraries(Tutorial MathFunctions)
