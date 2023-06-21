cmake_minimum_required(VERSION 3.5)
project(ProjectWithASM C CXX ASM)

add_subdirectory(LibraryA)

add_executable(myexec executable.cxx)
target_link_libraries(myexec PRIVATE libA)