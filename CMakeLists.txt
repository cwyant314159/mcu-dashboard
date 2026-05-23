cmake_minimum_required(VERSION 3.22)

project(MicrocontrollerDummyApp
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

add_subdirectory(source)
