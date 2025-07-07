bits 64
default rel

section .text

; prints contents of rdi
write:
    push rbp
    mov rbp, rsp

    mov r8, rdi
    call strlen
    mov r9, rax

    mov rax, 1
    mov rdi, 1
    mov rsi, r8
    mov rdx, r9
    syscall

    pop rbp
    ret

; reads and stores into rdi, returns count of bytes read
read:
    push rbp
    mov rbp, rsp

    mov r8, rdi
    mov r9, rsi

    mov rax, 0
    mov rdi, 0
    mov rsi, r8
    mov rdx, r9
    syscall

    pop rbp
    ret

; calculates the length of a string given on rdi
strlen:
    push rbp
    mov rbp, rsp

    mov rax, rdi
    .strlen_loop:
        cmp BYTE [rax], 0
        je .strlen_end
        inc rax
        jg .strlen_loop

    .strlen_end:
        sub rax, rdi

        pop rbp
        ret

