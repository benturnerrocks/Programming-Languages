/* Example of C structs. */

#include <stdio.h>

/* A structure type representing complex numbers. */
struct Complex {
    double real;
    double imaginary;
};

/* A method that takes in two complex numbers and returns their product as a new complex number object */
struct Complex complex_product(struct Complex c1, struct Complex c2) {
     struct Complex product;
    printf("%lf\n", c1.real);
    printf("%lf\n", c2.real);
    printf("%lf\n", c1.imaginary);
    printf("%lf\n", c2.imaginary);
    product.real = (c1.real * c2.real) - (c1.imaginary * c2.imaginary);
    product.imaginary = (c1.real * c2.imaginary) + (c1.imaginary * c2.real);
    return product;
}

/* a method that displays the complex number */
void describe_complex_number(struct Complex c) {
    printf("Complex number: %2.2f + %2.2f i\n",c.real,c.imaginary);
}

int main() {
    // takes in input
    double real1,imaginary1,real2,imaginary2;
    printf("Enter real part of c1: ");
    scanf("%lf", &real1);
    printf("Enter imaginary part of c1: ");
    scanf("%lf", &imaginary1);
    printf("Enter real part of c2: ");
    scanf("%lf", &real2);
    printf("Enter imaginary part of c2: ");
    scanf("%lf", &imaginary2);

    // assigns it to a new complex number object
    struct Complex c1,c2;
    c1.real = real1;
    c1.imaginary = imaginary1;
    c2.real = real2;
    c2.imaginary = imaginary2;

    // print statements for testing

    // printf("%lf\n", c1.real);
    // printf("%lf\n", c2.real);
    // printf("%lf\n", c1.imaginary);
    // printf("%lf\n", c2.imaginary);

    //finds the product and displays it using our methods
    struct Complex product = complex_product(c1,c2);
    describe_complex_number(product);
}