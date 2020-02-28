bits	64
global	toupper             ; export toupper symbol for linker

; int toupper(int c)
; c = rdi
; ret = rax

section	.text

toupper:
    mov rax, rdi            ; set return value to c
    cmp byte rax, 97        ; compare c to 97 ('a')
    jl end                  ; if c < 'a', return
    cmp byte rax, 122        ; compare c to 122 ('z')
    jg end                  ; if c > 'z', return
    sub rax, 32             ; if c is lowercase, turn it to uppercase

end:
    ret                     ; leave function