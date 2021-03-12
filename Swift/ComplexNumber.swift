let e = 2.718281828459045
let pi = 3.141592653589793238

struct Complex: CustomStringConvertible {
  var real: Double
  var imag: Double
  var description: String {
    let im = imag > 0 ? " + \(imag)i" : imag == 0 ? "" : " - \(-imag)i"
    return "\(real)\(im)"
  }
  var size: Double {
    return (real*real + imag*imag).squareRoot()
  }
  var conj: Complex {
    return Complex(real: real, imag: -imag)
  }
  var inv: Complex {
    let s = size*size
    return conj/s
  }

  static func +(this: Complex, other: Complex)-> Complex {
    return Complex(
      real: this.real+other.real,
      imag: this.imag+other.imag
    )
  }

  static func +(this: Complex, other: Double)-> Complex {
    return Complex(
      real: this.real+other,
      imag: this.imag
    )
  }

  static func +(this: Double, other: Complex)-> Complex {
    return other+this
  }

  static func *(this: Complex, other: Double)-> Complex {
    return Complex(
      real: this.real*other,
      imag: this.imag*other
    )
  }

  static func *(this: Double, other: Complex)-> Complex {
    return other*this
  }

  static func *(this: Complex, other: Complex)-> Complex {
    let a = this.real, b = this.imag,
        c = other.real, d = other.imag
    return Complex(
      real: a*c-b*d,
      imag: a*d+b*c
    )
  }

  static func -(this: Complex, other: Complex)-> Complex {
    return this + other*(-1)
  }

  static func -(this: Complex, other: Double)-> Complex {
    return this + other*(-1)
  }

  static func -(this: Double, other: Complex)-> Complex {
    return (-1)*(other - this)
  }

  static func /(this: Complex, other: Double)-> Complex {
    return this*(1/other)
  }

  static func /(this: Double, other: Complex)-> Complex {
    return this*other.inv
  }

  static func /(this: Complex, other: Complex)-> Complex {
    return this*other.inv
  }
}

let 𝖎 = Complex(real: 0, imag: 1)

let a = 3-4*𝖎
print(a)
