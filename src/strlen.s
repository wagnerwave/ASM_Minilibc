BITS 64
	;; size_t strlen(char const *s);
	global  strlen:function

	section .text

strlen:
	xor	rax, rax 			;  move the 1 fst argument to the return value

.LOOP:
	cmp	BYTE[rdi + rax], 0  ; compare byte value to NULL
	je	.EXIT		 	    ; go to exit if the comparasion is true
	inc	rax		   			; increment rax
	jmp	.LOOP		   		; go to himself

.EXIT:
	ret						; return value