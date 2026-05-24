cmake_minimum_required(VERSION 3.22)

# The pico boards do not need a toolchain file like other platforms. They
# do however need to execute some code before the project() call to setup
# the environment and supporting tools.
if(BOARD_NAME STREQUAL "pico2_w")
    include("deps/pico-sdk/external/pico_sdk_import.cmake")
endif()

project(Arinc429Dashboard
    VERSION
        0.0.1
    LANGUAGES
        C
        CXX
        ASM
)

set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

# Initialize the pico board SDK
if(BOARD_NAME STREQUAL "pico2_w")
    pico_sdk_init()
endif()

# The pico SDK setup pre-builds some libraries and tools during the init
# function call that error when the project is configured to build assembly
# files. The work around is to not have ASM in the project() and add it
# after the SDK has been initialized.
# enable_language(ASM)

add_subdirectory(deps)
add_subdirectory(source)
