class BrainFuck:
  def __init__(self):
    self.pointer = 0
    self.values = [0]*256

  def places(self,s, tag):
    a = []
    s = list(s)
    for i in range(s.count(tag)):
      a.append(s.index(tag))
      s[s.index(tag)] = "ㅁ"
    return a

  def loophelp(self,ind,code):
    A = self.places(code,"[")
    B = self.places(code,"]")
    B.reverse()
    if len(A) != len(B):
      print("Error!")
    else:
      return A[B.index(ind)]

  def brainfuck(self,code):
    b = []
    for t in range(len(code)):
      a = code[t]
      self.pointer = self.pointer % 256
      if a == "v": print(self.values)
      if a == "+": self.values[self.pointer] += 1
      if a == "-": self.values[self.pointer] -= 1
      if a == ">": self.pointer += 1
      if a == "<": self.pointer -= 1
      if a == ".": b.append(chr(self.values[self.pointer]))
      if a == "[": continue
      if a == "]":
        if self.values[self.pointer] != 0:
          self.brainfuck(code[self.loophelp(t,code):t+1])
        else: continue
      else: pass
    if len(b) != 0: print(''.join(b))
