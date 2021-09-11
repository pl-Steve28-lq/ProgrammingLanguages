#Fibonacci with O(n^2) Time complexity
f=lambda n:1if n<3else f(n-1)+f(n-2)

#Fibonacci with O(n) Time complexity
def F(n):a=[1,1];exec('a.append(a[-1]+a[-2]);'*n);return a[-3]

#Fibonacci with O(n) Time complexity, Extra Smaller
def F1(n):a,b=0,1;exec('a,b=b,a+b;'*n);return a

#Factorial Function
g=lambda x:x*g(x-1)if x else 1

#Length of Collatz Sequence Function
h=lambda n,a=0:a if n==1else h(3*n+1,a+1)if n%2else h(n/2,a+1)

#Greatest common divisor with Euclidean Algorithm
G=lambda a,b:G(b,a%b)if b else a

#Prime Factor Function
q=lambda n:list(filter(lambda x:not n%x,range(1,n+1)))

#Prime Test Function with Regex
import re;P=lambda n:not re.match(r"^.$|^(..+)\1+$",","*n)

#Prime Test Function with Division
p=lambda x,y=2:(p(x,y+1)if x%y else 0)if x-y else 1
