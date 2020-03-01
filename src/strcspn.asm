bits	64
global	strcspn                 ; export strcspn symbol for linker
extern strchr                   ; import strchr symbol

; size_t strcspn(const char *s, const char *reject)
; s = r8
; reject = r9
; ret = rax

section	.text

strcspn:
    push r8                     ; save r8
    push r9                     ; save r9
    push rcx                    ; save rcx
    mov r8, rdi                 ; save s in r8
    mov r9, rsi                 ; save reject in r9
    xor rcx, rcx                ; set counter to 0

search:
    cmp byte [r8 + rcx], 0      ; if rdi[rcx] == 0
    je end                      ; return rcx
    mov rdi, r9                 ; set reject as argument s for strchr
    mov sil, byte [r8 + rcx]    ; set s[rcx] as argument c for strchr
    call strchr wrt ..plt       ; call strchr(reject, s[rcx])
    cmp rax, 0                  ; if s[rcx] != 0
    jne end                     ; return rcx
    inc rcx                     ; increment rcx
    jmp search                  ; keep searching

end:
    mov rax, rcx                ; set rcx as return value
    pop rcx                     ; restore rcx
    pop r9                      ; restore r9
    pop r8                      ; restore r8
    ret