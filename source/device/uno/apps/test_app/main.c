#include <avr/io.h>
#include <util/delay.h>

/**
 * Note: F_CPU is passed via the toolchain/preset flags,
 * so util/delay.h will use the correct frequency automatically.
 */

#define LED_PIN PB5

static const double DLY_VAL = 500.0;
unsigned int one = 1;

int main(void)
{
    // Set LED_PIN as output
    DDRB |= (one << LED_PIN);

    while (1) {
        // Toggle LED using the PIN register trick (specific to many AVRs)
        PINB |= (one << LED_PIN);

        _delay_ms(DLY_VAL);
    }
    return 0; // Never reached
}