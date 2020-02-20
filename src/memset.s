BITS 64
	;; void *memset(void *s, int c, size_t n);
	global memset:function

	section .text

memset:
    mov     rax, rdi        ; move the 1 fst argument to the return value
    mov     rcx, rdx        ; move the 3 rd  argument to the 4 th argument (uninitialisate)

.LOOP:
    jrcxz   .EXIT           ; go to exit if rcx is egal to zero
    cmp     rcx, 0          ; compare rcx (egal to the arguement 3 rd) is egal to zero
    je      .EXIT           ; go to exit
    mov     BYTE [rdi], sil ; put the second arguement into the byte postion of the pointer
    dec     rcx             ; decrement rcx
    jmp     .LOOP           ; go to himself

.EXIT:
    ret                 ; return value of rax