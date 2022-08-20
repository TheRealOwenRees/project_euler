#include <stdio.h>

int main(void) {
    unsigned long int n = 600851475143;
    int i;

    for (i = 1; i < n; i ++) {
        if (n % i == 0) {
            n = n / i;
        }      
    }
    printf("Largest prime factor of 600851475143 = %lu\n", n);
    return 0;
}