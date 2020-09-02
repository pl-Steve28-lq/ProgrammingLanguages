class Main {
  public static void main(String[] args) {
    System.out.println(fibo(15));
    System.out.println(fact(13));
    System.out.println(collatz(27));
  }
  public static int fibo(int n) {
    return n == 1 || n == 2 ? 1 : fibo(n-1) + fibo(n-2);
  }
  public static int fact(int n) {
    return n == 0 ? 1 : n*fact(n-1);
  }
  public static int collatz(int n) {
    return collatz1(n, 0);
  }
  public static int collatz1(int n, int a) {
    if (n == 1) return a;
    else if (n%2 == 0) return collatz1(n/2,a+1);
    else return collatz1(3*n+1,a+1);
  }
}
