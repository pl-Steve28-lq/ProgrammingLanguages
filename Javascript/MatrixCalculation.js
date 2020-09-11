//Matrix Product Function in Oneline
M=(n,m)=>{res=[];for(i=0;i<n.length;i++){a=[];for(j=0;j<m[0].length;j++)a.push(Array.from(Array(n[0].length).keys()).map(e=>n[i][e]*m[e][j]).reduce((a,b)=>a+b));res.push(a)};return res}

//Inverse Matrix Function in Oneline
I=n=>{o=n.length;y=r=>{Q=[];for(i=0;i<o;i++){R=[];for(j=0;j<o;j++)R.push(r[j][i]);Q.push(R)};return Q};a=s=>{w=s.length;if(w==1)return s[0][0];if(w==2)return s[0][0]*s[1][1]-s[1][0]*s[0][1];else {res=0;for(i=0;i<w;i++)res+=s[0][i]*a(c(s,0,i))*Math.pow(-1,i);return res}};c=(q,I,J)=>q.slice(0,I).concat(q.slice(I+1,q.length)).map(e => e.slice(0,J).concat(e.slice(J+1,q.length)));D=1/a(n);p=[];for(i=0;i<o;i++){T=[];for(j=0;j<o;j++)T.push(Math.pow(-1,i+j)*D*a(c(n,i,j)));p.push(T)};return y(p)}

//Matrix Product Function Beautified
M=(n,m)=>{
  res = [];
  for (i=0; i<n.length; i++) {
    a = [];
    for (j=0; j<m[0].length; j++) a.push(Array.from(Array(n[0].length).keys()).map(e=>n[i][e]*m[e][j]).reduce((a,b)=>a+b));
    res.push(a);
  }
  return res;
}

//Inverse Matrix Function Beautified
I = n => {
  o = n.length;
  y = r => {
    Q = [];
    for (i = 0; i < o; i++) {
      R = [];
      for (j = 0; j < o; j++) R.push(r[j][i]);
      Q.push(R)
    }
    return Q
  }
  a = s => {
    w = s.length;
    if (w == 1) return s[0][0];
    if (w == 2) return s[0][0] * s[1][1] - s[1][0] * s[0][1];
    else {
      res = 0;
      for (i = 0; i < w; i++) res += s[0][i] * a(c(s, 0, i)) * Math.pow(-1, i);
      return res
    }
  }
  c = (q, I, J) => q.slice(0, I).concat(q.slice(I + 1, q.length)).map(e => e.slice(0, J).concat(e.slice(J + 1, q.length)));
  D = 1 / a(n);
  p = [];
  for (i = 0; i < o; i++) {
    T = [];
    for (j = 0; j < o; j++) T.push(Math.pow(-1, i + j) * D * a(c(n, i, j)));
    p.push(T)
  }
  return y(p)
}
