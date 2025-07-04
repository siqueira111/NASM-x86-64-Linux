bits 64
default rel

section .data
    msg0: db 'Memory block allocated', 0x0A
    msg0_len equ $ - msg0

section .text

global _start

_start:
    mov rax, 12
    xor rsi, rsi
    syscall
    mov rbx, rax
    add rbx, 16384
    mov rsi, rbx
    mov rax, 12
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, msg0
    mov rdx, msg0_len
    syscall

    mov rax, 60
    xor rsi, rsi
    syscall
