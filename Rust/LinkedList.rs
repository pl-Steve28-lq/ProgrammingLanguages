use std::fmt;

struct List<T> {
  value: T,
  next: Box<Option<List<T>>>
}

impl<T> List<T> where T: fmt::Display {
  fn print(&self) {
    print!("{}", self.value);
    if self.is_tail() { return }
    let mut next = self.next().unwrap();
    loop {
      print!(" -> {}", next.value);
      if next.is_tail() { break }
      next = next.next().unwrap();
    }
    println!("")
  }
}

impl<T> List<T> {
  fn append(&mut self, value: T) {
    let next = self.next.as_mut();
    match next {
      None => self.next = Box::new(Some(
        List { value, next: Box::new(None) }
      )),
      Some(x) => x.append(value)
    }
  }

  fn next(&self) -> Option<&List<T>> {
    self.next.as_ref().as_ref()
  }

  fn is_tail(&self) -> bool {
    !self.next().is_some()
  }

  fn new(value: T) -> List<T> {
    List { value, next: Box::new(None) }
  }

  fn new_with(value: T, list: List<T>) -> List<T> {
    List { value, next: Box::new(Some(list)) }
  }

  fn map<U, V>(&self, func: U) -> List<V>
    where U: Fn(&T) -> V {
    let w = func(&self.value);
    let mut list = List::new(w);
    if !self.is_tail() {
      let mut next = self.next().unwrap();
      loop {
        list.append(func(&next.value));
        if next.is_tail() { break };
        next = next.next().unwrap();
      }
    }
    list
  }
}

fn main() {
  let mut list = List::new(1);
  list.append(5);
  list.print();

  let list1 = List::new_with(7, list);
  let list2 = list1.map(|x| 3*x);
  list1.print();
  list2.print();
}
