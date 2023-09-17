	.arch armv7-a
	.fpu vfpv3-d16
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.section	.rodata
	.align	2
.LC0:
	.ascii	"%d\000"
	.align	2
.LC1:
	.ascii	"(Loop)The %d Fibonacci number is %lld.\012\000"
	.align	2
.LC2:
	.ascii	"(Recursive)The %d Fibonacci number is %lld.\012\000"
	.text
	.align	1
	.global	main
	.syntax unified
	.thumb
	.thumb_func
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r7, lr}
	sub	sp, sp, #12
	add	r7, sp, #0
	ldr	r2, .L4
.LPIC3:
	add	r2, pc
	ldr	r3, .L4+4
	ldr	r3, [r2, r3]
	ldr	r3, [r3]
	str	r3, [r7, #4]
	mov	r3, #0
	movs	r3, #0
	str	r3, [r7]
	mov	r3, r7
	mov	r1, r3
	ldr	r3, .L4+8
.LPIC0:
	add	r3, pc
	mov	r0, r3
	bl	__isoc99_scanf(PLT)
	ldr	r4, [r7]
	ldr	r3, [r7]
	mov	r0, r3
	bl	Fibonacci_loop(PLT)
	mov	r2, r0
	mov	r3, r1
	mov	r1, r4
	ldr	r0, .L4+12
.LPIC1:
	add	r0, pc
	bl	printf(PLT)
	ldr	r4, [r7]
	ldr	r3, [r7]
	mov	r0, r3
	bl	Fibonacci_recursive(PLT)
	mov	r2, r0
	mov	r3, r1
	mov	r1, r4
	ldr	r0, .L4+16
.LPIC2:
	add	r0, pc
	bl	printf(PLT)
	movs	r3, #0
	ldr	r1, .L4+20
.LPIC4:
	add	r1, pc
	ldr	r2, .L4+4
	ldr	r2, [r1, r2]
	ldr	r1, [r2]
	ldr	r2, [r7, #4]
	eors	r1, r2, r1
	mov	r2, #0
	beq	.L3
	bl	__stack_chk_fail(PLT)
.L3:
	mov	r0, r3
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	pop	{r4, r7, pc}
.L5:
	.align	2
.L4:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC3+4)
	.word	__stack_chk_guard(GOT)
	.word	.LC0-(.LPIC0+4)
	.word	.LC1-(.LPIC1+4)
	.word	.LC2-(.LPIC2+4)
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC4+4)
	.size	main, .-main
	.align	1
	.global	Fibonacci_loop
	.syntax unified
	.thumb
	.thumb_func
	.type	Fibonacci_loop, %function
Fibonacci_loop:
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4, r5, r7}
	sub	sp, sp, #44
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r1, [r7, #4]
	cmp	r1, #0
	bne	.L7
	ldr	r1, [r7, #4]
	asrs	r0, r1, #31
	mov	r2, r1
	mov	r3, r0
	b	.L8
.L7:
	mov	r2, #1
	mov	r3, #0
	strd	r2, [r7, #16]
	mov	r2, #1
	mov	r3, #0
	strd	r2, [r7, #24]
	movs	r3, #3
	str	r3, [r7, #12]
	b	.L9
.L10:
	ldrd	r2, [r7, #16]
	strd	r2, [r7, #32]
	ldrd	r0, [r7, #16]
	ldrd	r2, [r7, #24]
	adds	r4, r0, r2
	adc	r5, r1, r3
	strd	r4, [r7, #16]
	ldrd	r2, [r7, #32]
	strd	r2, [r7, #24]
	ldr	r3, [r7, #12]
	adds	r3, r3, #1
	str	r3, [r7, #12]
.L9:
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #4]
	cmp	r2, r3
	ble	.L10
	ldrd	r2, [r7, #16]
.L8:
	mov	r0, r2
	mov	r1, r3
	adds	r7, r7, #44
	mov	sp, r7
	@ sp needed
	pop	{r4, r5, r7}
	bx	lr
	.size	Fibonacci_loop, .-Fibonacci_loop
	.align	1
	.global	Fibonacci_recursive
	.syntax unified
	.thumb
	.thumb_func
	.type	Fibonacci_recursive, %function
Fibonacci_recursive:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r7, r8, r9, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	cmp	r3, #1
	beq	.L12
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bne	.L13
.L12:
	ldr	r3, [r7, #4]
	asrs	r2, r3, #31
	mov	r8, r3
	mov	r9, r2
	b	.L14
.L13:
	ldr	r3, [r7, #4]
	subs	r3, r3, #1
	mov	r0, r3
	bl	Fibonacci_recursive(PLT)
	mov	r4, r0
	mov	r5, r1
	ldr	r3, [r7, #4]
	subs	r3, r3, #2
	mov	r0, r3
	bl	Fibonacci_recursive(PLT)
	mov	r2, r0
	mov	r3, r1
	adds	r8, r4, r2
	adc	r9, r5, r3
.L14:
	mov	r2, r8
	mov	r3, r9
	mov	r0, r2
	mov	r1, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r4, r5, r7, r8, r9, pc}
	.size	Fibonacci_recursive, .-Fibonacci_recursive
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",%progbits
