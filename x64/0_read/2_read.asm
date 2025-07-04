bits 64
default rel


section .data
    msg_true: db 'eh um palindromo', 0x0A
    msg_true_len equ $ - msg_true

    msg_false: db 'nao eh um palindromo', 0x0A
    msg_false_len equ $ - msg_false

section .bss
    entry_buffer: resb 255

section .text

extern _start

_start:

    mov rsi, msg_false
    call strlen


    mov rax, 60
    xor rsi, rsi
    syscall

print:
    push rbp
    mov rbp, rsp
    mov r10, rsi

    pop rbp
    ret

scan:
    push rbp
    mov rbp, rsp

    pop rbp
    ret


strlen:
    push rbp
    mov rbp, rsp
    push rsi

strlen_loop:
    inc rsi
    cmp byte [rsi], 0
    jnz strlen_loop
    dec rsi

    pop rax
    sub rsi, rax
    mov rax, rsi

    pop rbp
    ret