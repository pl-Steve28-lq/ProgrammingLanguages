D=(F,a,e)=>{
  var f=F.replace(/Math./g,'QQ');
  var p=f.replace(/t/g,String(a)).replace(/QQ/g,'Math.');
  var q=f.replace(/t/g,String(a-e)).replace(/QQ/g,'Math.');
  return (eval(p)-eval(q))/e;
}
Li=(C,f,N)=>{
  var X=C['x'],Y=C['y'],R=C['R'],res=0;
  for(var i=0; i<=N; i++){
    var V=R[1]-R[0],T=R[0]+V*i/N;
    var F=f.replace(/x/g,X).replace(/y/g,Y).replace(/Math./g,'QQ').replace(/t/g,String(T)).replace(/QQ/g,'Math.');
    var Xd=D(X,T,0.001),Yd=D(Y,T,0.001);
    res+=eval(F)*Math.sqrt(Xd*Xd+Yd*Yd);
  }
  return res*V/N;
}
