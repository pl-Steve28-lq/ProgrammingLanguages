declare i32 @puts(i8* %".1")

@str = internal constant [15 x i8] c"Hello, World!\0a\00"
define void @printHelloWorld() {
  %msg = getelementptr [15 x i8], [15 x i8]* @str, i32 0, i32 0
  call i32 @puts(i8* %msg)
  ret void
}

define i32 @main() {
  call void @printHelloWorld()
  ret i32 0
}
