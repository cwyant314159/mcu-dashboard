#include <stdio.h>

#define MAX_PRINTS 10

int main(void)
{
    for (int i = 0; i < MAX_PRINTS; ++i) {
        printf("Hello world!\n\r");
    }
    
    return 0;
}