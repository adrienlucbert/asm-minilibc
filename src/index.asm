bits	64
global	index               ; export index symbol for linker
extern strchr               ; import strchr symbol

; char *index(const char *s, int c)
; s = rdi
; c = sil
; ret = rax

section	.text

index:
    call strchr wrt ..plt   ; index has the same behaviour as strchr
    ret