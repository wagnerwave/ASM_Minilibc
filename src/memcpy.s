BITS 64
	;; void *memcpy(void *dest, const void *src, size_t n);
	global memcpyA:function

	section .text

memcpy:
    mov     rax, rdi                ; put the 1 st argument into return value
    cmp     rdx, 0                  ; compare if the 3 rd argument is egal to zero
    je      .EXIT                   ; go to exit
    cmp     rsi, 0                  ; compare if the 2 nd arguement is egal to 0
    je      .EXIT                   ; go to exit
    dec     rdx                     ; decrement rdx to use like a index

.LOOP:
    cmp     rdx, 0                  ; compare if rcx is egal to the 3 rd argument
    jz      .EXIT                   ; if egal go to exit
    mov     al, BYTE [rsi]          ; put the value of the 2 nd arguement into al
    mov     BYTE [rdi], al          ; put the value of the 2 nd argument into the 1st arguement
    dec     rdx                     ; deincrementation of rdx
    inc     rdi                     ; incrementation of rdi
    jmp     .LOOP                   ; go to the loop

.EXIT:
    ret                             ; return value of rax