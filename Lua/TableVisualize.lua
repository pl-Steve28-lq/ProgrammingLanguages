function Tableprint1(a)
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

-- Function from https://stackoverflow.com/questions/7274380/how-do-i-display-array-elements-in-lua
function Tableprint(arr, indentLevel)
    local str = ""
    local indentStr = "#"

    if(indentLevel == nil) then
        print(Tableprint(arr, 0))
        return
    end

    for i = 0, indentLevel do
        indentStr = indentStr.."\t"
    end

    for index,value in pairs(arr) do
        if type(value) == "table" then
            str = str..indentStr..index..": \n"..Tableprint(value, (indentLevel + 1))
        else 
            str = str..indentStr..index..": "..value.."\n"
        end
    end
    return str
end
