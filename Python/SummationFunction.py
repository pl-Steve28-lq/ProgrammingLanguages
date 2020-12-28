fact=lambda x: x*fact(x-1)if x else 1
comb=lambda n,r: fact(n)//(fact(r)*fact(n-r))

from fractions import Fraction as F

def add(a, b):
    res = []
    A, B = len(a), len(b)
    for i in range(max(A, B)):
        try: _a = a[i]
        except: _a = 0
        try: _b = b[i]
        except: _b = 0
        res.append(_a+_b)
    return res

def mul(a, b):
    return list(map(lambda v: v*b, a))

def S(m):
    # return Polynomial f, that satisfies f(x) = 1^m+2^m+...+x^m
    # ex) S(1) = x(x+1)/2 = 1+2+..+x
    res = [[F(0), F(1)], [F(0), F(1, 2), F(1, 2)]]
    for i in range(3,m+2):
        a = [F(0)]
        for j in range(len(res)): a = add(a, mul(res[j], F((-1)**(i-j)*comb(i,j), i)))
        res.append(add(a, [F(0)]*i + [F(1, i)]))
    return res[-1]

def stringify(poly):
    res = []
    first = True
    for i in range(len(poly)-1, -1, -1):
        coef = poly[i]
        a, b = coef.numerator, coef.denominator
        if a == 0: continue
        sign = "" if first and a > 0 else "-" if first or a < 0 else "+"
        x = f"x^{i}" if i > 1 else "x" if i == 1 else ""
        _a = abs(a) if abs(a) != 1 else ""
        res += [ f"{sign} {_a}{x}{f'/{b}' if b != 1 else ''} " ]
        first = False
    return ''.join(res).strip()
