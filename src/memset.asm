bits	64
global	memset                  ; export memset symbol for linker

; void *memset(void *s, int c, size_t n)
; s = rdi
; c = sil
; n = rdx
; ret = rax

section	.text

memset:
	xor rcx, rcx                ; set counter to 0
    cmp rdi, 0                  ; compare s to NULL
    je end                      ; if it is NULL, return NULL
    cmp rcx, rdx                ; compare counter to n
    jge end                     ; stop if counter is greater than or equal to n

fill:
    mov byte [rdi + rcx], sil   ; set value of char from s at index rcx to c
    inc rcx                     ; increment counter
    cmp rcx, rdx                ; compare counter to n
    jl fill                     ; if counter < n, keep filling s

end:
    mov rax, rdi                ; set return value to s
    ret                         ; leave function