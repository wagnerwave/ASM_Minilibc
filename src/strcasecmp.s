BITS 64
	;; int strcasecmp(const char *s1, const char *s2);
	global strcasecmp:function

	section .text


strcasecmp:
    xor rax, rax            ; set rax to zero
    xor r8, r8              ; set r8 to zero
    xor r9, r9              ; set r9 to zero

.LOOP:
    mov r8b, BYTE [rdi]     ; 1 st argument to r8b
    cmp r8b, 0x41           ; compare r8b to 'A'
    jl  .WHILE              ; go to while if lower
    cmp r8b, 0x5A           ; compare r8b to 'Z'
    jg  .WHILE              ; go to while if greater
    add r8b, 0x20           ; add space to r8b for ascii transformation

.WHILE:
    mov r9b, BYTE [rsi]     ; 2 nd argument to r9b
    cmp r9b, 0x41           ; compare 2 nd argument to 'A"
    jl  .CMP                ; go to CMP if lower
    cmp r9b, 0x5A           ; compare 2nd argument to 'Z'
    jg  .CMP                ; go to cmp if greater
    add r9b, 0x20           ; add space to r8b for ascii transformation


.CMP:
    mov al, r8b             ; move r8b to return value
    cmp r9b, al             ; compare r9b to al
    jnz .NO_MATCH           ; if not egal to zero go to NO MATCH
    cmp r8b, 0              ; compare r8b to zero
    je  .EXIT               ; if egal go to exit
    inc rdi                 ; incrementation of 1 st argument
    inc rsi                 ; incrementation of 2 nd argument
    jmp .LOOP               ; go to LOOP

.NO_MATCH:
    xor rdx, rdx            ; set rdx to zero
    mov dl, r9b             ; set dl to r9b
    sub eax, edx            ; sub to rax the 2nd argument char
    ret                     ; return value of rax

.EXIT:
    xor rax, rax            ; set rax to zero
    ret                     ; return value of rax
