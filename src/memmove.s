BITS 64
	;; void *memmove(void *dest, const void *src, size_t n);
	global memmove:function

	section .text

memmove:
    mov     rax, rdi                ; put the 1 st argument into return value
    cmp     rdi, 0                  ; if the 2nd argument is NULL
    je      .EXIT_FAIL              ; go to exit fail
    cmp     rdx, 0                  ; if the argument 3rd is egal to 0
    jz      .EXIT                   ; go to exit
    xor     r8, r8                  ; index

.LOOP:
    cmp     rdi, 0                  ; if the 2nd argument is NULL
    je      .EXIT                   ; go to exit
    cmp     r8, rdx                 ; if the index is egal to 3 rd argument
    je      .EXIT                   ; if egal go to exit
    mov     dl, BYTE [rsi]          ; put the value of the 2 nd arguement into dl
    mov     BYTE [rdi], dl          ; put the value of dl into the 1st arguement
    inc     r8                      ; incrementation of index
    inc     rsi                     ; incrementation of 2 nd argument
    inc     rdi                     ; incrementation of 1 st argument
    jmp     .LOOP                   ; go to the loop

.EXIT_FAIL:
    mov     rax, 0                  ; return value egal NULL
    ret                             ; return value of rax

.EXIT:
    ret                             ; return value of rax