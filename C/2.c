#include <stdio.h>
#include <math.h>
#define MAX_SUM 4000000

int main(void) {
    double phi = (1 + pow(5, 0.5)) / 2;
    double phi_even = pow(phi, 3);
    unsigned long int result = 2;
    unsigned long int even_fib = 2;

    while (result < MAX_SUM) {
        even_fib = round(even_fib * phi_even);
        result += even_fib;
        printf("fib = %lu\n", result);
    }
    printf("Sum of even fibonacci numbers = %lu\n", result);

    return 0;
}