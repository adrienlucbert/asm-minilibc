bits	64
global strpbrk              ; export strpbrk symbol for linker
extern strchr               ; import strchr symbol

; char *strpbrk(const char *s, const char *accept)
; s = rdi
; accept = rsi
; ret = rax

section	.text

strpbrk:
    mov r8, rdi             ; save s to r8
    mov r9, rsi             ; save accept to r9
    xor rax, rax            ; set default return value to NULL (0)

search:
    cmp byte [r8], 0        ; compare char from s to \0
    je end                  ; if end of s found, return NULL
    mov rdi, r9             ; set accept as param s for strchr
    mov sil, byte [r8]      ; set char from s as param c for strchr
    call strchr wrt ..plt   ; call strchr(accept, *s)
    cmp rax, 0              ; if *s was found in accept
    cmovne rax, r8          ; then set s as return value
    jne end                 ; and return
    inc r8                  ; increment s pointer
    jmp search              ; keep searching

end:
    ret                     ; leave function