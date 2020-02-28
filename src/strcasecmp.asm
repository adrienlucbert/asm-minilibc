bits	64
global	strcasecmp          ; export strcasecmp symbol for linker

; int strcasecmp(const char *s1, const char *s2)
; s1 = rdi
; s2 = rsi
; ret = eax

section	.text

strcasecmp:
    