	.text
	.file	"main.c"
	.globl	main                            # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -24
	movl	$0, -16(%rbp)
	movl	$0, -12(%rbp)
	movabsq	$.L.str, %rdi
	leaq	-12(%rbp), %rsi
	movb	$0, %al
	callq	__isoc99_scanf@PLT
	movl	-12(%rbp), %ebx
	movl	-12(%rbp), %edi
	callq	Fibonacci_loop
	movabsq	$.L.str.1, %rdi
	movl	%ebx, %esi
	movq	%rax, %rdx
	movb	$0, %al
	callq	printf@PLT
	movl	-12(%rbp), %ebx
	movl	-12(%rbp), %edi
	callq	Fibonacci_recursive
	movabsq	$.L.str.2, %rdi
	movl	%ebx, %esi
	movq	%rax, %rdx
	movb	$0, %al
	callq	printf@PLT
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.globl	Fibonacci_loop                  # -- Begin function Fibonacci_loop
	.p2align	4, 0x90
	.type	Fibonacci_loop,@function
Fibonacci_loop:                         # @Fibonacci_loop
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	%edi, -8(%rbp)
	cmpl	$0, -8(%rbp)
	jne	.LBB1_2
# %bb.1:
	movslq	-8(%rbp), %rax
	movq	%rax, -32(%rbp)
	jmp	.LBB1_7
.LBB1_2:
	movq	$1, -16(%rbp)
	movq	$1, -24(%rbp)
	movl	$3, -4(%rbp)
.LBB1_3:                                # =>This Inner Loop Header: Depth=1
	movl	-4(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jg	.LBB1_6
# %bb.4:                                #   in Loop: Header=BB1_3 Depth=1
	movq	-16(%rbp), %rax
	movq	%rax, -40(%rbp)
	movq	-24(%rbp), %rax
	addq	-16(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, -24(%rbp)
# %bb.5:                                #   in Loop: Header=BB1_3 Depth=1
	movl	-4(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -4(%rbp)
	jmp	.LBB1_3
.LBB1_6:
	movq	-16(%rbp), %rax
	movq	%rax, -32(%rbp)
.LBB1_7:
	movq	-32(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end1:
	.size	Fibonacci_loop, .Lfunc_end1-Fibonacci_loop
	.cfi_endproc
                                        # -- End function
	.globl	Fibonacci_recursive             # -- Begin function Fibonacci_recursive
	.p2align	4, 0x90
	.type	Fibonacci_recursive,@function
Fibonacci_recursive:                    # @Fibonacci_recursive
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset %rbx, -24
	movl	%edi, -12(%rbp)
	cmpl	$1, -12(%rbp)
	je	.LBB2_2
# %bb.1:
	cmpl	$0, -12(%rbp)
	jne	.LBB2_3
.LBB2_2:
	movslq	-12(%rbp), %rax
	movq	%rax, -24(%rbp)
	jmp	.LBB2_4
.LBB2_3:
	movl	-12(%rbp), %edi
	subl	$1, %edi
	callq	Fibonacci_recursive
	movq	%rax, %rbx
	movl	-12(%rbp), %edi
	subl	$2, %edi
	callq	Fibonacci_recursive
	addq	%rax, %rbx
	movq	%rbx, -24(%rbp)
.LBB2_4:
	movq	-24(%rbp), %rax
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end2:
	.size	Fibonacci_recursive, .Lfunc_end2-Fibonacci_recursive
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%d"
	.size	.L.str, 3

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"(Loop)The %d Fibonacci number is %lld.\n"
	.size	.L.str.1, 40

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"(Recursive)The %d Fibonacci number is %lld.\n"
	.size	.L.str.2, 45

	.ident	"Ubuntu clang version 14.0.0-1ubuntu1.1"
	.section	".note.GNU-stack","",@progbits
