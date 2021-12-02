#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main() {
    unsigned int seed;
    unsigned int player_input;
    printf("Enter the random seed: ");
    scanf("%u", &seed);
    //seed = time(NULL);
    srandom(seed);
    int random_number = random()%100 + 1;
    //printf("%i\n", random_number);

    int num_guesses = 0;

    while (player_input != random_number) {
        printf("Guess my number: ");
        scanf("%u", &player_input);

        if (player_input > random_number) {
            printf("Too high!\n");
        } else if (player_input < random_number) {
            printf("Too low!\n");
        }
        num_guesses++;
    }
    printf("Correct! Total guesses = %u\n", num_guesses);
}