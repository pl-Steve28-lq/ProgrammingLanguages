using System;

class MainClass {
  public static void main(string[] args) {
    Complex r = new Complex(1,1);
    Complex l = new Complex(2,3);
    Console.WriteLine((r+l).text);
    Console.WriteLine(r.pow(l).text);
  }
}

class Complex {
  public Complex(double r, double i) {
    real = r;
    imag = i;
    text = i==0 ? r.ToString() : i>0 ? r.ToString()+"+"+i.ToString()+"i" : r.ToString()+i.ToString()+"i";
    abs = Math.Pow(real*real+imag*imag, 0.5);
    arg = Math.Atan2(imag, real);
    polar = abs.ToString()+"∠"+((arg>=0 ? arg : 2*Math.PI+arg)*180/Math.PI).ToString();
  }
  
  public double real;
  public double imag;
  public string text;
  public double abs;
  public double arg;
  public string polar;
  
  
  public Complex conj() { return new Complex(real,(-1)*imag); }
  
  
  public static Complex operator + (Complex a, Complex b) { return new Complex(a.real+b.real, a.imag+b.imag); }
  public static Complex operator + (Complex a, double b) { return new Complex(a.real+b, a.imag); }
  public static Complex operator + (double a, Complex b) { return new Complex(b.real+a, b.imag); }
  
  
  public static Complex operator - (Complex a, Complex b) { return a+(-1)*b; }
  public static Complex operator - (double a, Complex b) { return a+(-1)*b; }
  public static Complex operator - (Complex a, double b) { return a+(-1)*b; }
  
  
  public static Complex operator * (Complex a, Complex b) {
    return new Complex(a.real*b.real-a.imag*b.imag, a.real*b.imag+a.imag*b.real);
  }
  public static Complex operator * (Complex a, double b) {
    return new Complex(a.real*b, a.imag*b);
  }
  public static Complex operator * (double a, Complex b) {
    return new Complex(b.real*a, b.imag*a);
  }
  
  
  public Complex pow(int n) {
    if (n==0) return new Complex(1,0);
    else if (n==1) return new Complex(real, imag);
    else return new Complex(real, imag) * pow(n-1);
  }
  public Complex pow(double n) {
    return new Complex(Math.Cos(arg*n),Math.Sin(arg*n));
  }
  public Complex pow(Complex n) {
    double newabs = Math.Pow(abs,n.real)*Math.Exp((-1)*n.imag*arg);
    double newarg = n.real*arg+n.imag*Math.Log(abs);
    return new Complex(newabs*Math.Cos(newarg), newabs*Math.Sin(newarg));
  }
}
