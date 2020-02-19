BITS 64
	;; char *strchr(const char *s, int c);
	global strchr:function

	section .text

strchr:
	mov rax, rdi		; move the 1 fs argument to return value

.LOOP:
	cmp BYTE[rax], sil	; compare the return value to the 8bit 2nd arg
	je .EXIT_WORK		; if compare is true
	cmp	BYTE[rax], 0	; if rax == '\0'
	je .EXIT_FAIL		; go to exit_fail
	inc rax				; incrementation  rax
	jmp .LOOP			; do the loop again

.EXIT_FAIL:
	xor rax, rax		; return NULL

.EXIT_WORK:
	ret					; return rax
