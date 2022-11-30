#include <stdio.h>
#include "module2.h"
#include <limits.h>

int mul(int num, int num1) {
	int ans;
	if(num == INT_MIN || num1 == INT_MIN) {
		return INT_MIN;
	}
	ans = num * num1;
	return ans;
}
