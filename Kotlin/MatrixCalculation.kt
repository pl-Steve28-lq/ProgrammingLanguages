import kotlin.math.*

fun main() {
    var arr: MutableList<MutableList<Double>> = mutableListOf(mutableListOf(1.0,2.0), mutableListOf(3.0,4.0))
    MutableListPrint(Inverse(arr))
}

/*  MutableList Deep Copy Function from https://stackoverflow.com/questions/45206241/what-is-concise-way-of-deep-copying-a-2d-mutablelist  */
typealias NativeArray = java.lang.reflect.Array
@Suppress("UNCHECKED_CAST")
fun <T> T.deepCopy(): T {
    return when (this) {
        is Array<*> -> {
            val type = this.javaClass.componentType
            NativeArray.newInstance(type, size).also {
                this.forEachIndexed { i, item ->
                    NativeArray.set(it, i, item.deepCopy())
                }
            } as T
        }
        is MutableList<*> -> this.mapTo(mutableListOf()) { it.deepCopy() } as T
        is List<*> -> this.map { it.deepCopy() } as T
        is Cloneable -> this.javaClass.getDeclaredMethod("clone").let {
            it.isAccessible = true;
            it.invoke(this) as T
        }
        else -> this
    }
}
/*  MutableList Deep Copy Function  */

/*  Mutable List Visualize, edited from ArrayPrint function  */
fun MutableListPrint(arr: MutableList<*>, indent: Int = 0): String {
    var T = "    ".repeat(indent)
    var a = 0
    var str = ""
    for (i in arr) {
        a++
        if (i is MutableList<*>) {
            str = str + "$T#$a: \n" + MutableListPrint(i, indent+1)
        }
        else {
            str = str + "$T#$a: ${i}\n"
        }
    }
    if (indent == 0) println(str)
    return str
}
/*  Mutable List Visualize  */

fun ArrayProduct(n: MutableList<MutableList<Double>>, m: MutableList<MutableList<Double>>): MutableList<MutableList<Double>> {
    val res: MutableList<MutableList<Double>> = ArrayList()
    for (i in 0..n.size-1) {
        var a: MutableList<Double> = ArrayList()
        for (j in 0..m[0].size-1) {
            var q = 0.0
            for (k in 0..n[0].size-1) { q += n[i][k]*m[k][j] }
            a.add(q)
        }
        res.add(a)
    }
    return res
}

fun Inverse(n: MutableList<MutableList<Double>>): MutableList<MutableList<Double>> {
    val o = n.size
    fun Transpose(v: MutableList<MutableList<Double>>): MutableList<MutableList<Double>> {
        val res: MutableList<MutableList<Double>> = ArrayList()
        for (i in 0..o-1) {
            var a: MutableList<Double> = ArrayList()
            for (j in 0..o-1) { a.add(v[j][i]) }
            res.add(a)
        }
        
        return res
    }
    
    fun Cofactor(v: MutableList<MutableList<Double>>,I: Int,J: Int): MutableList<MutableList<Double>> {
        var q = v.deepCopy()
        for (i in q) { i.removeAt(J) }
        q.removeAt(I)
        
        return q
    }
    
    fun Abs(v: MutableList<MutableList<Double>>): Double {
        var w = v.size
        if (w == 1) { return v[0][0] }
        else if (w == 2) { return v[0][0]*v[1][1] - v[1][0]*v[0][1] }
        else {
            var res = 0.0
            for (i in 0..w-1) {
                res += v[0][i]*Abs(Cofactor(v,0,i))*((-1.0).pow(i))
            }
            return res
        }
        return 0.0
    }
    
    var D = 1.0/Abs(n)
    var Res: MutableList<MutableList<Double>> = ArrayList()
    for (i in 0..o-1) {
        var t: MutableList<Double> = ArrayList()
        for (j in 0..o-1) {
            t.add((-1.0).pow(i+j).toInt()*D*Abs(Cofactor(n,i,j)))
        }
        Res.add(t)
    }
    return Transpose(Res)
}
