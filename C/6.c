#include <stdio.h>

unsigned int sum_of_squares(unsigned int n) {
    return (n * (n+1)*(2 * n + 1)) / 6;;
}

unsigned int square_of_sum(unsigned int n) {
    unsigned int sum = (n * (n + 1) / 2);
    return sum * sum;
}

unsigned int difference_of_squares(unsigned int n) {
    return square_of_sum(n) - sum_of_squares(n);
}

int main(void) {
    unsigned int n = 100;
    printf("The difference between 'square of sum' and 'sum of squares' = %d\n", difference_of_squares(n));
    return 0;
}
