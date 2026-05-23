if(BOARD_NAME STREQUAL "stm-bluepill")
    message(STATUS "Configuring STM32 Blue Pill board dependencies")
    add_library(cmsis5 INTERFACE)
    target_include_directories(cmsis5 INTERFACE cmsis5/CMSIS/Core/Include)

    add_library(cmsis-device-f1 INTERFACE)
    target_include_directories(cmsis-device-f1 INTERFACE cmsis-device-f1/Include)
    target_link_libraries(cmsis-device-f1 INTERFACE cmsis5)
endif()