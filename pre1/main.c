#include<stdio.h>

/*
Pre-Processor Test
*/
#ifndef E
#define E 2.718281828
#endif

#define MAX(a,b) ((a)>(b))?(a):(b);
#define FOR(begin,end) for(int i=begin;i<=end;++i)

#define VARA 1500
#define VARB 2000
#define VARC (MAX(VARA,VARB))
#define VARD VARC

long long Fibonacci_loop(int num);
long long Fibonacci_recursive(int num);

int main(){

    int number = 0;
    scanf("%d",&number);
    
    printf("(Loop)The %d Fibonacci number is %lld.\n",number,Fibonacci_loop(number));
    
    printf("(Recursive)The %d Fibonacci number is %lld.\n",number,Fibonacci_recursive(number));
    
    return 0;
}

long long Fibonacci_loop(int num){
    if(num==0){
        return num;
    }
    long long LastNum = 1;
    long long LastLastNum = 1;
    FOR(3,num){
        long long temp = LastNum;
        LastNum = LastLastNum + LastNum;
        LastLastNum = temp;
    }
    return LastNum;
}

long long Fibonacci_recursive(int num){
    if((num==1)||(num==0)){
        return num;
    }
    return Fibonacci_recursive(num-1)+Fibonacci_recursive(num-2);
}