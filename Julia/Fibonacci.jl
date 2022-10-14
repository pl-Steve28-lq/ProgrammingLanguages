const Matrix = Vector{UInt128}

function pow(a :: Matrix, n :: Int) :: Matrix
    if n == 0 return [1, 0, 0, 1]
    elseif n == 1 return a end
    mul(pow(a, n÷2), pow(a, n÷2 + n%2))
end

function mul(m :: Matrix, n :: Matrix) :: Matrix
    a, b, c, d = m
    e, f, g, h = n
    [a*e+b*g, a*f+b*h, c*e+d*g, c*f+d*h]
end

function fibo(n :: Int) :: UInt128
    pow(UInt128[1, 1, 1, 0], n)[3]
end

println(fibo(100))
