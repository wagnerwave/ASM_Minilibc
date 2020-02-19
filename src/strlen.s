BITS 64
	;; size_t strlen(char const *s);
	global  strlen:function

	section .text

strlen:
	mov	rax, rax 	; rax = 0;

.LOOP:
	cmp	BYTE[rdi + rax], 0 ; if (*s == NULL && s[rax] == 0)
	je	.EXIT		   ; 	exit();
	inc	rax		   ; rax++;
	jmp	.LOOP		   ; loop();

.EXIT:
	ret		; return rax