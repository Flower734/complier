#include<stdio.h>
//全局变量
int N=1;
const int num=1;

int func()
{
int i=0;
int res=0;
while(i<N)
{
    i=i+num;
    if(i==0)
    {
        continue;
    }
    if(i%2==1)
    {
        res+=i*i;
    }
    if(i==9)
    {
        break;
    }

}
return res;
}

int main()
{
    int N=10;
    int result=func(N);
    printf("%d",result);
    printf("yes");
    return 0;
}