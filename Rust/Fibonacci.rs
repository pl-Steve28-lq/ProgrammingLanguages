type L = (u64, u64, u64, u64);

fn main() {
  let idx = 50;
  println!("{}th Fibonacci number is {}!", idx, fibo(idx));
}

fn fibo(n: u16) -> u64 {
  pow((1, 1, 1, 0), n).1
}

fn pow(m: L, n: u16) -> L {
  if n == 0 { return (1, 0, 0, 1) }
  if n == 1 { return m }
  mul(pow(m, n/2), pow(m, n/2+n%2))
}

fn mul(m: L, n: L) -> L {
  let (a, b, c, d) = m;
  let (e, f, g, h) = n;
  (a*e+b*g, a*f+b*h, c*e+d*g, c*f+d*h)
}
