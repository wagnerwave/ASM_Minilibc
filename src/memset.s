BITS 64
	;; void *memset(void *s, int c, size_t n);
	global memset:function

	section .text

memset:
    mov     rax, rdi    ; move the 1 fst argument to the return value
    mov     rcx, rdx    ; move the 3 rd  argument to the 4 th argument (uninitialisate)

.LOOP:
    jrcxz   .EXIT       ; jump to the exit function if rdx is egal to 0
    cmp     [rax], sil  ; compare the value of the sil is pointing into the rax register
    dec     rcx         ; decrement rcx
    inc     rax         ; increment rax
    jmp     .LOOP       ; go to himself

.EXIT:
    mov     rax, rdi    ; load the value of the rdi register into the rax register
    ret                 ; return value