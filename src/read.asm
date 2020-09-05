bits	64
global	read            ; export read symbol for linker

; ssize_t read(int fd, void *buf, size_t count)
; fd = rdi
; buf = rsi
; count = rdx
; ret = rax

section	.text

read:
    mov rax, 0          ; use the read syscall
    syscall             ; make syscall
    ret                 ; leave function