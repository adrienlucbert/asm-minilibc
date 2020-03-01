bits	64
global	strlen              ; export strlen symbol for linker

; size_t strlen(const char *s)
; s = rdi

section	.text

strlen:
    push rcx                ; save rcx
	xor rcx, rcx            ; set counter to 0

count:
    cmp byte [rdi + rcx], 0 ; compare character of s at index rcx to \0
    je end                  ; if \0, return rcx value
    inc rcx                 ; increment length counter
    jmp count               ; keep counting characters

end:
    mov rax, rcx            ; set return value to counter value
    pop rcx                 ; restore rcx
    ret                     ; leave function