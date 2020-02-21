BITS 64
	;; int strncmp(const char *s1, const char *s2, size_t n);
	global strncmp:function

	section .text

strncmp:
    xor     rax, rax            ; set the return value to zero
    cmp     rdx, 0              ; check if the 3 rd argument is not egal to zero
    jz      .EXIT_WIN           ; go to exit win
    dec     rdx                 ; decrement the 3 rd aguement for use like index

.WHILE:
    mov     al, BYTE [rdi]      ; put the index of argument 1 into al
    cmp     BYTE [rsi], al      ; compare the index of argument 1 and argument 2
    jnz     .EXIT_FAIL          ; go to exit fail
    cmp	    BYTE [rdi], 0       ; check if index of argument 1 is egal to '\0'
    jz      .EXIT_WIN           ; go the exit win
    cmp     rdx, 0              ; check if the 3 rd argument is egal to zero
    jz      .EXIT_WIN
    inc     rdi                 ; increment of arguement 1
    inc     rsi                 ; increment of arguement 2
    dec     rdx                 ; decrement the 3 rd arguement for use like index
    jmp     .WHILE              ; go to the while

.EXIT_FAIL:
    xor     ecx, ecx            ; temporary value egal to zeo
    mov     cl, BYTE [rsi]      ; put the resultat of the calcul into the return value
    sub     eax, ecx            ; return value of eax
    ret                         ; return value

.EXIT_WIN:
    xor     rax, rax            ; reset rax to zero
    ret                         ; return value of rax