use std::collections::HashMap;

type Map = HashMap<usize, usize>;

const SIZE: usize = 16;

struct BrainFuck {
  idx: usize,
  data: [i32; SIZE]
}

struct Info {
  code: String,
  input: String,
  loop_info: Map,
  code_idx: usize,
  input_idx: usize,
  output: String
}

#[derive(Debug)]
enum Action {
  INC, DEC, INP, OUT, PINC, PDEC, LOOP, POOL, NONE
}

impl BrainFuck {
  fn new() -> BrainFuck {
    BrainFuck { idx: 0, data: [0; SIZE] }
  }

  fn find_loop(code: &str) -> Map {
    let mut info = HashMap::new();
    let mut stack = Vec::new();
    for (i, c) in code.chars().enumerate() {
      if c == '[' { stack.push(i) }
      if c == ']' {
        let idx = stack.pop().unwrap();
        info.insert(i, idx);
        info.insert(idx, i);
      }
    }
    info
  }

  fn get(&self) -> i32 { self.data[self.idx] }
  fn val(&mut self) { self.idx %= SIZE; }

  fn do_action(&mut self, action: Action, mut info: Info) -> Info {
    match action {
      Action::PINC => { self.idx += 1; self.val() },
      Action::PDEC => { self.idx -= 1; self.val() },
      Action::INC => self.data[self.idx] += 1,
      Action::DEC => self.data[self.idx] -= 1,
      Action::INP => {
        self.data[self.idx] = info.input.as_bytes()[info.input_idx] as i32;
        info.input_idx += 1;
      },
      Action::OUT => info.output.push_str(&(self.get() as u8 as char).to_string()),
      Action::LOOP => {
        if self.get() == 0 {
          info.code_idx = info.loop_info[&info.code_idx]
        }
      }
      Action::POOL => {
        if self.get() != 0 { 
          info.code_idx = info.loop_info[&info.code_idx]
        }
      }
      Action::NONE => {}
    }
    info.code_idx += 1;
    info
  }

  fn get_action(c: char) -> Action {
    match c {
      '+' => Action::INC,
      '-' => Action::DEC,
      '[' => Action::LOOP,
      ']' => Action::POOL,
      '>' => Action::PINC,
      '<' => Action::PDEC,
      '.' => Action::OUT,
      ',' => Action::INP,
      _ => Action::NONE
    }
  }

  fn run_info(&mut self, info: Info) -> [i32; SIZE] {
    let code = info.code.clone();
    let mut inf = info;
    let len = code.len();
    let code = code.as_bytes();

    while inf.code_idx < len {
      let c = code[inf.code_idx] as char;
      let act = BrainFuck::get_action(c);
      inf = self.do_action(act, inf);
    }
    
    if !inf.output.is_empty() { println!("{}", inf.output) }
    self.data
  }

  fn run(&mut self, code: &str, input: &str) -> [i32; SIZE] {
    self.run_info(Info {
      code: String::from(code), input: String::from(input),
      code_idx: 0, input_idx: 0,
      loop_info: BrainFuck::find_loop(code),
      output: String::from("")
    })
  }
}

fn main() {
  let mut bf = BrainFuck::new();
  let code = "++++++++++[>+++++++>++++++++++>+++>+<<<<-]>++.>+.+++++++..+++.>++++++++++++++.------------.<<+++++++++++++++.>.+++.------.--------.>+.";
  let input = "";
  let res = bf.run(&code, &input);
  println!("{:?}", res)
}
