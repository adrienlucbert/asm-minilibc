bits	64
global	memset              ; export memset symbol for linker

section	.text

memset:
	xor rcx, rcx            ; set rcx (8 bytes counter) at 0
    cmp rdi, 0              ; compare string to NULL
    je end                  ; if it is NULL, return NULL
    cmp rcx, rdx            ; compare counter to max index (n)
    jge end                 ; stop if counter is greater than or equal to max index

fill:
    mov [rdi + rcx], sil    ; set value of char from string at index rcx
    inc rcx                 ; increment counter
    cmp rcx, rdx            ; compare counter to max index (n)
    jl fill                 ; if counter < n, keep filling memory area

end:
    mov rax, rdi            ; set return value to string
    ret                     ; leave function