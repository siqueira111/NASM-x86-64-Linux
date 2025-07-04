bits 64
default rel

section .bss
    msg: resb 255

section .text

global _start
extern _start

_start:
    pop r12

inner_start_loop:
    pop rdi

    mov r10, rdi
    call strlen
    mov rdx, rax
    mov r11, rdx

    mov rdi, r10
    mov rsi, rax
    call append_newline
    mov rsi, rax
    inc r11

    mov rax, 1
    mov rdi, 1
    mov rsi, msg
    mov rdx, r11
    syscall

    dec r12
    cmp r12, 0
    jne inner_start_loop

sys_exit:
    mov rax, 60
    xor rdi, rdi
    syscall

append_newline:
    push rbp
    mov rbp, rsp

    mov rcx, rsi
    xor rbx, rbx

append_newline_inner_loop:
    mov al, [rdi + rbx]
    mov [msg + rbx], al

    inc rbx
    cmp rbx, rcx
    jl append_newline_inner_loop

    mov BYTE [msg + rbx], 0x0A
    
    mov rax, msg
    pop rbp
    ret


strlen:
    push rbp
    mov rbp, rsp
    xor rax, rax

strlen_inner_loop:
    mov bl, [rdi + rax]
    inc rax
    cmp bl, 0
    jg strlen_inner_loop

    pop rbp
    ret
