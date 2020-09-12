function regression(arr) {
  let dconst = 0.01, eps = 0.0001;
  let xval = Array.from(new Array(arr.length).keys()).map(e=>e+1);

  let La = 0, Lb = 0, polya = 2, polyb = 1, expa = 2, expb = 1, loga = 2, logb = -1, logc = 1;

  linearCost = (a,b) => xval.map(e=>Math.pow(arr[e-1]-a*e-b,2)).reduce((q,w)=>q+w)/arr.length

  PolyCost = (a,b) => xval.map(e=>Math.pow(arr[e-1]-b*Math.pow(e,a),2)).reduce((q,w)=>q+w)/arr.length

  ExpCost = (a,b) => xval.map(e=>Math.pow(arr[e-1]-b*Math.pow(a,e),2)).reduce((q,w)=>q+w)/arr.length

  LogCost = (a,b,c) => xval.map(e=>Math.pow(arr[e-1]-c/(1+Math.exp(-(a*e+b))),2)).reduce((a,b)=>a+b)/arr.length

  diff2 = (func,a,b,isa) => isa?dconst*(func(a+eps,b)-func(a,b))/eps:dconst*(func(a,b+eps)-func(a,b))/eps

  diff3 = (func,a,b,c,isa,isb) => isa?dconst*(func(a+eps,b,c)-func(a,b,c))/eps:isb?dconst*(func(a,b+eps,c)-func(a,b,c))/eps:dconst*(func(a,b,c+eps)-func(a,b,c))/eps

  for(let i=0; i<10000; i++) {
    La = La - diff2(linearCost,La,Lb,1)
    Lb = Lb - diff2(linearCost,La,Lb,0)
    polya = polya - diff2(PolyCost,polya,polyb,1)
    polyb = polyb - diff2(PolyCost,polya,polyb,0)
    expa = expa - diff2(ExpCost,expa,expb,1)
    expb = expb - diff2(ExpCost,expa,expb,0)
    loga = loga - diff3(LogCost,loga,logb,logc,1,0)
    logb = logb - diff3(LogCost,loga,logb,logc,0,1)
    logc = logc - diff3(LogCost,loga,logb,logc,0,0)
  }
  
  res = {}
  res.linear = [La, Lb, linearCost(La,Lb)]
  res.poly = [polya, polyb, PolyCost(polya,polyb)]
  res.exp = [expa, expb, ExpCost(expa,expb)]
  res.sigmoid = [loga, logb, logc, LogCost(loga,logb,logc)]
  return res
}
