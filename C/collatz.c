#include <stdio.h>

int collatz(int n);
int collatz1(int n, int a);

int main(void) {
  int v;
  scanf("%d",&v);
  printf("%d\n", collatz(v));
  return 0;
}
int collatz(int n) {
  return collatz1(n, 0);
}
int collatz1(int n, int a) {
  if (n == 1) return a;
  else if (n%2 == 0) return collatz1(n/2,a+1);
  else return collatz1(3*n+1,a+1);
}
