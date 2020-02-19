BITS 64
	;; int strncmp(const char *s1, const char *s2, size_t n);
	global strcmp:function

	section .text

strncmp:
    xor     rax, rax        ; set return value to zero
    cmp     rdx, 0          ; check if arguement 3 rd is egal to zero
    jz      .EXIT           ; go to exit

.WHILE:
    mov rdx, [rdi + rax]    ; put the index of argument 1 into argument 3 (not initialised)
    mov rcx, [rsi + rax]    ; put the index of argument 2 into argument 4 (not initialised)
    cmp rdx, rcx            ; compare the index of argument 1 and argument 2
    je  .VALUE_INC          ; go to incrementation of rax
    cmp	BYTE [rdi + rax], 0 ; check if index of argument 1 is egal to '\0'
    je  .END                ; go to end
    cmp BYTE [rsi + rax], 0 ; check if index of arugment 2 is egal to '\0'
    je  .END                ; go to end
    jmp .WHILE              ; go to the while

.VALUE_INC:
    inc rax                 ; increment the compteur

.END:
    sub rdx, rcx            ; index of argument 1 egal index of argument 1 subtrac to index of argument 2
    mov rax, rdx            ; put the resultat of the calcul into the return value
    ret                     ; return value of rax

.EXIT:
    ret                     ; return value of rax