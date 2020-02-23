BITS 64
	;; char *strpbkr(const char *s, const char *accept);
	global strpbkr:function

	section .text

strpbrk:
    mov rax, rdi				; put the 1 st argument to rax
	jmp .LOOP					; go to loop label

.INC_RAX:
	inc rax						; incrementation of rax

.LOOP:
	cmp  BYTE [rax], 0			; check if rax is not null
	je	 .EXIT_FAIL				; go to exit fail
	xor	 rcx, rcx				; initilisate rcx to zero

.WHILE:
	mov r8b, BYTE [rsi + rcx]	; mov to r8b the char of argument 2 at the index rcx
	cmp r8b, 0					; compare is r8b is not null
	jz	.INC_RAX				; to go inc rax
	cmp	BYTE [rax], r8b			; check if rax index is not egal to r8b
	jz 	.RET					; return the index of rax
	inc rcx						; incrementation of rcx
	jmp .WHILE					; go to while

.EXIT_FAIL:
	xor rax, rax				; reset rax to zero

.RET:
	ret 						; return value of rax