//Fibonacci with O(n^2) Time complexity
fun f(n:Int):Int=if(n==1||n==2)1 else f(n-1)+f(n-2)

//Fibonacci with O(n) Time complexity
fun F(n:Int):Int{val a=mutableListOf(1,1);for(i in 1..n)a.add(a[i]+a[i-1]);return a[n-1]}

//Fibonacci with O(n) Time complexity, Extra Smaller
fun F1(n:Int):Int{var a=0;var b=1;var c=0;for(i in 1..n){c=a;a=b;b+=c};return a}

//Factorial Function
fun g(n:Int):Long{return (if(n==0)1 else n*g(n-1))}
