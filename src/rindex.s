BITS 64
	;; char *rindex(const char *s, int c);
	global rindex:function

	section .text

rindex:
    xor     rax, rax        ; set return value to zero

.WHILE:
    mov     al, BYTE [rdi]  ; put the index of argument 1 into al
    cmp     sil,  al        ; comparement the index of argument 1 with argument 2
    je      .FIND           ; go to find
    inc     rdi             ; increment of arguement 1
    cmp     BYTE [rdi], 0   ; check if argument 1 pointer is not null
    je      .EXIT_WIN       ; if egal go to exit win
    jne     .WHILE          ; go the the while

.FIND:
    mov   rax, rdi          ; move pointer of argument 1 to rax
    jmp   .EXIT_WIN         ; return value of rax

.EXIT_WIN:
    ret                     ; return value of rax
