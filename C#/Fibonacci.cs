using System;

class LU {
  public (ulong a, ulong b, ulong c, ulong d) value;
  public LU(ulong a, ulong b, ulong c, ulong d) {
    value = (a, b, c, d);
  }
}

class MainClass {
  public static void Main(string[] args) {
    print(fibo(15));
  }

  public static void print<T>(T msg) {
    Console.WriteLine(msg);
  }

  public static ulong fibo(int n) {
    return pow(new LU(1, 1, 1, 0), n).value.b;
  }

  public static LU pow(LU A, int n) {
    if (n == 0) return new LU(1, 0, 0, 1);
    if (n == 1) return A;
    return mul(pow(A, n/2), pow(A, n/2+n%2));
  }

  public static LU mul(LU A, LU B) {
    var (a, b, c, d) = A.value;
    var (e, f, g, h) = B.value;
    return new LU(
      a*e+b*g, a*f+b*h, c*e+d*g, c*f+d*h
    );
  }
}
