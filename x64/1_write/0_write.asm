; alias asm_compile="nasm -felf64 $1 && ld -o $1 $1.o"
bits 64
default rel


section .data
    hello db "Hello, World!", 0xA, 0x00
    hello_len equ $ - hello


section .text

global _start
extern _start

_start:
    mov rax, 1
    mov rdi, 1
    mov rsi, hello
    mov rdx, hello_len
    syscall

    mov rax, 60
    xor rdi, rdi
    syscall
