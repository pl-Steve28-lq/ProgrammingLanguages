extension String {
    subscript (i: Int) -> String {
        return String(
                self[self.index(self.startIndex, offsetBy: i)]
            )
    }
}

class Brainfuck {
    var value: [Int]
    var pointer: Int
    init(size: Int = 256) {
        self.value = [Int](repeating: 0, count: size)
        self.pointer = 0
    }
    
    func findLoops(code: String)-> [Int : Int] {
        var dict: [Int : Int] = [:]
        var stack: [Int] = []
        var index = 0
        while (index < code.count) {
            let chr = code[index]
            if (chr == "[") {
                stack.append(index)
            }
            if (chr == "]") {
                let i = stack.popLast()!
                dict[i] = index
                dict[index] = i
            }
            index += 1
        }
        return dict
    }
    
    func compile(code: String, input: String = "") -> String {
        var str = ""
        var idx = 0
        var inputindex = 0
        var len = code.count
        let loops = self.findLoops(code: code)
        
        while (idx < len) {
            let cmd = code[idx]
            self.pointer %= self.value.count
            switch cmd { 
            case ">":
                self.pointer += 1
            case "<":
                self.pointer -= 1
            case "+":
                self.value[self.pointer] += 1
            case "-":
                self.value[self.pointer] -= 1
            case ".":
                let s = UnicodeScalar(self.getValue())
                str += String(s!)
            case "[":
                if (getValue() == 0) {
                    idx = loops[idx]!-1
                }
            case "]":
                if (getValue() != 0) {
                    idx = loops[idx]!-1
                }
            case ",":
                if (inputindex < input.count) {
                    self.value[self.pointer] = Int(Character(input[inputindex]).asciiValue!)
                    inputindex += 1
                }
                else {
                    self.value[self.pointer] = 0
                }
            default: continue
            }
            idx += 1
        }
        return str
    }
    
    func getValue()-> Int {
        return self.value[self.pointer]
    }
}
