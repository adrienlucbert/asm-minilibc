bits	64
global	memmove                 ; export memmove symbol for linker

; void *memmove(void *dest, const void *src, size_t n)
; dest = rdi
; src = rsi
; n = rdx
; ret = rax

section	.text

memmove:
    