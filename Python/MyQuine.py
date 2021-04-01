# 1. Basic Quine
s=r'print(f"s=r\'{s}\';{s}")';print(f"s=r\'{s}\';{s}")

# 2. Multiple Line Quine
a=['print(f"a={a}")', 'def b():', '    return "Wow, This is Quine code!"', 'print(*a, sep="\\n")']
print(f"a={a}")
def b():
    return "Wow, This is Quine code!"
print(*a, sep="\n")
