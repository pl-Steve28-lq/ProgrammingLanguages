package main

import "fmt"

func main() {
  fmt.Println(fibo(80) == 23416728348467685)
}


func mul(u [2][2]int, v [2][2]int) [2][2]int {
  a, b := u[0][0], u[0][1]
  c, d := u[1][0], u[1][1]
  e, f := v[0][0], v[0][1]
  g, h := v[1][0], v[1][1]
  return [2][2]int {{a*e+b*g, a*f+b*h}, {c*e+d*g, c*f+d*h}}
}

func exp(u [2][2]int, n int) [2][2]int {
  if n == 0 { return [2][2]int {{1, 0}, {0, 1}} }
  if n == 1 { return u }
  return mul(exp(u, n/2), exp(u, (n + n%2)/2))
}

func fibo(n int) int {
  a := [2][2] int {{1,1},{1,0}}
  res := exp(a, n)
  return res[0][1]
}
