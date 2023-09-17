; ModuleID = 'example.c'
source_filename = "example.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"The sum is: %d\0A\00", align 1

define i32 @main() {
entry:
	  %a = alloca i32, align 4
	    %b = alloca i32, align 4
	      %sum = alloca i32, align 4
	        store i32 5, i32* %a, align 4
		  store i32 10, i32* %b, align 4
		    %0 = load i32, i32* %a, align 4
		      %1 = load i32, i32* %b, align 4
		        %add = add nsw i32 %0, %1
			  store i32 %add, i32* %sum, align 4
			    %2 = load i32, i32* %sum, align 4
			      %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i32 0, i32 0), i32 %2)
			        ret i32 0
}

declare i32 @printf(i8*, ...)
