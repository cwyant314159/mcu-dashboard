add_subdirectory(device)

# Host applications are not compatible with cross compiled target
# toolchains.
if (NOT CMAKE_CROSSCOMPILING)
    add_subdirectory(host)
endif()