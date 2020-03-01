bits	64
global	strchr              ; export strchr symbol for linker

; char *strchr(const char *s, int c)
; s = rdi
; c = sil
; ret = rax

section	.text

strchr:

search:
    cmp byte [rdi], sil     ; compare first char from s to c
    je nonnull              ; if they match, return rdi
    cmp byte [rdi], 0       ; compare first char from s to \0
    je null                 ; if \0, return NULL
    inc rdi                 ; increment s pointer
    jmp search              ; keep searching for c

nonnull:
    mov rax, rdi            ; set return value to begin of string
    ret                     ; leave function

null:
    xor rax, rax            ; set return value to NULL (0)
    ret                     ; leave function