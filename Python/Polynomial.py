class Polynomial:
  def __init__(self, *args):
    self.L = 32
    self.coef = list(reversed(args))+[0]*(self.L-len(args))
    text1 = list(map(lambda x:str(self.coef[x]) + "x" if x==1 and self.coef[x]!=1 else "x" if x==1 and self.coef[x]==1 else "x^"+str(x) if self.coef[x]==1 else "-x^"+str(x) if self.coef[x]==-1 else str(self.coef[x])+"x^"+str(x) if self.coef[x]!=0 else None,range(self.L)))
    text2 = '+'.join(list(reversed(list(filter(None,text1))))).replace("x^0","").replace("+-","-")
    self.text = text2 if text2 != "" else "0"
  
  def __add__(self, poly):
    if isinstance(poly, int):
      self.coef[0] += poly
      return Polynomial(self.coef)
    if isinstance(poly, Polynomial):
      a = [self.coef[i]+poly.coef[i] for i in range(self.L)]
      return Polynomial(*reversed(a))

  def __sub__(self, poly):
    return self.__add__(poly*(-1))
  
  def __mul__(self, poly):
    if isinstance(poly, Polynomial):
      while self.coef[-1]==0:
        self.coef = self.coef[:-1]
      while poly.coef[-1]==0:
        poly.coef = poly.coef[:-1]
      A = len(self.coef)+len(poly.coef)-1
      print(self.coef, poly.coef)
      res = []
      print(A)
      for i in range(A):
        u = 0
        for j in range(i+1):
          try: u += self.coef[j]*poly.coef[i-j];
          except: continue
        res.append(u)
      return Polynomial(*reversed(res))
    if isinstance(poly, int) or isinstance(poly, float):
      return Polynomial(*reversed(list(map(lambda x:x*poly, self.coef))))
