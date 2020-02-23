BITS 64
	;; size_t strcspn(const char *s, const char *reject);
	global strcspn:function

	section .text

strcspn:
	xor rdx, rdx                ; set rdx to zero for using like a compter
    jmp .LOOP					; go to loop label

.INC_RDI:
	inc rdi						; incrementation of rdi
	inc rdx						; incrementation of rdx

.LOOP:
	cmp  BYTE [rdi], 0			; check if rax is not null
	je	 .EXIT_WIN				; go to exit fail
	xor	 rcx, rcx				; initilisate rcx to zero

.WHILE:
	mov r8b, BYTE [rsi + rcx]	; mov to r8b the char of argument 2 at the index rcx
	cmp r8b, 0					; compare is r8b is not null
	jz	.INC_RDI				; to go inc rax
	cmp	BYTE [rdi], r8b			; check if rax index is not egal to r8b
	jz 	.EXIT_WIN					; return the index of rax
	inc rcx						; incrementation of rcx
	jmp .WHILE					; go to while

.EXIT_WIN:
	mov rax, rdx				; move compter rdx to rax
	ret 						; return value of rax