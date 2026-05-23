set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR avr)

set(CMAKE_C_COMPILER avr-gcc)
set(CMAKE_CXX_COMPILER avr-g++)
set(CMAKE_ASM_COMPILER avr-gcc)

set(CMAKE_OBJCOPY avr-objcopy CACHE INTERNAL "")
set(CMAKE_OBJDUMP avr-objdump CACHE INTERNAL "")
set(CMAKE_SIZE avr-size CACHE INTERNAL "")

# Hardware-specific variables
set(UNO_MCU atmega328p CACHE STRING "Uno Board Target MCU")
set(UNO_F_CPU 16000000UL CACHE STRING "Uno Board Target CPU Frequency")

# Toolchain specific compiler flags
set(MCU_FLAGS "-mmcu=${UNO_MCU}")
set(CPP_FLAGS "-DF_CPU=${UNO_F_CPU}")
set(NO_RTTI_EXCEPTIONS "-fno-exceptions -fno-rtti")

# Populate the standard CMake flag variables
set(CMAKE_C_FLAGS_INIT "${MCU_FLAGS} ${CPP_FLAGS}")
set(CMAKE_CXX_FLAGS_INIT "${MCU_FLAGS} ${CPP_FLAGS} ${NO_RTTI_EXCEPTIONS}")
set(CMAKE_ASM_FLAGS_INIT "${MCU_FLAGS}")

# Standard cross-compiling policies
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)

set(BOARD_NAME "uno" CACHE STRING "Target board designation")
