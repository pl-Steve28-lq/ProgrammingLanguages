func fibo(_ n: Int)-> Int {
    let mat = _2x2(1, 1, 1, 0)
    return pow(mat, n).value.1
}

class _2x2 {
    let value: (Int, Int, Int, Int)
    init (_ a: Int, _ b: Int, _ c: Int, _ d: Int) {
        self.value = (a, b, c, d)
    }
    
    static func *(_ this: _2x2, _ other: _2x2)-> _2x2 {
        let (a, b, c, d) = this.value
        let (e, f, g, h) = other.value
        return _2x2(
            a*e+b*g, a*f+b*h,
            c*e+d*g, c*f+d*h
        )
    }
}

func pow(_ a: _2x2, _ n: Int)-> _2x2 {
    if n == 0 { return _2x2(1, 0, 0, 1) }
    if n == 1 { return a }
    return pow(a, n/2) * pow(a, n/2+n%2)
}
