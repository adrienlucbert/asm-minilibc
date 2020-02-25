bits	64
global	strchr              ; export strchr symbol for linker

section	.text

strchr:
	xor rcx, rcx            ; set rcx (8 bytes counter) at 0
    mov rax, 0              ; set default return value to NULL
    cmp rdi, 0              ; compare string to NULL
    je null                 ; if NULL, return NULL
    jmp search              ; otherwise, search for the needle

search:
    cmp [rdi + rcx], sil    ; compare char from string at index rcx to needle
    je nonnull              ; if it matches, return the address of the needle
    cmp byte [rdi + rcx], 0 ; compare character of string at index rcx to \0
    je null                 ; if not \0, continue looping throught string
    inc rcx                 ; increment length counter
    jmp search              ; keep searching for the needle

nonnull:
    mov rax, rdi            ; set return value to begin of string
    add rax, rcx            ; shift return value by rcx (needle position)
    ret                     ; leave function

null:
    mov rax, 0              ; set return value to NULL
    ret                     ; leave function