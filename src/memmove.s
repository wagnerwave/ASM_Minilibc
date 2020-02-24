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
    cmp    rdx, 0               ; compare rdx to zero
    je     .EXIT                ; go to exit if egal
    add    rax, rdx             ; add to rax rdx
    mov    rcx, rsi             ; mov to rcx to 2nd argument
    add    rcx, rdx             ; add to rcx rdx

.WHILE:
    dec    rax                  ; decrementation of rax
    dec    rcx                  ; decrementation of rcx
    mov    r8b, BYTE [rcx]      ; mov to r8b to byte of rcx
    mov    rdi, rax             ; mov to rdi rax
    jne    .LOOP                ; if not egal to loop

.EXIT:
    ret                         ; return value of rax