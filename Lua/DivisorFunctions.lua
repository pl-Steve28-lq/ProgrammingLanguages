function PrimeFactor(a)
  res = {}
  for i=1, a do
    if a%i == 0 then
      table.insert(res,i)
    end
  end
  return res
end

function gcd(a,b)
  while b ~= 0 do
    c = a%b
    a = b
    b = c
  end
  return a
end

function lcm(a,b)
  return a*b/gcd(a,b)
end
