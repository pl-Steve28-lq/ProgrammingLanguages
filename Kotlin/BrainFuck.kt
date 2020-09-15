fun BrainFuck(code:String): Int {
    fun indexFind(ind: Int): Int {
        var leftdatas:MutableList<Int> = ArrayList()
        var rightdatas:MutableList<Int> = ArrayList()
    	var index = 0
        var leftbrind = -1
        var rightbrind = -1
        var res = 0
        for (i in code) {
            when (i) {
                '[' -> { leftdatas.add(index); if ( index == ind ) { res = 1; break }; leftbrind++ }
                ']' -> { rightdatas.add(index); if ( index == ind ) { res = 2; break }; rightbrind++ }
            }
        index++
        }
        if (res == 1) return rightdatas[rightbrind]
        if (res == 2) return leftdatas[leftbrind]
        return 0
    }
    var value:MutableList<Int> = MutableList(256,{0})
    var pointer = 0
    var x = 0
    val y = code.length
    while (x < y) {
        pointer = pointer % 256
        var q = code[x]
        when (q) {
            '+' -> value[pointer]++
            '-' -> value[pointer]--
            '>' -> pointer++
            '<' -> pointer--
            '[' -> { if (value[pointer] == 0) x = indexFind(x)-1 }
            ']' -> { if (value[pointer] != 0) x = indexFind(x)-1 }
            '.' -> print(value[pointer].toChar())
            else -> print(0)
        }
        x++
    }
    return 0
}
