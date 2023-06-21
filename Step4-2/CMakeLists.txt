cmake_minimum_required(VERSION 3.10)

# set the project name and version
project(Tutorial VERSION 1.0)

# specify the C++ standard
add_library(tutorial_compiler_flags INTERFACE)
target_compile_features(tutorial_compiler_flags INTERFACE cxx_std_11)

# TODO 1: Use a predefined variable to set the flag -Wall only when the
# build configuration DEBUG is selected

# TODO 2: Use the command file to generate a file containing the compile
# features of the target Tutorial
# You will need the generator expression $<TARGET_PROPERTY:tgt,prop> and the
# property COMPILE_FEATURES

# should we use our own math functions
option(USE_MYMATH "Use tutorial provided math implementation" ON)

# configure a header file to pass some of the CMake settings
# to the source code
configure_file(TutorialConfig.h.in TutorialConfig.h)

# TODO 4: Remove this variable declaration, we will use conditional linking instead
set(EXTRA_LIBS tutorial_compiler_flags)

# add the MathFunctions library
if(USE_MYMATH)
  add_subdirectory(MathFunctions)
  list(APPEND EXTRA_LIBS MathFunctions)
endif()

# add the executable
add_executable(Tutorial tutorial.cxx)

target_link_libraries(Tutorial PUBLIC ${EXTRA_LIBS})

# TODO 5: link Tutorial to tutorial_compiler_flags only if the build configuration DEBUG
# is selected. You will need to nest the generator expression $<condition:true_string>
# and $<CONFIG:cfgs>.  
# Tip: CMake is fine with linking a library with nothing. e.g.: target_link_libraries(Tutorial PUBLIC )

# add the binary tree to the search path for include files
# so that we will find TutorialConfig.h
target_include_directories(Tutorial PUBLIC
  "${PROJECT_BINARY_DIR}"
)
