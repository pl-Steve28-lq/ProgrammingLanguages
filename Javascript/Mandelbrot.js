            c=(R,I)=>{return {r:R,i:I}}
       p=(t,z)=>c(t.r+z.r,t.i+z.i);m=(t,z)=>
      c(t.r*z.r-t.i*z.i,t.r*z.i+t.i*z.r);s=t=>
    Math.sqrt(t.r*t.r+t.i*t.i);function M(C) {
  z=[c(0,0)];for(var i in Array(200).fill()){var q=z[i];
    v=p(m(q,q),C);if(s(v)>2)break;else z.push(v)}
      return z.length!=201}for(i=-33;i<34;i++)
        {a='';for(j=-69;j<34;j++){a+=M(c(
          j/33,i/33))?"□":"■"};console
                  .log(a)}
