#include <stdio.h>
#include "module1.h"
#include <limits.h>

int fact(int num) {
	if(num < 0) {
		return INT_MIN;
	}
	int i,fact=1;
	for(i=1;i<=num;i++) {
		fact = fact * i;
	}
	return fact;
}

