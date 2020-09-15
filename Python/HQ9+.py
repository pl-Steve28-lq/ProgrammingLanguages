t=0
def compiler(code):
  for i in code:
    if i=="Q":print(i)
    elif i=="H":print("Hello, World!")
    elif i=="9":
      for i in reversed(range(3,100)): print("{} bottles of beer on the wall, {} bottles of beer.\nTake one down and pass it around, {} bottles of beer on the wall.".format(i,i,i-1))
      print("2 bottles of beer on the wall, 2 bottles of beer.\nTake one down and pass it around, 1 bottle of beer on the wall.\n1 bottle of beer on the wall, 1 bottle of beer.\nTake one down and pass it around, no more bottles of beer on the wall.\nNo more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.")
    elif i=="+": t += 1
    else: continue
