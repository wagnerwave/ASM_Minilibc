BITS 64
	;; int strcmp(const char *s1, const char *s2);
	global strcmp:function

	section .text

strcmp:
    xor     rax, rax            ; set return value to zero

.WHILE:
    mov     al, BYTE [rdi]      ; put the index of argument 1 into al
    cmp     BYTE [rsi], al      ; compare the index of argument 1 with argument 2
    jnz     .EXIT_FAIL          ; go to exit fail
    cmp	    al, 0               ; check if index of argument 1 is egal to '\0'
    jz      .EXIT_WIN           ; go the exit win
    inc     rdi                 ; increment of arguement 1
    inc     rsi                 ; increment of arguement 2
    jmp     .WHILE              ; go to the while


.EXIT_FAIL:
    xor     ecx, ecx            ; temporary value egal to zeo
    mov     cl, BYTE [rsi]      ; put the resultat of the calcul into the return value
    sub     eax, ecx            ; return value of eax
    ret                         ; return value

.EXIT_WIN:
    ret                         ; return value of rax