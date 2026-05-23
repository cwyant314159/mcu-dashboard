include(AvrHelpers)
add_avr_executable(avr_test main.c)
set_target_properties(avr_test PROPERTIES SUFFIX ".elf")