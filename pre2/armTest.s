.arch armv7-a
.comm n, 4
.text
.align 2
.section .rodata
.align 2
_str0:
	.ascii "Input the integer \n"
	.align 2
_str1:
	.ascii "%d\0"
	.align 2
_str2:
	.ascii "The result is %d \n"
	.text
	.align 2
.global fibbonacci_loop
fibbonacci_loop:
	@ 保护现场
	push {r3, r4, r5, fp, lr}

	@ 开辟空间
	mov fp, sp
	sub sp, #12
	
	@ Fib0 = 0
	mov r3, #0
	str r3, [fp, #-4]

	@ Fib1 = 1  
	mov r3, #1
	str r3, [fp, #-8]

	@ Index = 0  
	mov r3, #0
	str r3, [fp, #-12]

	@ 跳转至循环体
	b .loop	
.loop:
	@ 输入的n>1 开始循环 直到Index=n
	ldr r4, [fp, #-12]
	cmp r0, r4
	beq .end_loop

	@ temp=Fib1 Fib1=Fib1+Fib0 Fib0=temp
	ldr r3, [fp, #-4]
	ldr r4, [fp, #-8]
	mov r5, r4
	add r4, r3
	str r4, [fp, #-8]
	str r5, [fp, #-4]

	@ Index++
	ldr r3, [fp, #-12]
	add r3, #1
	str r3, [fp, #-12]

	@ 开始新一轮循环
	b .loop
.end_loop:
	@ 返回 Fib0
	ldr r0, [fp, #-4]

	@ 恢复现场
	mov sp, fp
	pop {r3, r4, r5, fp, pc}
.global main
main:
	@ 保护现场
	push {fp,lr}

	@ printf(_str0)
	ldr r0, _bridge+4
	bl printf

	@ scanf(_str1,&n)
	ldr r0, _bridge+8
	ldr r1, _bridge
	bl __isoc99_scanf

	@ printf(_str2,n,fibbonacci(n))
	ldr r1, _bridge
	ldr r0, [r1]
	bl fibbonacci_loop
	mov r1, r0
	ldr r0, _bridge+12
	bl printf

	@ return 0
	mov r0, #0
	pop {fp,pc}
_bridge:
	.word n
	.word _str0
	.word _str1
	.word _str2

	.section	.note.GNU-stack,"",%progbits
