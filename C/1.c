#include <stdio.h>
#define MAX_NUM 1000

int main(void) {
    int n = 1;
    unsigned long int sum = 0;

    while (n < MAX_NUM) {
        if ((n % 3 == 0) || (n % 5 == 0)) {
            sum += n;
        }
        n++;
    }
    
    printf("The sum of all multiples of 3 or 5 = %lu\n", sum);
    return 0;
}