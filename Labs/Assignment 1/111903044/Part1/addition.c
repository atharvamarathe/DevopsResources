#include "subtraction.h"
#include "multiplication.h"
int add(int a, int b)
{
    int ans1 = sub(a, b);
    int ans2 = multi(b, 2);
    return ans1 + ans2;
}