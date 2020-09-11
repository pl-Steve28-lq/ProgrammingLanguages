#Fibonacci with O(n^2)
f=lambda n:1if n==1or n==2else f(n-1)+f(n-2)

#Fibonacci with O(n)
def F(n):a=[1,1];exec('a.append(a[-1]+a[-2]);'*n);return a[-3]

#Fibonacci with O(n), Extra Smaller
def F1(n):a,b=0,1;exec('a,b=b,a+b;'*n);return a

#Factorial Function
g=lambda x:x*g(x-1)if x else 1

#Length of Collatz Sequence Function
h=lambda n,a=0:a if n==1else h(3*n+1,a+1)if n%2else h(n/2,a+1)
