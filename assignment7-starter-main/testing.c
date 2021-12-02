/* Program demonstrating how to use printf */

#include <stdio.h>  // required for printf

int main() {
    int *a = "4";
    printf("%p",*a);
    int b = 5;
    int *q = &b;
    int *p = &a;
    int **pp = &p;
    printf("%i\n", *p);
    printf("%i\n", *q);
    p = q;
    printf("%i\n", *p);
    printf("%i\n", *q);
    printf("%i\n", **pp);
}