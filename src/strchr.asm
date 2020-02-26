bits	64
global	strchr              ; export strchr symbol for linker

; char *strchr(const char *s, int c)
; s = rdi
; c = sil
; ret = rax

section	.text

strchr:
	xor rcx, rcx            ; set counter to 0
    xor rax, rax            ; set default return value to NULL (0)
    cmp rdi, 0              ; compare s to NULL
    je null                 ; if NULL, return NULL

search:
    cmp [rdi + rcx], sil    ; compare char from s at index rcx to c
    je nonnull              ; if it matches, return the address of the needle
    cmp byte [rdi + rcx], 0 ; compare character of s at index rcx to \0
    je null                 ; if not \0, continue looping throught s
    inc rcx                 ; increment counter
    jmp search              ; keep searching for c

nonnull:
    mov rax, rdi            ; set return value to begin of string
    add rax, rcx            ; shift return value by rcx (needle position)
    ret                     ; leave function

null:
    xor rax, rax            ; set return value to NULL (0)
    ret                     ; leave function