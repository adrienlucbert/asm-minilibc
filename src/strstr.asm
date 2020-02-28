bits	64
global	strstr                  ; export strstr symbol for linker

; char *strstr(const char *haystack, const char *needle)
; haystack = rdi
; needle = rsi
; ret = rax

section	.text

strstr:
    