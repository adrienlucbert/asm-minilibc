bits	64
global	memcpy                  ; export strchr symbol for linker

; void *memcpy(void *dest, const void *src, size_t n)
; dest = rdi
; src = rsi
; n = rdx

section	.text

memcpy:
    mov rax, rdi                ; set return value to dest
    xor rcx, rcx                ; set counter to 0

cpy:
    cmp rcx, rdx                ; compare counter to n
    je end                      ; if n is reached, return
    mov r8b, byte [rsi + rcx]   ; as x86 can't perform mem to mem copy, copy byte to scratch first
    mov [rdi + rcx], r8b        ; then copy from scratch to dest
    inc rcx                     ; increment counter
    jmp cpy                     ; keep copying

end:
    ret                         ; leave function