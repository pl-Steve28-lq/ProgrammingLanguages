struct Complex {
  real: f32,
  imag: f32
}

impl Complex {
  fn new(real: f32, imag: f32) -> Complex {
    Complex { real, imag }
  }

  fn new_unit(angle: f32) -> Complex {
    Complex::new(angle.cos(), angle.sin())
  }

  fn size(&self) -> f32 {
    f32::powf(f32::powi(self.real, 2) + f32::powi(self.imag, 2), 0.5)
  }

  fn add(&self, other: Complex) -> Complex {
    Complex::new(self.real+other.real, self.imag+other.imag)
  }

  fn mul(&self, other: Complex) -> Complex {
    let a = self.real;
    let b = self.imag;
    let c = other.real;
    let d = other.imag;
    Complex::new(a*c-b*d, b*c+a*d)
  }

  fn addr(&self, other: f32) -> Complex {
    Complex::new(self.real+other, self.imag)
  }

  fn mulr(&self, other: f32) -> Complex {
    Complex::new(self.real*other, self.imag*other)
  }

  fn conj(&self) -> Complex {
    Complex::new(self.real, -self.imag)
  }
  
  fn angle(&self) -> f32 {
    self.imag.atan2(self.real)
  }

  fn pow(&self, n: f32) -> Complex {
    let t = self.angle();
    let r = self.size();
    Complex::new_unit(n*t).mulr(f32::powf(r, n))
  }
}

fn main() {
  let c = Complex::new(1.0, 2.0).mulr(2.0).addr(1.0);
  println!("{}", c.pow(2.0).size());
  assert_eq!(
    c.size()*c.size(),
    c.mul(c.conj()).real
  )
}
