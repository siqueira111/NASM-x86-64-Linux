bits 64
default rel

section .text

sys_exit:
    mov rax, 60
    syscall
