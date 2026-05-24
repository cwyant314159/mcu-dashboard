if(BOARD_NAME STREQUAL "pico2_w")
    message(STATUS "Configuring build for Raspberry Pi Pico 2W board")
    add_subdirectory(pico2w)
endif()

if(BOARD_NAME STREQUAL "stm-bluepill")
    message(STATUS "Configuring build for STM32 Blue Pill board")
    add_subdirectory(stm_bluepill)
endif()

if(BOARD_NAME STREQUAL "uno")
    message(STATUS "Configuring build for Arduino Uno board")
    add_subdirectory(uno)
endif()