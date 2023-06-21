project(testpolicy)
cmake_minimum_required(VERSION 2.8)


# Change the Policy CMP0002
cmake_policy(SET CMP0002 OLD) 

# Create a library and an executable with the same logical name
add_library(test test.cpp)
add_executable(test test2.cpp)

# Create a target with the same output name
# Hint: Use SET_TARGET_PROPERTIES OUTPUT_NAME
add_executable(test2 test2.cpp)
SET_TARGET_PROPERTIES(test2 PROPERTIES OUTPUT_NAME "test")

# Try with push/pop
cmake_policy(PUSH)
cmake_policy(SET CMP0002 OLD)
add_executable(test test2.cpp)
cmake_policy(POP)
