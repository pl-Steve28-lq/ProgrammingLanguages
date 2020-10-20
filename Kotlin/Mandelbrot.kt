                        import kotlin.math.sqrt
                fun main() { for (i in -33..34){for(j in -69..34){
            if(m(c(j.toDouble()/33,i.toDouble()/33)))print("□");else print("■")}
        println() } }; fun m(Z:c):Boolean{ val z:MutableList<c> =mutableListOf(c(0.0,0.0))
     for(i in 0..200) { val p:c=z.last()*z.last()+Z; if(p.s()>2)break;else z.add(p) };return z.size!=
        202 } class c{ var r=0.0;var i=0.0; constructor(re:Double, im:Double) {this.r=re;this.i=im}
           operator fun plus(z:c):c=c(this.r+z.r,this.i+z.i); operator fun times(z:c):c=
               c(this.r*z.r-this.i*z.i,this.r*z.i+this.i*z.r) fun s():Double=
                     sqrt(this.r*this.r+this.i*this.i) }
