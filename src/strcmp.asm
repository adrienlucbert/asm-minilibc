bits	64
global	strcmp                  ; export strcmp symbol for linker

; int strcmp(const char *s1, const char *s2)
; s1 = rdi
; s2 = rsi
; ret = eax

section	.text

strcmp:
    push r8                 ; save r8

compare:
    mov r8b, byte [rsi]     ; as x86 can't perform mem to mem cmp, copy byte from s2 to scratch
    cmp byte [rdi], r8b     ; compare byte from s1 to byte from s2
    jne setvalue            ; if not equal, return
    cmp byte [rdi], byte 0  ; check if end of s1 is not reached
    je setvalue             ; if it is, return
    cmp byte [rsi], byte 0  ; check if end of s2 is not reached
    je setvalue             ; if it is, return
    inc rdi                 ; increment s1 pointer
    inc rsi                 ; increment s2 pointer
    jmp compare             ; keep comparing

setvalue:
    mov r8b, byte [rsi]     ; as x86 can't perform mem to mem cmp, copy byte from s2 to scratch
    cmp byte [rdi], r8b     ; compare byte from s1 to scratch (byte from s1)
    jg plus                 ; if it is greater, return 1
    jl minus                ; if it is lower, return -1
    je equal                ; if it is equal, return 0

plus:
    mov eax, 1              ; set return value to 1
    jmp end                 ; return

minus:
    mov eax, -1             ; set return value to -1
    jmp end                 ; return

equal:
    mov eax, 0              ; set return value to 0
    jmp end                 ; return

end:
    pop r8                  ; restore r8
    ret