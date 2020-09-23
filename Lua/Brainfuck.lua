function Brainfuck(code)
  x = 1
  y = #code
  cnt = 0
  pointer = 0
  value = {}
  for i=1, 256 do
    value[i]=0
  end
  res = {}

  function index(code)
    leftbr = {}
    dict = {}
    for i=1, y do
      Z = code:sub(i,i)
      if Z=="[" then
        table.insert(leftbr,i)
      elseif Z=="]" then
        dict[i]=leftbr[#leftbr]
        dict[leftbr[#leftbr]]=i
        table.remove(leftbr,#leftbr)
      end
    end
    return dict
  end

  indexs = index(code)

  while x < y+1 do
    pointer = pointer%256
    Z = code:sub(x,x)
    if Z==">" then pointer = pointer+1
    elseif Z=="<" then pointer = pointer-1
    elseif Z=="+" then value[pointer+1] = value[pointer+1]+1
    elseif Z=="-" then value[pointer+1] = value[pointer+1]-1
    elseif Z=="." then table.insert(res, string.char(value[pointer+1]))
    elseif Z=="[" then
      if value[pointer+1]==0 then x = indexs[x]-1 end
    elseif Z=="]" then
      if value[pointer+1]~=0 then x = indexs[x]-1 end
    end
    x = x+1
    cnt = cnt+1
    if cnt == 500000 then
      print("Loop Error at : "..(indexs[x]-1).." "..x-1)
      return
    end
  end
  resstr = ""
  for i=1, #res do
    resstr = resstr..res[i]
  end
  print(resstr)
end
