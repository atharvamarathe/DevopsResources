#include <stdio.h>
#include <stdlib.h>
#include "module1.h"
#include "module2.h"
#include <limits.h>

int main()
{
	int a,b;
	scanf("%d",&a);
	if(a < 0 ) {
		printf("Negative number\n");
	}
	else {
		b = fact(a);
		printf("fact : %d\n",b);
	}

	
	int ans;
	ans = mul(a,b);
	if(ans == INT_MIN) {
		return 1;
	}
	
	
	return 0;
}
