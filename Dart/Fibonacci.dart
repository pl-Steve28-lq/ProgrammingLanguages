void main() {
  print(fibo(15));
}

class _2x2 {
  List<int> value;
  _2x2(int a, int b, int c, int d) {
    this.value = [a, b, c, d];
  }
  
  _2x2 operator * (_2x2 other) {
    var my = this.value;
    var ot = other.value;
    var a = my[0], b = my[1],
    c = my[2], d = my[3],
    e = ot[0], f = ot[1],
    g = ot[2], h = ot[3];
    return _2x2(
      a*e+b*g, a*f+b*h,
      c*e+d*g, c*f+d*h
    );
  }
}

_2x2 pow(_2x2 mat, int n) {
  if (n == 0) return _2x2(1, 0, 0, 1);
  if (n == 1) return mat;
  return pow(mat, n~/2) * pow(mat, n~/2+n%2);
}

int fibo(int n) {
  var mat = _2x2(1, 1, 1, 0);
  var res = pow(mat, n).value[1];
  return res;
}
