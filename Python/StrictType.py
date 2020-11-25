import inspect

def Wrongtype(name, value, excepted, but):
  value = '"' + value + '"' if isinstance(value, str) else value
  raise TypeError("Type error at {}={}. It should be {}, not {}.".format(name, value, excepted, but))

def strict(func):
  annot = func.__annotations__
  varnames = inspect.getfullargspec(func)
  def _func(*args, **kwargs):
    data = [ [k, annot.get(k, object)] for k in varnames[0] ] +\
      [ [k, annot.get(varnames[1], object)] for k in args[len(varnames[0]):]]
    for i in range(len(args)):
      var = args[i]
      varname, vartype = data[i]
      if not isinstance(var, vartype): Wrongtype(varname, var, vartype, type(var))
    for i in kwargs.keys():
      kwargstype = annot.get(varnames[2], object)
      if not isinstance(kwargs[i], kwargstype): Wrongtype(i, kwargs[i], kwargstype, type(kwargs[i]))

    result = func(*args, **kwargs)
    returntype = annot.get('return', object)
    if not isinstance(result, returntype): Wrongtype('return', result, returntype, type(result)) 
    return result
  return _func
 

# Example
if __name__ == "__main__":
  
  # Type not stricted
  def add1(a: int, b: int) -> int:
    return a+b
  print(add1("asdf", "as")) # asdfas
  
  # Type stricted
  @strict
  def add2(a: int, b: int) -> int:
    return a+b
  print(add2(1, 3)) # 4
  print(add2("asdf", "as")) # TypeError!
