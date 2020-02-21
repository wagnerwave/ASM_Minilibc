BITS 64
	;; char *rindex(const char *s, int c);
	global rindex:function

	section .text

rindex:
    xor     rax, rax        ; set return value to zero

.WHILE:
    mov     cl, BYTE [rdi]  ; put the index of argument 1 into al
    cmp     cl, sil         ; comparement the index of argument 1 with argument 2
    cmove   rax, rdi        ; go to find
    inc     rdi             ; increment of arguement 1
    cmp     cl, 0           ; compare if it is the end of the argument 1
    jne     .WHILE          ; go to exit fail
    ret                     ; go the the while