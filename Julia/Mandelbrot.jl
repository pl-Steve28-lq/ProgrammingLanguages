const Cplx = Complex{Float64}

function mandel(z::Cplx)::Bool
  v = zero(Cplx)
  for i in 1:200
    v = v*v + z
    if abs(v) > 2 return false end
  end
  true
end

for y in -32:32, x in -54:12
  print(mandel((x+y*im)/32) ? "#" : " ")
  if x == 12 println() end
end
