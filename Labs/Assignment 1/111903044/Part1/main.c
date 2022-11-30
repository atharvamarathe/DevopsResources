#include <stdio.h>
#include "addition.h"
#include "multiplication.h"
#include "subtraction.h"
#include "division.h"

int main()
{
    int num1 = 10, num2 = 2;
    int addition = add(num1, num2);
    int subtract = sub(num1, num2);
    int multiplication = multi(num1, num2);
    int division = div(num1, num2);
    printf("Number1 : %d Number2 : %d\n", num1, num2);
    printf("Addition of Numbers : %d\n", addition);
    printf("Subtraction of Numbers : %d\n", subtract);
    printf("Multiplication of Numbers : %d\n", multiplication);
    printf("Division of Numbers : %d\n", division);
    return 0;
}
