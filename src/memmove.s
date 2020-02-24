BITS 64
	;; void *memmove(void *dest, const void *src, size_t n);
	global memmove:function

	section .text

memmove:
    cmp    rsi, rdi             ; compare the 2nd argument to 1 st argument
    jl     .CPY_MEMORY          ; jump if lower
    mov    rax, rdi             ; put the 1 st argument to rax
    mov    rcx, rdx             ; put the 3 nd argument to rcx
    mov    rdx, rsi             ; put the 2 nd argument to rdx
    cld                         ; clear redirection flag
    rep    movsb                ; repete action of flag
    mov    rsi, rdx             ; put the rdx  to 2nd argument
    mov    rdi, rax             ; put rax to 1 st argument
    ret                         ; return value of rax

.CPY_MEMORY:
    mov    rax, rdi             ; put the 1 st argument to rax

.WHILE:
    cmp     rdx, 0              ; compare rdx to zero
    je      .EXIT               ; if egal go to exit
    mov     al, BYTE [rsi]      ; move the 2nd byte argument to rax (8bit)
    mov     BYTE [rdi], al      ; compare the byte of 1 st argument with rax (8bit)
    dec     rdx                 ; decrementation of rdx
    inc     rdi                 ; incrementation of rdi
    inc     rsi                 ; incrementation of 2 nd argument
    jmp     .WHILE              ; go to WHILe

.EXIT:
    ret                         ; return value of rax