/* Example of C structs. */

#include <stdio.h>

/* A structure type representing a student. */
struct Student {
    char *first_name;
    char *last_name;
    int id;
};

void print_student(struct Student s) {
    printf("%d: %s %s\n", s.id, s.first_name, s.last_name);
}

int main() {
    /* Create an instance of the Student struct. */
    struct Student s1;
    s1.first_name = "Friedrich";
    s1.last_name = "Schiller";
    s1.id = 1759;
    print_student(s1);

    return 0;
}