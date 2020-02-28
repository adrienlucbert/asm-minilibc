bits	64
global	tolower             ; export tolower symbol for linker

; int tolower(int c)
; c = rdi
; ret = rax

section	.text

tolower:
    mov rax, rdi            ; set return value to c
    cmp byte rax, 65        ; compare c to 65 ('A')
    jl end                  ; if c < 'A', return
    cmp byte rax, 90        ; compare c to 90 ('Z')
    jg end                  ; if c > 'Z', return
    add rax, 32             ; if c is uppercase, turn it to lowercase

end:
    ret                     ; leave function