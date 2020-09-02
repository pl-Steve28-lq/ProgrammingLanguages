fun main() {
    println(fibo(15))
    println(fact(13))
    println(collatz(27))
}

fun fibo(n: Int): Int {
    if (n == 1 || n == 2) return 1
    else return fibo(n-1) + fibo(n-2)
}

fun fact(n: Int): Int {
    if (n == 0) return 1
    else return n*fact(n-1)
}

fun collatz(n: Int,a: Int = 0): Int {
    if (n == 1) return a
    else if (n%2 == 0) return collatz(n/2,a+1)
    else return collatz(3*n+1,a+1)
}
