#include "pico/stdlib.h"
#include "pico/cyw43_arch.h"

int main(void) 
{
    stdio_init_all();

    // Initialize the wireless chip
    int init_status = cyw43_arch_init();

    while (1) {
        if (init_status == 0) {
            // SUCCESSFUL INITIALIZATION: Normal Blinking Mode (500ms)
            cyw43_arch_gpio_put(CYW43_WL_GPIO_LED_PIN, 1);
            sleep_ms(250);
            cyw43_arch_gpio_put(CYW43_WL_GPIO_LED_PIN, 0);
            sleep_ms(250);
        } else {
            // INITIALIZATION FAILED: Rapid Error Flash Mode (100ms)
            // Tries to force a raw override toggle to signal a hardware failure
            cyw43_arch_gpio_put(CYW43_WL_GPIO_LED_PIN, 1);
            sleep_ms(50);
            cyw43_arch_gpio_put(CYW43_WL_GPIO_LED_PIN, 0);
            sleep_ms(50);
        }
    }

    return 0;
}
