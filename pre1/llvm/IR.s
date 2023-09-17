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
	.file	"IR.c"
	.text
	.global	N
	.data
	.align	2
	.type	N, %object
	.size	N, 4
N:
	.word	1
	.global	num
	.section	.rodata
	.align	2
	.type	num, %object
	.size	num, 4
num:
	.word	1
	.text
	.align	1
	.global	func
	.syntax unified
	.thumb
	.thumb_func
	.type	func, %function
func:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	movs	r3, #0
	str	r3, [r7]
	movs	r3, #0
	str	r3, [r7, #4]
	b	.L2
.L6:
	movs	r2, #1
	ldr	r3, [r7]
	add	r3, r3, r2
	str	r3, [r7]
	ldr	r3, [r7]
	cmp	r3, #0
	bne	.L3
	b	.L2
.L3:
	ldr	r3, [r7]
	cmp	r3, #0
	and	r3, r3, #1
	it	lt
	rsblt	r3, r3, #0
	cmp	r3, #1
	bne	.L4
	ldr	r3, [r7]
	mul	r3, r3, r3
	ldr	r2, [r7, #4]
	add	r3, r3, r2
	str	r3, [r7, #4]
.L4:
	ldr	r3, [r7]
	cmp	r3, #9
	beq	.L8
.L2:
	ldr	r3, .L9
.LPIC0:
	add	r3, pc
	ldr	r3, [r3]
	ldr	r2, [r7]
	cmp	r2, r3
	blt	.L6
	b	.L5
.L8:
	nop
.L5:
	ldr	r3, [r7, #4]
	mov	r0, r3
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L10:
	.align	2
.L9:
	.word	N-(.LPIC0+4)
	.size	func, .-func
	.section	.rodata
	.align	2
.LC0:
	.ascii	"%d\000"
	.align	2
.LC1:
	.ascii	"yes\000"
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
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	movs	r3, #10
	str	r3, [r7]
	ldr	r0, [r7]
	bl	func(PLT)
	str	r0, [r7, #4]
	ldr	r1, [r7, #4]
	ldr	r3, .L13
.LPIC1:
	add	r3, pc
	mov	r0, r3
	bl	printf(PLT)
	ldr	r3, .L13+4
.LPIC2:
	add	r3, pc
	mov	r0, r3
	bl	printf(PLT)
	movs	r3, #0
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L14:
	.align	2
.L13:
	.word	.LC0-(.LPIC1+4)
	.word	.LC1-(.LPIC2+4)
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",%progbits
