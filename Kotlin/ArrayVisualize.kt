fun ArrayPrint(arr: Array<*>, indent: Int = 0): Any? {
    var T = "    ".repeat(indent)
    var a = 0
    var str = ""
    for (i in arr) {
        a++
        if (i is Array<*>) {
            str = str + "$T#$a: \n" + ArrayPrint(i, indent+1)
        }
        else {
            str = str + "$T#$a: ${i}\n"
        }
    }
    if (indent == 0) println(str)
    return str
}
