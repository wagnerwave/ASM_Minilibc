BITS 64
	;; char *strstr(const char *haystack, const char *needle);
	global strstr:function

	section .text

strstr:
    cmp     BYTE [rdi], 0           ; check if the 1 st argument is NULL
    je      .EXIT_FAIL              ; return NULL
    cmp     BYTE [rsi], 0           ; check if the 2 nd argument is NULL
    je      .EXIT_FAIL              ; return NULL
    mov     rax, rdi                ; put the 1 st argument to rax

.LOOP:
    cmp     BYTE [rax], 0           ; check if rax is not NULL
    je      .NOT_FOUND              ; go to not found
    xor     rcx, rcx                ; initilisate the index

.WHILE:
    mov     r8b, BYTE [rax]         ; put the index of argument 1 into r8b
    cmp     BYTE [rsi + rcx], r8b   ; comparement the index of argument 1 with argument 2
    jnz     .FIND                   ; go to find
    cmp     r8b, 0                  ; compare if it is the end of the argument 1
    jz      .FIND                   ; go to exit fail
    inc     rax                     ; increment of arguement 1
    inc     rcx                     ; incrementation of the index
    jmp     .WHILE                  ; go the the while

.FIND:
    cmp     BYTE [rsi + rcx], 0     ; check if index is at the end of 2 nd argument
    jz      .EXIT_WIN               ; go to exit win
    inc     rax                     ; return value of rax
    jmp     .LOOP                   ;

.NOT_FOUND:
    xor     rax, rax                ;
    ret                             ;

.EXIT_WIN:
    sub     rax, rcx                ;
    ret                             ;

.EXIT_FAIL:
    mov     rax, 0                  ; rax egal NULL
    ret                             ; return value of rax