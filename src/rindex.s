BITS 64
	;; char *rindex(const char *s, int c);
	global rindex:function

	section .text

rindex:
    xor     eax, eax        ; set return value to zero

.WHILE:
    mov     cl, BYTE [rdi]  ; put the index of argument 1 into al
    cmp     cl, sil         ; comparement the index of argument 1 with argument 2
    je      .FIND           ; go to find
    cmp     cl, 0           ; compare if it is the end of the argument 1
    jz      .EXIT_FAIL      ; go to exit fail
    inc     rdi             ; increment of arguement 1
    jmp     .WHILE          ; go the the while

.FIND:
    mov     rax, rdi        ; move pointer of argument 1 to rax
    ret                     ; return value of rax

.EXIT_FAIL:
    mov     rax, 0          ; return value egal NULL
    ret                     ; return value of rax