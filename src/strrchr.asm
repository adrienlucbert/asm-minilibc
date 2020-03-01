bits	64
global	strrchr             ; export strrchr symbol for linker

; char *strrchr(const char *s, int c)
; s = rdi
; c = sil
; ret = rax

section	.text

strrchr:
    xor rax, rax            ; set default return value to NULL (0)

search:
    cmp byte [rdi], sil     ; compare first char from s to c
    cmove rax, rdi          ; if they match, set rdi as return value
    cmp byte [rdi], 0       ; compare first char from s to \0
    je end                  ; if \0, return rax
    inc rdi                 ; increment counter
    jmp search              ; keep searching for c

end:
    ret                     ; leave function