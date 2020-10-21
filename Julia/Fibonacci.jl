function fibo(n)
  x = [1 1
      1 0]
  getindex(pow(x, n), 3)
end

function pow(a, n)
  if n==0 return 1
  elseif n==1 return a end
  mul(pow(a, Int8((n-n%2)/2)), pow(a, Int8((n-n%2)/2)+n%2))
end

function mul(x, y)
  a, c, b, d = x
  e, g, f, h = y
  [a*e+b*g a*f+b*h
  c*e+d*g c*f+d*h]
end
