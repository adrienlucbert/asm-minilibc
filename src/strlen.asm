bits	64
global	strlen              ; export strlen symbol for linker

; size_t strlen(const char *s)
; s = rdi

section	.text

strlen:
	xor rcx, rcx            ; set rcx (8 bytes counter) at 0

count:
    cmp byte [rdi + rcx], 0 ; compare character of s at index rcx to \0
    je end                  ; if \0, return rcx value
    inc rcx                 ; increment length counter
    jmp count               ; keep counting characters

end:
    mov rax, rcx            ; set return value to counter value
    ret                     ; leave function