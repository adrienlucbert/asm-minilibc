bits	64
global	memmove         ; export memmove symbol for linker

; void *memmove(void *dest, const void *src, size_t n)
; dest = rdi
; src = rsi
; n = rdx
; ret = rax

section	.text

memmove:
    mov rax, rdi        ; set dest as return value
    push rcx            ; save rcx
    push r8             ; save r8
    xor rcx, rcx        ; set counter to 0

save:
    cmp rcx, rdx        ; if counter >= n
    jge copy            ; start copying src into dest
    mov r8b, byte [rsi] ; move char from src to r8b
    push r8             ; save byte from src to stack
    inc rsi             ; increment src pointer
    inc rdi             ; increment dest pointer
    inc rcx             ; increment counter
    jmp save            ; keep saving src

copy:
    cmp rcx, 0          ; if counter <= 0
    jle end             ; return
    dec rdi             ; decrement dest pointer
    pop r8              ; restore src char from stack
    mov byte [rdi], r8b ; copy dest src char to dest
    dec rcx             ; decrement counter
    jmp copy            ; keep copying

end:
    pop r8              ; restore r8
    pop rcx             ; restore rcx
    ret                 ; leave function