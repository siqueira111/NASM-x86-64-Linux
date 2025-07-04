bits 64
default rel

section .data
    a_msg: db 'Function A!!', 0x0A
    a_len equ $ - a_msg
    b_msg: db 'Function B!!', 0x0A
    b_len equ $ - b_msg

section .bss
    func_pointer: resb 16
    entry: resb 1

section .text

global _start
extern _start


_start:
    mov QWORD [func_pointer], funcA
    mov QWORD [func_pointer + 8], funcB

    mov rax, 0
    mov rdi, 1
    mov rsi, entry
    mov rdx, 1
    syscall
    mov al, 8
    mov bl, [entry]
    sub bl, 0x30
    mul bx

    call [func_pointer + rax]

    mov rax, 60
    xor rdi, rdi
    syscall


funcA:
    push rbp
    mov rbp, rsp
    
    mov rax, 1
    mov rdi, 1
    mov rsi, a_msg
    mov rdx, a_len
    syscall

    pop rbp
    ret

funcB:
    push rbp
    mov rbp, rsp

    mov rax, 1
    mov rdi, 1
    mov rsi, b_msg
    mov rdx, b_len
    syscall

    pop rbp
    ret