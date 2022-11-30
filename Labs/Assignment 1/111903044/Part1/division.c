#include "subtraction.h"

int div(int a, int b)
{
    int ans = 0;
    while (a > 0)
    {
        a = sub(a, b);
        ans += 1;
    }
    return ans;
}