class BrainFuck {
  constructor( ) {
    this.pointer = 0;
    this.values = new Array(256).fill(0);
  }

  places(s, tag) {
    let a = [];
    let S = s.split('');
    for (let i = 0; i < s.match(tag).length; i++) {
      a.push(S.indexOf(tag));
      S[S.indexOf(tag)] = "ㅁ";
    }
    return a;
  }

  loophelp(ind, code) {
    let A = this.places(code,"\\[")
    let B = this.places(code,"\\]").reverse()
    if (A.length != B.length) console.log("Error!")
    else return A[B.indexOf(ind)]
  }

  brainfuck(code) {
    let b = [];
    for (let t = 0; t < code.length; t++) {
      let a = code[t];
      this.pointer = this.pointer % 256;
      if (a == "v") console.log(this.values[this.pointer]);
      if (a == "+") this.values[this.pointer] += 1;
      if (a == "-") this.values[this.pointer] -= 1;
      if (a == ">") this.pointer += 1;
      if (a == "<") this.pointer -= 1;
      if (a == ".") b.push(String.fromCharCode(this.values[this.pointer]));
      if (a == "[") continue;
      if (a == "]") {
        if (this.values[this.pointer] != 0) {
          this.brainfuck(code.substring(this.loophelp(t,code),t+1));
        }
        else continue
      }
      else continue
    }
    if (b.length != 0) console.log(b.join(''))
  }
}
