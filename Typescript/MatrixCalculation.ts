function MatrixProduct(l:number[][], L:number[][]) {
  var res:number[][] = [];
  for (var i:number = 0; i<l.length; i++) {
    var a:number[] = [];
    for (var j:number = 0; j<L[0].length; j++) {
      a.push(Array.from(new Array(l.length).keys()).map(e=>l[i][e]*L[e][j]).reduce((a:number,b:number)=>a+b))
    }
    res.push(a)
  }
  return res
}

function Inverse(n:number[][]) {
  var o = n.length;
  function y(r:number[][]) {
    var Q:number[][] = [];
    for (var i = 0; i < o; i++) {
      var R:number[] = [];
      for (var j = 0; j < o; j++) R.push(r[j][i]);
      Q.push(R)
    }
    return Q
  }
  function a(s:number[][]) {
    var w = s.length;
    if (w == 1) return s[0][0];
    if (w == 2) return s[0][0] * s[1][1] - s[1][0] * s[0][1];
    else {
      var res = 0;
      for (var i = 0; i < w; i++) res += s[0][i] * a(c(s, 0, i)) * Math.pow(-1, i);
      return res
    }
  }
  function c(q:number[][], I:number, J:number) {
    return q.slice(0, I).concat(q.slice(I + 1, q.length)).map(e => e.slice(0, J).concat(e.slice(J + 1, q.length)));
  }
  var D = 1 / a(n);
  var p:number[][] = [];
  for (var i = 0; i < o; i++) {
    var T:number[] = [];
    for (var j = 0; j < o; j++) T.push(Math.pow(-1, i + j) * D * a(c(n, i, j)));
    p.push(T)
  }
  return y(p)
}
