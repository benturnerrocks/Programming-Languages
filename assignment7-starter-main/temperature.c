/* Program demonstrating how to use scanf */

#include <stdio.h>  // required for scanf

void convert_temp_to_C(float temp_f) {
    if (temp_f < -459.67) {
        printf("Invalid temperature!");
    } else {
        float temp_c = (temp_f - 32) * 5/9;
        printf("\n%f degrees Fahrenheit is %f degrees Celsius.\n",temp_f,temp_c);
    }
}

int main() {
    float input;
   printf("What is the temperature in degrees Fahrenheit?");
   scanf("%f", &input);
   convert_temp_to_C(input);
}