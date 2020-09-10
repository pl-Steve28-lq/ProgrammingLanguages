I=(f,l,n)=>{var a=l[0],r=0,u=1/n,k=l[1]-a;for(var i=0;i<=n;i++){r+=eval(f.replace(/x/g,a+i*k*u))*u}return r*k;}

function Integral(f, l, n) {
  let a = l[0], u = 1/n, k = l[1] - a, r = 0;
  for (var i = 0; i <= n; i++) {
    r += eval(f.replace(/x/g, a+i*k*u))*u
  }
  return r*k
}
