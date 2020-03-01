bits	64
global	strncmp                 ; export strncmp symbol for linker

; int strncmp(const char *s1, const char *s2, size_t n)
; s1 = rdi
; s2 = rsi
; n = rdx
; ret = eax

section	.text

strncmp:
    push r8                 ; save r8
    xor rax, rax            ; set default return value to 0

compare:
    cmp rdx, 0              ; compare counter to n
    jle return              ; if counter <= 0, return
    mov r8b, byte [rsi]     ; as x86 can't perform mem to mem cmp, copy byte from s2 to scratch
    cmp byte [rdi], r8b     ; compare byte from s1 to byte from s2
    jne end                 ; if not equal, return
    cmp byte [rdi], byte 0  ; check if end of s1 is not reached
    je end                  ; if it is, return
    cmp byte [rsi], byte 0  ; check if end of s2 is not reached
    je end                  ; if it is, return
    dec rdx                 ; decrement counter
    inc rdi                 ; increment s1 pointer
    inc rsi                 ; increment s2 pointer
    jmp compare             ; keep comparing

end:
    xor rax, rax            ; set return value to 0
    xor r8, r8              ; set scratch register r8 to 0
    mov al, byte [rdi]      ; set return value to char from s1
    mov r8b, byte [rsi]     ; set r8 value to char from s2
    sub rax, r8             ; substract r8 value to rax

return:
    pop r8                  ; restore r8
    ret                     ; leave function