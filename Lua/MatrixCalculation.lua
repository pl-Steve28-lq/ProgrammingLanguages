function MatrixProduct(a,b)
  res = {}
  for i=1, #a do
    p = {}
    for j=1, #(b[1]) do
      r = 0
      for k=1, #(a[1]) do
        r = r + a[i][k]*b[k][j]
      end
      table.insert(p,r)
    end
    table.insert(res,p)
  end
  return res
end

function Inverse(W)
  o = #W
  function Transpose(v)
    res = {}
    for i=1, o do
      R = {}
      for j=1, o do table.insert(R,v[j][i])
      end
      table.insert(res,R)
    end
    return res
  end

  function Cofactor(v,I,J)
    function copy1(obj)
      if type(obj) ~= 'table' then return obj end
      local res = {}
      for k, v in pairs(obj) do res[copy1(k)] = copy1(v) end
      return res
    end

    q = copy1(v)
    table.remove(q,I)
    for index, i in pairs(q) do table.remove(i,J) end
    return q
  end

  function Abs(m)
    w = #m
    if w == 1 then return m[1][1]
    elseif w == 2 then return m[1][1]*m[2][2] - m[1][2]*m[2][1]
    else
      res = 0
      for i=1, w do
        res = res + m[1][i]*Abs(Cofactor(m,1,i))*math.pow(-1,i)
      end
      return res
    end
  end

  D = 1/Abs(W)
  Res = {}
  for i=1, o do
    t = {}
    for j=1, o do
      table.insert(t, math.pow(-1,i+j)*D*Abs(Cofactor(W,i,j)))
    end
    table.insert(Res,t)
  end
  return Transpose(Res)
end
