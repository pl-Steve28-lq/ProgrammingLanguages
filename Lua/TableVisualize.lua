function Tableprint(a)
  res = ""
  for index, i in pairs(a) do
    if i ~= a[#a] then res = res .. i .. ", "
    else res = res .. i
    end
  end
  print("["..res.."]")
end

function TableStringify(a)
  res = ""
  for index, i in pairs(a) do
    if i ~= a[#a] then res = res .. i .. ", "
    else res = res .. i
    end
  end
  return "["..res.."]"
end
