function(add_avr_executable TARGET_NAME)
    add_executable(${TARGET_NAME} ${ARGN})

    # Create the .hex file and display sizing information
    set(HEX_FILE "${CMAKE_CURRENT_BINARY_DIR}/${TARGET_NAME}.hex")

    add_custom_command(TARGET ${TARGET_NAME} POST_BUILD
        BYPRODUCTS "${HEX_FILE}"
        COMMAND ${CMAKE_OBJCOPY} -O ihex -R .eeprom $<TARGET_FILE:${TARGET_NAME}> ${HEX_FILE}
        COMMAND ${CMAKE_SIZE} -A $<TARGET_FILE:${TARGET_NAME}>
        COMMENT "Generating ${TARGET_NAME}.hex and checking memory usage..."
        VERBATIM
    )
endfunction()