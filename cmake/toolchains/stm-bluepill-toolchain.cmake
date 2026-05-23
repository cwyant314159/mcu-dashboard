set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR arm)

set(CMAKE_C_COMPILER arm-none-eabi-gcc)
set(CMAKE_CXX_COMPILER arm-none-eabi-g++)
set(CMAKE_ASM_COMPILER arm-none-eabi-gcc)

set(CMAKE_OBJCOPY arm-none-eabi-objcopy CACHE INTERNAL "")
set(CMAKE_OBJDUMP arm-none-eabi-objdump CACHE INTERNAL "")
set(CMAKE_SIZE arm-none-eabi-size CACHE INTERNAL "")

# Hardware-specific variables
set(STM_BLUEPILL_MCU "STM32F103xB" CACHE STRING "STM32 target definition flag")
set(HSE_HZ "8000000" CACHE STRING "High Speed External Clock Frequency in Hz")
set(LSE_HZ "32768" CACHE STRING "Low Speed External Clock Frequency in Hz")
set(HSI_HZ "8000000" CACHE STRING "High Speed Internal Clock Frequency in Hz")
set(LSI_HZ "40000" CACHE STRING "Low Speed Internal Clock Frequency in Hz")

# Toolchain specific compiler flags
set(MCU_FLAGS "-mcpu=cortex-m3 -mthumb -mfloat-abi=soft")
set(CPP_FLAGS "-D${STM_BLUEPILL_MCU} -DF_HSE_HZ=${HSE_HZ} -DF_LSE_HZ=${LSE_HZ} -DF_HSI_HZ=${HSI_HZ} -DF_LSI_HZ=${LSI_HZ}")
set(NO_RTTI_EXCEPTIONS "-fno-exceptions -fno-rtti")

# Populate the standard CMake flag variables
set(CMAKE_C_FLAGS_INIT "${MCU_FLAGS} ${CPP_FLAGS}")
set(CMAKE_CXX_FLAGS_INIT "${MCU_FLAGS} ${CPP_FLAGS} ${NO_RTTI_EXCEPTIONS}")
set(CMAKE_ASM_FLAGS_INIT "${MCU_FLAGS}")
set(CMAKE_EXE_LINKER_FLAGS_INIT "${MCU_FLAGS}")

# Standard cross-compiling policies
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)

set(BOARD_NAME "stm-bluepill" CACHE STRING "Target board designation")
