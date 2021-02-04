def fibo n
  if n == 0 or n == 1
  return n end
  return (fibo n-1) + (fibo n-2)
end

def gfibo n
  arr = [1, 1, 1, 0]
  def mul n, m
    a, b, c, d = n
    e, f, g, h = m
    return [
      a*e+b*g, a*f+b*h,
      c*e+d*g, c*f+d*h
    ]
  end
  def pow n, a
    if a == 0
    return [1, 0, 0, 1] end
    if a == 1
    return n end
    return mul pow(n, a/2), pow(n, a/2+a%2)
  end

  return (pow arr, n)[1]
end

puts fibo 15
puts gfibo 150
