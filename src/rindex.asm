bits	64
global	rindex              ; export rindex symbol for linker
extern strrchr              ; import strrchr symbol

; char *rindex(const char *s, int c)
; s = rdi
; c = sil
; ret = rax

section	.text

rindex:
    call strrchr wrt ..plt  ; rindex has the same behaviour as strrchr
    ret