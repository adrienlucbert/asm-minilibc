bits	64
global	write           ; export write symbol for linker

; ssize_t write(int fd, const void *buf, size_t count)
; fd = rdi
; buf = rsi
; count = rdx
; ret = rax

section	.text

write:
    mov rax, 1          ; use the write syscall
    syscall             ; make syscall
    ret                 ; leave function