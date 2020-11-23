fun <T> MutableList<T>.pop(): T? {
    if (this.isNotEmpty()) {
        val idx = this.size-1
        val last = this[idx]
        this.removeAt(idx)
        return last
    }
    return null
}

class Calculator {
    fun rank(op: String): Int {
        return when (op) {
            "*", "/", "%" -> 0
            "+", "-" -> 1
            "(", ")" -> 2
            else -> 3
        }
    }

    fun analyze(sic: String): MutableList<Any> {
        val stack: MutableList<String> = ArrayList()
        val res: MutableList<Any> = ArrayList()
        val iter = stack.iterator()

        for (s in sic) {
            val S = s.toString()
            val isInt = toInt(S)
            if (isInt != null) res.add(isInt!!)
            else {
                when (S) {
                    "(" -> stack.add(S)
                    ")" -> {
                        for (k in 1..stack.size) {
                            if (stack[stack.size-1] == "(") {
                                stack.pop()
                                break
                            }
                            else {
                                res.add(stack.pop()!!)
                            }
                        }
                    }
                    else -> {
                        if (!stack.isEmpty() && (rank(S) >= rank(stack[stack.size-1]))) res.add(stack.pop()!!)
                        stack.add(S)
                    }
                }
            }
        }

        for (j in stack) res.add(j)

        return res
    }

    fun evaluate(sic: String): Long {
        val stack: MutableList<Long> = ArrayList()
        for (s in analyze(sic)) {
            val S = s.toString()
            val isInt = toInt(S)
            if (isInt != null) stack.add(isInt.toLong())
            else {
                val num1 = stack.pop()!!.toLong()
                val num2 = stack.pop()!!.toLong()
                val res = when (S) {
                    "+" -> num1 + num2
                    "-" -> num1 - num2
                    "*" -> num2 * num1
                    "/" -> num2 / num1
                    "%" -> num2 % num1
                    else -> 0.toLong()
                }

                stack.add(res)
            }
        }
        return stack.pop()!!
    }

    fun toInt(str: String): Long? {
        try { return str.toLong() }
        catch (e: Exception) { return null }
    }
}
