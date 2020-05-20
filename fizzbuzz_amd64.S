#ifdef __x86_64__

	.global fizzbuzz

	.text
fizzbuzz:
	push	%rbp
	mov	%rsp, %rbp

	push	%rbx
	push	%r12
	mov	%rdi, %r12

	inc	%r12
	mov	$1, %rbx

forloop:
	mov	$3, %rsi
	mov	%rbx, %rax
	xor	%rdx, %rdx
	div	%rsi

	cmp	$0, %rdx
	jne	skipfizz

	mov	$fiz, %rdi
	xor	%rax, %rax
	call	printf

	push	$continue
	jmp	buzz
skipfizz:
	call	buzz


	mov     $num, %rdi
	mov	%rbx, %rsi
        xor     %rax, %rax
        call    printf

continue:
	mov	$nl, %rdi
	xor	%rax, %rax
	call	printf

	inc	%rbx
	cmp	%r12, %rbx
	jne	forloop

	pop	%r12
	pop	%rbx
	leave
return:
	ret

buzz:
	mov     $5, %rsi
        mov     %rbx, %rax
        xor     %rdx, %rdx
        div     %rsi

        cmp     $0, %rdx
        jne     return

	add	$8, %rsp

        mov     $buz, %rdi
        xor     %rax, %rax
        call    printf

	jmp	continue

	.section .rodata
fiz:
	.asciz	"Fizz"
buz:
	.asciz	"Buzz"
nl:
	.asciz	"\n"
num:
	.asciz	"%d"


#endif
