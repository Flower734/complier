
;; Function main (main, funcdef_no=0, decl_uid=2348, cgraph_uid=1, symbol_order=0)

int main ()
{
  int number;
  int D.2366;

  number = 0;
  scanf ("%d", &number);
  number.0_1 = number;
  _2 = Fibonacci_loop (number.0_1);
  number.1_3 = number;
  printf ("(Loop)The %d Fibonacci number is %lld.\n", number.1_3, _2);
  number.2_4 = number;
  _5 = Fibonacci_recursive (number.2_4);
  number.3_6 = number;
  printf ("(Recursive)The %d Fibonacci number is %lld.\n", number.3_6, _5);
  D.2366 = 0;
  goto <D.2368>;
  <D.2368>:
  number = {CLOBBER};
  goto <D.2367>;
  D.2366 = 0;
  goto <D.2367>;
  <D.2367>:
  return D.2366;
}



;; Function Fibonacci_loop (Fibonacci_loop, funcdef_no=1, decl_uid=2345, cgraph_uid=2, symbol_order=1)

long long int Fibonacci_loop (int num)
{
  long long int temp;
  int i;
  long long int LastLastNum;
  long long int LastNum;
  long long int D.2371;

  if (num == 0) goto <D.2369>; else goto <D.2370>;
  <D.2369>:
  D.2371 = (long long int) num;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.2372>;
  <D.2370>:
  LastNum = 1;
  LastLastNum = 1;
  i = 3;
  goto <D.2361>;
  <D.2360>:
  temp = LastNum;
  LastNum = LastLastNum + LastNum;
  LastLastNum = temp;
  i = i + 1;
  <D.2361>:
  if (i <= num) goto <D.2360>; else goto <D.2358>;
  <D.2358>:
  D.2371 = LastNum;
  goto <D.2372>;
  <D.2372>:
  return D.2371;
}



;; Function Fibonacci_recursive (Fibonacci_recursive, funcdef_no=2, decl_uid=2347, cgraph_uid=3, symbol_order=2)

long long int Fibonacci_recursive (int num)
{
  long long int D.2376;

  if (num == 1) goto <D.2373>; else goto <D.2375>;
  <D.2375>:
  if (num == 0) goto <D.2373>; else goto <D.2374>;
  <D.2373>:
  D.2376 = (long long int) num;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.2377>;
  <D.2374>:
  _1 = num + -1;
  _2 = Fibonacci_recursive (_1);
  _3 = num + -2;
  _4 = Fibonacci_recursive (_3);
  D.2376 = _2 + _4;
  goto <D.2377>;
  <D.2377>:
  return D.2376;
}


