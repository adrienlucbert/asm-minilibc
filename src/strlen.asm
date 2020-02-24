bits	64
global	strlen              ; export strlen symbol for linker

section	.text

strlen:
	xor rcx, rcx            ; set rcx (8 bytes counter) at 0
    cmp rdi, 0              ; compare string passed as parameter to NULL
    jne count               ; if not NULL, start counter loop
    jmp end                 ; else, return 0

count:
    inc rcx                 ; increment length counter
    cmp byte [rdi + rcx], 0 ; compare character of string at index rcx to \0
    jne count               ; if not \0, continue looping throught string

end:
    mov rax, rcx            ; set return value to counter value
    ret                     ; leave function