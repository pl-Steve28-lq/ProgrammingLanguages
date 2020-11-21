type dict = { [ind: number] : number }
let mod = (a: number, n: number) => ((a%n)+n)%n

export class Brainfuck {
  arr: number[]
  size: number
  error: number
  
  constructor(size: number=256, err: number=100000) {
    this.arr = []
    this.size = size
    this.error = err
    for (let i=0; i<size; i++) {
      this.arr.push(0)
    }

  }
  
  analyze(code: string): dict {
    let res: dict = {}
    let stack: number[] = []
    let ind = 0
    let len = code.length
    while (ind < len) {
      let c = code[ind]
      if (c == "[") {
        stack.push(ind)
      }
      else if (c == "]") {
        let idx = stack.pop()
        if (idx != undefined) {
          res[idx] = ind
          res[ind] = idx
        } else console.log(ind)
      }  
      ind++
    }
    return res
  }
  
  compile(code: string): string {
    let info = this.analyze(code)
    let point = 0
    let err = 0
    let ind = 0
    let len = code.length
    let res = ""
    while (point < len) {
      ind = mod(ind, this.size)
      let c = code[point]
      let v = this.arr[ind]
      switch (c) {
        case "+": this.arr[ind]++; break
        case "-": this.arr[ind]--; break
        case ">": ind++; break
        case "<": ind--; break
        case "[": {
          if (v == 0) {
            point = info[point] -1
          }; break
        }
        case "]": {
          if (v != 0) {
            point = info[point] -1
          }; break
        }
        case ".": res += String.fromCharCode(v); break
      }
      err++
      if (err == this.error) {
        this.Error(point, info)
      }
      
      point++
    }
    return res
  }
  
  Error(point: number, info: dict) {
    let key = Object.keys(info)
    let och = key.map(
      (e: string) => Math.abs(parseInt(e)-point)
    )
    let ep = parseInt(
      key[och.indexOf(
        Math.min.apply(null, och)
      )]
    )
    let ep2 = info[ep]
    
    let a = Math.min(ep, ep2)
    let b = ep+ep2-a
    
    let error = `The calculation limit has been exceeded. It maybe an infinite loop at (${a}, ${b})`
    
    throw new Error(error)
  }
  
  say(code: string) {
    let res = this.compile(code)
    if (res != "") console.log(res)
  }
}
