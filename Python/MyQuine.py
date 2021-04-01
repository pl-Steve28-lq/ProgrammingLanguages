# 1. Basic Quine
s=r'print(f"s=r\'{s}\';{s}")';print(f"s=r\'{s}\';{s}")

# 2. Longer Quine
s='Made by';r='Steve28';v='print(f"s=\'{s}\';r=\'{r}\';v=\'{v}\';{v}")';print(f"s=\'{s}\';r=\'{r}\';v=\'{v}\';{v}")

# 3. Multiple Line Quine
a=['print(f"a={a}")', 'def b():', '    return "Wow, This is Quine code!"', 'print(*a, sep="\\n")']
print(f"a={a}")
def b():
    return "Wow, This is Quine code!"
print(*a, sep="\n")
