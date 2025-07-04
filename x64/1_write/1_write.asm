bits 64
default rel

section .data
    msg db 'you need to pass one argument!', 0x0A
    msg_len equ $ - msg

section .text

global _start
extern _start

_start:
    pop rcx
    pop rbx
    mov r10, rbx
    cmp rcx, 2
    jnz print_exit

    mov rdi, rbx
    call strlen
    mov rcx, rax
    
    mov rax, 1
    mov rdi, 1
    mov rsi, r10
    mov rdx, rcx
    syscall
    
    jmp sys_exit

print_exit:
    mov rax, 1
    mov rdi, 1
    mov rsi, msg
    mov rdx, msg_len
    syscall

sys_exit:
    mov rax, 60
    xor rdi, rdi
    syscall

strlen:
    push rbp
    mov rbp, rsp
    xor rax, rax

strlen_inner_loop:
    inc rax
    mov bl, [rdi + rax]
    cmp bl, 0
    jg strlen_inner_loop

    pop rbp
    ret
