def Dataclass(*data):
	class _class:
		def __init__(self, *args):
			for i in range(len(data)):
				setattr(self, data[i], list(args)[i])
	return _class

Data = lambda _class: Dataclass(*list(map(lambda x: x.strip(), _class.__doc__.split(","))))


# Example
if __name__ == "__main__":
	Person = Dataclass("name", "age")
	me = Person("Steve28", 14)
	print(me.name, me.age) # Steve28, 14


	@Data
	class Person2: "name, age"
	me = Person2("Steve28", 14)
	print(me.name, me.age) # Steve28, 14
  
