add_subdirectory(LibraryB)
add_subdirectory(LibraryC)

add_library(libA libA.cxx)
target_link_libraries(libA PUBLIC libB)
target_link_libraries(libA PUBLIC libC)
