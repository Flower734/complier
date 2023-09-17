; ModuleID = 'a.bc'
source_filename = "main.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.1 = private unnamed_addr constant [40 x i8] c"(Loop)The %d Fibonacci number is %lld.\0A\00", align 1
@.str.2 = private unnamed_addr constant [45 x i8] c"(Recursive)The %d Fibonacci number is %lld.\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  store i32 0, i32* %2, align 4
  %3 = call i32 (i8*, ...) @__isoc99_scanf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* noundef %2)
  %4 = load i32, i32* %2, align 4
  %5 = load i32, i32* %2, align 4
  %6 = call i64 @Fibonacci_loop(i32 noundef %5)
  %7 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([40 x i8], [40 x i8]* @.str.1, i64 0, i64 0), i32 noundef %4, i64 noundef %6)
  %8 = load i32, i32* %2, align 4
  %9 = load i32, i32* %2, align 4
  %10 = call i64 @Fibonacci_recursive(i32 noundef %9)
  %11 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([45 x i8], [45 x i8]* @.str.2, i64 0, i64 0), i32 noundef %8, i64 noundef %10)
  ret i32 0
}

declare i32 @__isoc99_scanf(i8* noundef, ...) #1

declare i32 @printf(i8* noundef, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @Fibonacci_loop(i32 noundef %0) #0 {
  %2 = alloca i64, align 8
  %3 = alloca i32, align 4
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  %6 = alloca i32, align 4
  %7 = alloca i64, align 8
  store i32 %0, i32* %3, align 4
  %8 = load i32, i32* %3, align 4
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %13

10:                                               ; preds = %1
  %11 = load i32, i32* %3, align 4
  %12 = sext i32 %11 to i64
  store i64 %12, i64* %2, align 8
  br label %29

13:                                               ; preds = %1
  store i64 1, i64* %4, align 8
  store i64 1, i64* %5, align 8
  store i32 3, i32* %6, align 4
  br label %14

14:                                               ; preds = %24, %13
  %15 = load i32, i32* %6, align 4
  %16 = load i32, i32* %3, align 4
  %17 = icmp sle i32 %15, %16
  br i1 %17, label %18, label %27

18:                                               ; preds = %14
  %19 = load i64, i64* %4, align 8
  store i64 %19, i64* %7, align 8
  %20 = load i64, i64* %5, align 8
  %21 = load i64, i64* %4, align 8
  %22 = add nsw i64 %20, %21
  store i64 %22, i64* %4, align 8
  %23 = load i64, i64* %7, align 8
  store i64 %23, i64* %5, align 8
  br label %24

24:                                               ; preds = %18
  %25 = load i32, i32* %6, align 4
  %26 = add nsw i32 %25, 1
  store i32 %26, i32* %6, align 4
  br label %14, !llvm.loop !6

27:                                               ; preds = %14
  %28 = load i64, i64* %4, align 8
  store i64 %28, i64* %2, align 8
  br label %29

29:                                               ; preds = %27, %10
  %30 = load i64, i64* %2, align 8
  ret i64 %30
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @Fibonacci_recursive(i32 noundef %0) #0 {
  %2 = alloca i64, align 8
  %3 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  %4 = load i32, i32* %3, align 4
  %5 = icmp eq i32 %4, 1
  br i1 %5, label %9, label %6

6:                                                ; preds = %1
  %7 = load i32, i32* %3, align 4
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %12

9:                                                ; preds = %6, %1
  %10 = load i32, i32* %3, align 4
  %11 = sext i32 %10 to i64
  store i64 %11, i64* %2, align 8
  br label %20

12:                                               ; preds = %6
  %13 = load i32, i32* %3, align 4
  %14 = sub nsw i32 %13, 1
  %15 = call i64 @Fibonacci_recursive(i32 noundef %14)
  %16 = load i32, i32* %3, align 4
  %17 = sub nsw i32 %16, 2
  %18 = call i64 @Fibonacci_recursive(i32 noundef %17)
  %19 = add nsw i64 %15, %18
  store i64 %19, i64* %2, align 8
  br label %20

20:                                               ; preds = %12, %9
  %21 = load i64, i64* %2, align 8
  ret i64 %21
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
