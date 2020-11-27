// 기본적인 함수
func add(_ a: Int, _ b: Int) -> Int {
  return a+b
}

// 클로저로 정의 된 함수
let closure_add: (Int, Int) -> Int = { $0 + $1 }

print(add(1, 3)) // => 4
print(closure_add(1, 3)) // => 4


/* ======================== */


// 클로저를 변수로 받는 함수
func executer(_ inp: Int, _ function: (Int) -> Int) -> Int {
  return function(inp)
}

// 변수로서의 클로저 사용
print(executer(10, {
  (n: Int) -> Int in return n * n
})) // => 100

// 변수 타입을 생략한 클로저
print( executer(10, { $0 * $0 }) ) // => 100

// 마지막 인자가 클로저라면 괄호를 벗어나서 작성 가능.
print( executer(10) { $0 * $0 } ) // => 100


/* ======================== */


// 클로저 실제 사용 ( map, filter, sort, reduce )
var arr: [Int] = [1, 3, 4, 7, 2, 6, 5]
print( arr ) // => [1, 3, 4, 7, 2, 6, 5]
print( arr.map { $0 * 2 } ) // => [2, 6, 8, 14, 4, 12, 10]
print( arr.filter { $0 % 2 == 0 }) // => [4, 2, 6]

arr.sort { $0 < $1 }
print( arr ) // => [1, 2, 3, 4, 5, 6, 7]

print( arr.reduce(0) { 
  (res: Int, value: Int)->Int in return res + value
})
// 0 -> 0+1 -> 0+1+2 -> ... -> 0+1+2+3+4+5+6+7 => 28

// 연산자도 클로저 이기 때문에 이런 표현이 가능하다.
print( arr.reduce(0, +)) // => 28
