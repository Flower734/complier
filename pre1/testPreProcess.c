#include<stdio.h>
#define E 2.718281828

#define MAX(a,b) ((a)>(b))?(a):(b)
#define FOR(begin,end) for(int i=begin;i<=end;++i)

#define VARA 1500
#define VARB 2000
#define VARC (MAX(VARA,VARB))
#define VARD VARC

#pragma message( "Compiling " __FILE__ ) 
#pragma message( "Last modified on " __TIMESTAMP__ ) 

void print();
int explain();

#define EXPLAIN //

int main(){
    EXPLAIN printf("Can it output?\n");
    printf("Output\n");
    return 0;
}


void print(){
    printf("E:%lf,VARA:%d,VARB:%d,VARC:%d,VARD:%d",E,VARA,VARB,VARC,VARD);
}

int explain(){
    //我是单行注释，在预处理阶段我会被删除
    return 0;
    /*我是多行注释
    在预处理阶段我会被删除
    拜拜*/
}

