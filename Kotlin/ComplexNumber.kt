import kotlin.math.*

class Complex {
    var real = 0.0
    var imag = 0.0
    var abs = 0.0
    var arg = 0.0
    var text: String?
    constructor (real: Double, imag: Double) {
        this.real = real
        this.imag = imag
        this.text = if (real*real>=0) real.toString() + (if (imag >= 0) "+" else "") + imag.toString() + "I" else null
        this.abs = sqrt(real*real+imag*imag)
        this.arg = atan2(imag, real)
    }
    
    operator fun plus (other: Complex): Complex {
        return Complex(this.real + other.real, this.imag + other.imag)
    }
    
    operator fun minus (other: Complex): Complex {
        return this + (-other)
    }
    
    operator fun times (other: Complex): Complex {
        val a = this.real
        val b = this.imag
        val c = other.real
        val d = other.imag
        return Complex(a*c-b*d, b*c+a*d)
    }
    
    operator fun unaryMinus(): Complex {
        return Complex((-1)*this.real, (-1)*this.imag)
    }
    
    operator fun div (other: Complex): Complex? {
        try {
            val a = this.real
            val b = this.imag
            val c = other.real
            val d = other.imag
            return Complex((a*c+b*d)/(c*c+d*d), (b*c-a*d)/(c*c+d*d))
        }
        catch (e: java.lang.ArithmeticException) {
            return null
        }
    }
    
    fun pow(other: Complex): Complex {
        var newabs = this.abs.pow(other.real) * exp((-1)*other.imag*this.arg)
        var newarg = other.real*this.arg + other.imag*ln(this.abs)
        var newreal = newabs*cos(newarg)
        var newimag = newabs*sin(newarg)
        return Complex(newreal, newimag)
    }
}

fun main() {
    var a = Complex(0.0,1.0)
    println(-2*ln(a.pow(a).real) == PI)
}
