; Written by Steve28

define i32 @main() {
entry:
  %val = call i32 @fact(i32 6)
  call void @putInt(i32 %val)
  ret i32 0
}

define i32 @fact(i32 %n) {
entry:
  %lsq = icmp sgt i32 %n, 0
  br i1 %lsq, label %"value", label %"base_value"
value:
  %tmp = sub i32 %n, 1
  %prev = call i32 @fact(i32 %tmp)
  %val = mul i32 %n, %prev
  ret i32 %val
base_value:
  ret i32 1
}

@.str = private constant [2 x i8] c"%d"
define void @putInt(i32 %n) {
  %str = getelementptr inbounds [2 x i8]* @.str, i32 0, i32 0
  %tmp = call i32 (i8*, ...)* @printf(i8* %str, i32 %n)
  ret void
}

declare i32 @printf(i8*, ...)
