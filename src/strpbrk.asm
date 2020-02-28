bits	64
global	strpbrk                 ; export strpbrk symbol for linker

; char *strpbrk(const char *s, const char *accept)
; s = rdi
; accept = rsi
; ret = rax

section	.text

strpbrk:
    