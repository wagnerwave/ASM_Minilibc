BITS 64
	;; void *memcpy(void *dest, const void *src, size_t n);
	global memcpy:function

	section .text

memcpy:
    mov     rax, rdi                ; put the 1 st argument into return value

.LOOP:
    cmp     rdx, 0                  ; compare if rcx is egal to the 3 rd argument
    je      .EXIT                   ; if egal go to exit
    mov     r8b, BYTE [rsi]         ; put the value of the 2 nd arguement into al
    mov     BYTE [rdi], r8b         ; put the value of the 2 nd argument into the 1st arguement
    dec     rdx                     ; deincrementation of rdx
    inc     rsi                     ; incrementation of pointer of argument 2
    inc     rdi                     ; incrementation of pointer of argument 1
    jmp     .LOOP                   ; go to the loop

.EXIT:
    ret                             ; return value of rax