# Define your application executable target name
add_executable(pico2w_test main.c)

# Link the core SDK libraries alongside the wireless chip architecture driver
target_link_libraries(pico2w_test PRIVATE pico_base pico_stdlib pico_cyw43_arch_none)

# Natively instruct the SDK to extract .elf, .hex, and drag-and-drop .uf2 targets
pico_add_extra_outputs(pico2w_test)

install(FILES 
    "${CMAKE_CURRENT_BINARY_DIR}/pico2w_test.elf"
    "${CMAKE_CURRENT_BINARY_DIR}/pico2w_test.hex"
    "${CMAKE_CURRENT_BINARY_DIR}/pico2w_test.bin"
    "${CMAKE_CURRENT_BINARY_DIR}/pico2w_test.uf2"
    DESTINATION "${CMAKE_SOURCE_DIR}/artifacts/${BOARD_NAME}"
)