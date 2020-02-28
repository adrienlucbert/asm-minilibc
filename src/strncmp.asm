bits	64
global	strncmp                 ; export strncmp symbol for linker

; int strncmp(const char *s1, const char *s2, size_t n)
; s1 = rdi
; s2 = rsi
; n = rdx
; ret = eax

section	.text

strncmp:
    