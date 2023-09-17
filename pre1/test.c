#include<stdlib.h>
#include<stdio.h>

#define DEBUG_SWITCH 1
#if DEBUG_SWITCH
    #define print(string) printf("%s is done!\n",string)
#else
    #define print(string)
#endif

int fib(int N)
{
	if(N<2) return N;
	return fib(N-1)+fib(N-2);
}

int main()
{
	int N=20;
	int result=fib(N);
	printf("%d\n",result);
	print("fib");
	return 0;
}
