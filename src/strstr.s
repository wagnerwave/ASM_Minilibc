BITS 64
	;; char *strstr(const char *haystack, const char *needle);
	global strstr:function

	section .text

strstr:
    mov     rax, rdi                ; put the 1 st argument to rax
    jmp     .LOOP                   ; go to loop

.INC_RAX:
    inc     rax                     ; incrementation  of rax

.LOOP:
    cmp     BYTE [rax], 0           ; check if rax is not NULL
    je      .EXIT_FAIL              ; go to exit fail
    mov     rcx, rax                ; move arguement 1 to rcx
    mov     rdx, rsi                ; move arguement two into rdx

.WHILE:
    cmp     BYTE [rdx], 0           ; check if the 1 st argument is egal to zero
    jz      .RET                    ; go to ret
    cmp     BYTE [rcx], 0           ; check if argument 2 if not egal to zero
    jz      .EXIT_FAIL              ; if egal go to exit fail
    mov     r8b, BYTE [rdx]         ; put the index of argument 1 into r8b
    cmp     BYTE [rcx], r8b         ; comparement the index of argument 1 with argument 2
    jne     .INC_RAX                ; if not egal go to inc rax
    inc     rdx                     ; increment of arguement 1
    inc     rcx                     ; incrementation of the index
    jmp     .WHILE                  ; go the the while

.EXIT_FAIL:
    cmp    BYTE [rsi], 0            ;
    jz     .RET
    xor    rax, rax                 ; rax egal NULL
    ret                             ; return value of rax

.RET:
    ret