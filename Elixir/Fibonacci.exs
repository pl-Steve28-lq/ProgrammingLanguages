defmodule Main do
  def main() do
    print(fibo(15))
  end

  def fibo(n) do elem pow({1, 1, 1, 0}, n), 1 end

  def pow(x, n) do
    d = div n, 2
    case n do
      0 -> {1, 0, 0, 1}
      1 -> x
      n -> mul pow(x, d), pow(x, d + rem(n, 2))
    end
  end

  def mul(x, y) do
    {a, b, c, d} = x
    {e, f, g, h} = y
    {a*e+b*g, a*f+b*h, c*e+d*g, c*f+d*h}
  end

  def print(x) do IO.puts x end
end

Main.main()
