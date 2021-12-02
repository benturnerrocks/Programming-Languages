/* Program demonstrating arrays in C. */

#include <stdio.h>

int main() {
    int x = 0;
    int array[10];
    int i;

    // Write the elements of an array
    for (i = 0; i < 10; i++) {
        array[i] = i;
    }

    // Read from the array
    for (i = 0; i < 10; i++) {
        printf("%i ", array[i]);
    }

    // Write past the array results in weirdness
    // printf("x value before writing to array[10]: %i\n", x);
    // array[10] = 5;
    // printf("x value after writing to array[10]: %i\n", x);

    //Use pointer arithmetic to access the elements of the array
    printf("Array address: %p\n", array);
    for (i = 0; i < 10; i++) {
        printf("Array element at address %p: %i\n", array + i, *(array + i));
    }

    int sum = 0;
    for (i = 0; i < 10; i++) {
        sum += array[i];
    }
    printf("%i",sum);
}