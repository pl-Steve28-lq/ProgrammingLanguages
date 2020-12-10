def padong(x):
  b = "    "
  if x == 1: return ["■"]
  return ["■"*(2*x-1)] + ["■□"+b*(2*x-3)] + list(map(lambda x: "■"+b+x, padong(x-1)))

def padongsword(x):
  for i in padong(x): print(i)
