bits	64
global	strstr                  ; export strstr symbol for linker

; char *strstr(const char *haystack, const char *needle)
; haystack = rdi
; needle = rsi
; ret = rax

section	.text

strstr:
    xor rax, rax                ; set default return value to NULL (0)
    cmp rdi, 0                  ; if haystack is NULL
    je end                      ; return NULL
    cmp byte [rsi], 0           ; if needle is empty
    cmove rax, rdi              ; set haystack as return value
    je end                      ; return haystack

search:
    cmp byte [rdi], 0           ; if end of haystack reached
    je end                      ; return NULL (0)
    xor rcx, rcx                ; set counter to 0

subsearch:
    cmp byte [rdi + rcx], 0     ; if end of haystack is reached
    je next                     ; return NULL (0)
    mov r8b, byte [rdi + rcx]   ; as x86 can't perform mem to mem cmp, copy byte first
    cmp r8b, byte [rsi + rcx]   ; if haystack[rcx] == needle[rcx]
    jne next                    ; stop matching needle
    inc rcx                     ; increment counter
    jmp subsearch               ; keep matching needle

next:
    cmp byte [rsi + rcx], 0     ; if end of needle reached
    cmove rax, rdi              ; set return value to haystack
    je end                      ; return
    inc rdi                     ; increment haystack pointer
    jmp search                  ; keep searching needle in haystack

end:
    ret                         ; leave function