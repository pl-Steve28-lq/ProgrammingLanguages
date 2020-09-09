f=lambda n:1if n==1or n==2else f(n-1)+f(n-2) #Fibonacci Number Function
g=lambda x:x*g(x-1)if x else 1 #Factorial Function
h=lambda n,a=0:a if n==1else h(3*n+1,a+1)if n%2else h(n/2,a+1) #Length of Collatz Sequence Function
