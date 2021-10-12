function M(a, b, c, d)
  return { getValue = function() return a, b, c, d end }
end

function mul(x, y)
  a, b, c, d = x.getValue()
  e, f, g, h = y.getValue()
  return M(a*e+b*g, a*f+b*h, c*e+d*g, c*f+d*h)
end

function pow(x, n)
  if n == 0 then return M(1, 0, 0, 1) end
  if n == 1 then return x end
  return mul(pow(x, (n+n%2)/2), pow(x, (n-n%2)/2))
end

function fibo(n)
  v = M(1, 1, 1, 0)
  _, b = pow(v, n).getValue()
  return b
end

print(fibo(15))
