BITS 64
	;; void *memmove(void *dest, const void *src, size_t n);
	global memmove:function

	section .text

memmove:
    mov      rcx, 0                 ; set rcx to 0
    jmp      .LOOP                  ; jump to loop

.INC_RCX:
    inc     rcx                     ; increment rcx

.LOOP:
    cmp     BYTE [rdi + rcx], 0     ; check if is not the end of the 2nd argument
    jz      .EXIT_FAIL              ; go to EXIT FAIL
    cmp     BYTE [rdi + rcx], sil   ; compare the index of 1st argument into sil
    jne     .INC_RCX                ; if not egal go increment rcx
    mov     rax, [rdi + rcx]         ; move the pointer info the return value
    jmp     .RET                    ; go to return

.EXIT_FAIL:
    xor     rax, rax                  ; set rax to 0

.RET:
    ret                             ; return value of rax