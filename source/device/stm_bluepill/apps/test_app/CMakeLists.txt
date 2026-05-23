add_executable(stm32_bluepill_test)
target_sources(stm32_bluepill_test PRIVATE main.c)
target_link_libraries(stm32_bluepill_test PRIVATE startup cmsis-device-f1)
target_link_options(stm32_bluepill_test PRIVATE --specs=nosys.specs -nostdlib -Wl,--no-warn-rwx-segments)
set_target_properties(stm32_bluepill_test PROPERTIES SUFFIX ".elf")

# Create the .bin file automatically right after the executable links
add_custom_command(TARGET stm32_bluepill_test POST_BUILD
    BYPRODUCTS "${CMAKE_CURRENT_BINARY_DIR}/stm32_bluepill_test.bin"
    COMMAND ${CMAKE_OBJCOPY} -O binary $<TARGET_FILE:stm32_bluepill_test> "${CMAKE_CURRENT_BINARY_DIR}/stm32_bluepill_test.bin"
    COMMAND ${CMAKE_SIZE} -A $<TARGET_FILE:stm32_bluepill_test>
    COMMENT "Extracting raw binary image stm32_bluepill_test.bin..."
    VERBATIM
)