from Polynomial import Polynomial

fact=lambda x:x*fact(x-1)if x else 1
comb=lambda n,r:fact(n)//(fact(r)*fact(n-r))

def S(m):
  # return Polynomial f, that satisfies f(x) = 1^m+2^m+...+x^m
  # ex) S(1) = x(x+1)/2 = 1+2+..+x
  res = [Polynomial(1,0), Polynomial(1/2,1/2,0)]
  for i in range(3,m+2):
    a = Polynomial(0)
    for j in range(len(res)): a += res[j]*(-1)**(i-j)*comb(i,j)*(1/i)
    res.append(a+Polynomial(*([1/i]+[0]*i)))
  return res[-1]
