bits	64
global	strcspn                 ; export strcspn symbol for linker

; size_t strcspn(const char *s, const char *reject)
; s = rdi
; reject = rsi
; ret = rax

section	.text

strcspn:
    