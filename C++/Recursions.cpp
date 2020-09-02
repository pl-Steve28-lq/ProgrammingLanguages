#include <cstdio>

int fact(int n) {
  return n == 0 ? 1 : n*fact(n-1);
}

int fibo(int n) {
  return n == 1 || n == 2 ? 1 : fibo(n-1) + fibo(n-2);
}

int collatz(int n, int a = 0) {
  return n == 1 ? a : (n%2 == 0 ? collatz(n/2,a+1) : collatz(3*n+1,a+1));
}

int main() {
  printf("%d\n%d\n%d\n",fact(13),fibo(13),collatz(27));
}
