#include "stm32f1xx.h"

/* Simple busy-loop delay function */
void delay_ms(volatile uint32_t ms)
{
    /* At 72MHz, this loop constant provides a rough millisecond approximation */
    ms *= 7200;
    while (ms--) {
        __NOP(); 
    }
}

int main(void)
{
    /* 
     * 1. Enable the Peripheral Clock for Port C.
     * According to the reference manual, GPIOC sits on the APB2 bus.
     * We modify the APB2 peripheral clock enable register (APB2ENR).
     */
    RCC->APB2ENR |= RCC_APB2ENR_IOPCEN;

    /* 
     * 2. Configure Pin PC13 as an Output.
     * Pins 0-7 are managed by CRL, and pins 8-15 are managed by CRH.
     * For PC13, we must modify the Port Configuration Register High (CRH).
     * 
     * First, clear the 4 configuration bits for Pin 13 (Bits [23:20]).
     * Then, set it to Output Push-Pull with a max speed of 2MHz:
     *   MODE13 = 01 (Output mode, max speed 2MHz)
     *   CNF13  = 00 (General purpose output push-pull)
     *   Combined Nibble = 0x1
     */
    GPIOC->CRH &= ~(GPIO_CRH_MODE13 | GPIO_CRH_CNF13);
    GPIOC->CRH |= (0x1 << GPIO_CRH_MODE13_Pos);

    /* Infinite application loop */
    while (1) {
        /* 
         * 3. Toggle PC13 using the Bit Set/Reset Register (BSRR).
         * This register allows atomic modifications without a read-modify-write cycle.
         *   Bits [15:0]  = Set Pin HIGH (Turns LED OFF)
         *   Bits [31:16] = Reset Pin LOW (Turns LED ON)
         */
        
        // Turn LED ON (Reset PC13 to LOW state)
        GPIOC->BSRR = GPIO_BSRR_BR13;
        delay_ms(250);

        // Turn LED OFF (Set PC13 to HIGH state)
        GPIOC->BSRR = GPIO_BSRR_BS13;
        delay_ms(250);
    }

    return 0; // Standard execution return block
}
