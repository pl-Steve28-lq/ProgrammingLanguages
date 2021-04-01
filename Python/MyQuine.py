# 1. Basic Quine
s=r'print(f"s=r\'{s}\';{s}")';print(f"s=r\'{s}\';{s}")

# 2. Multiple Line Quine
a=['print(f"a={a}")', 'def b():', '    return "Wow, This is Quine code!"', 'print(*a, sep="\\n")']
print(f"a={a}")
def b():
    return "Wow, This is Quine code!"
print(*a, sep="\n")

# 3. Quine Generator
# Argument is executable Python code.
def codeQuine(s):
    c = ['print(f"a={a}")'] + s.split("\n")
    d = 'print(*a, sep="\\n")'
    q = f'a={c+[d]}\n'
    for i in c: q += i + '\n'
    return q + 'print(*a, sep="\\n")'
