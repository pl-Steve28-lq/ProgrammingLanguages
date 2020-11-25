def Dataclass(*data):
  class _class:
    def __init__(self, *args):
      for i in range(len(data)):
        d = data[i]
        if ":" in d:
          name, types = d.split(":")
          arg = list(args)[i]
          if not isinstance(arg, eval(types)):
            raise TypeError()
          setattr(self, name.strip(), arg)
        else:
          setattr(self, d.strip(), arg)
  return _class

Data = lambda _class: Dataclass(*list(map(lambda x: x.strip(), _class.__doc__.split(","))))

def Datafunction(_func):
	annot = _func.__annotations__
	data = list(map(lambda x: x + " : " + str(annot[x]).split("'")[1].split("'")[0], annot.keys()))
	return Dataclass(*data)

# Example
if __name__ == "__main__":
	''' How to Use? '''
	
	# Type Forcing : 
		# Function > "name : str", "age : int", etc.
		# Class with Decorator > "name : str, age: int, etc."
		# Function with Decorator > (name: str, age: int, etc.)
	# Type Unforcing :
		# Function > "name", "age", etc.
		# Class with Decorator > "name, age, etc."
		# Function with Decorator > *Unsupported*
	
	
	# Create with Function
  Person1 = Dataclass("name : str", "age : int")
  me1 = Person1("Steve28", 14)
  print(me.name, me.age)
	
	# Create with Class with Decorator
  @Data
  class Person2: "name : str, age : int"
  me2 = Person2("Steve28", 14)
  print(me.name, me.age)
	
	# Create with Function with Decorator
	@Datafunction
	def Person3(name: str, age: int): pass
	me3 = Person3("Steve28", 14)
	print(me.name, me.age)
