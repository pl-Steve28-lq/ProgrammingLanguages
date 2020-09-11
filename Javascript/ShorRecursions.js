//Fibonacci with O(n^2) Time complexity
f=n=>n==1||n==2?1:f(n-1)+f(n-2)

//Fibonacci with O(n) Time complexity
F=n=>{a=0;b=1;eval("b=a+b;a=b-a;".repeat(n));return a}

//Factorial Function
g=n=>n==0?1:n*f(n-1)

//Length of Collatz Sequence Function
h=(n,a)=>{if(!a)a=0;return n==1?a:n%2?h(3*n+1,a+1):h(n/2,a+1)}
