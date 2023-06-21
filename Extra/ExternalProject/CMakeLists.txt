cmake_minimum_required(VERSION 3.3)
project(Superbuild)

include(ExternalProject)
ExternalProject_Add(MathFunctions
  SOURCE_DIR ../../Step11
  ...
)

ExternalProject_Add(Consumer
  SOURCE_DIR ../../Step11-consumer
  ...
  DEPENDS MathFunctions
)

