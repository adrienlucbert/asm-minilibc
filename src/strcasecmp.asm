bits	64
global	strcasecmp          ; export strcasecmp symbol for linker
extern tolower              ; import tolower symbol

; int strcasecmp(const char *s1, const char *s2)
; s1 = r8
; s2 = r9
; ret = rax

section	.text  

strcasecmp:
    push r8                 ; save r8
    push r9                 ; save r9
    push r10                ; save r10
    push r11                ; save r11
    push r12                ; save r12
    mov r8, rdi             ; save s1 into r8
    mov r9, rsi             ; save s2 into r9
    xor rdi, rdi            ; set rdi to 0
    xor rsi, rsi            ; set rsi to 0

compare:
    mov dil, byte [r8]      ; set char from s1 as param for tolower function
    call tolower wrt ..plt  ; call tolower
    mov r10b, al            ; move result from tolower to r10b scratch
    mov dil, byte [r9]      ; set char from s2 as param for tolower function
    call tolower wrt ..plt  ; call tolower
    mov r11b, al            ; move result from tolower to r11b scratch
    cmp r10b, r11b          ; compare lower char from s1 to lower char from s2
    jne end                 ; if not equal, return
    cmp byte [r8], byte 0   ; check if end of s1 is not reached
    je end                  ; if it is, return
    cmp byte [r9], byte 0   ; check if end of s2 is not reached
    je end                  ; if it is, return
    inc r8                  ; increment s1 pointer
    inc r9                  ; increment s2 pointer
    jmp compare             ; keep comparing

end:
    xor rax, rax            ; set return value to 0
    xor r12, r12            ; set scratch register r8 to 0
    mov al, byte [r8]       ; set return value to char from s1
    mov r12b, byte [r9]     ; set r8 value to char from s2
    sub rax, r12            ; substract r8 value to rax
    pop r12                 ; restore r12
    pop r11                 ; restore r11
    pop r10                 ; restore r10
    pop r9                  ; restore r9
    pop r8                  ; restore r8
    ret                     ; leave function