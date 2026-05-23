# Libraries may or may not be compiled on the host system.
# This add_subdirectory is left un-gated for unit testing and
# other host side uses.
# add_subdirectory(libs)

if (CMAKE_CROSSCOMPILING)
    add_subdirectory(startup)
    add_subdirectory(apps)
endif()