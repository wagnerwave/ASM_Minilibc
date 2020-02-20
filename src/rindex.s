BITS 64
	;; char *rindex(const char *s, int c);
	global rindex:function

	section .text

rindex:
    xor     rax, rax        ; set return value to zero
    cmp     rdi, 0          ; compare argument 2 to NULL
    jz      .EXIT_FAIL      ; if argument 2 go to exit fail

.WHILE:
    mov     al, BYTE [rdi]  ; put the index of argument 1 into al
    cmp     sil,  al        ; comparement the index of argument 1 with argument 2
    je      .FIND           ; go to find
    inc     rdi             ; increment of arguement 1
    cmp     BYTE [rdi], 0   ; check if argument 1 pointer is not null
    je      .EXIT_FAIL      ; if egal go to exit win
    jmp   .WHILE            ; go the the while

.FIND:
    mov   rax, rdi          ; move pointer of argument 1 to rax
    jmp   .EXIT_WIN         ; return value of rax

.EXIT_WIN:
    ret                     ; return value of rax

.EXIT_FAIL:
    mov rax, 0              ; return value egal NULL
    ret                     ; return value of rax