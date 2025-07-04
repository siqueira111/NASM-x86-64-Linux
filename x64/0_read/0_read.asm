bits 64
default rel


section .data
    hello db "Hello, World!", 0xA, 0x00
    hello_len equ $ - hello

section .bss
    entry resb 255

section .text

global _start
extern _start

_start:
    ; calls sys_read
    mov rax, 0
    mov rdi, 1
    mov rsi, entry
    mov rdx, 255
    syscall

    ; calls strlen
    mov rdi, entry
    call strlen
    mov rdx, rax

    ; calls sys_write
    mov rax, 1
    mov rdi, 1
    mov rsi, entry,
    syscall

    ; calls sys_exit
    mov rax, 60
    xor rdi, rdi
    syscall

; gets the string length
strlen:
    push rbp
    mov rbp, rsp
    xor rax, rax
    xor rcx, rcx

; while(*(str++) > 0);
inner_loop:
    inc rcx
    mov rbx, [rdi + rcx]
    cmp rbx, 0
    jg inner_loop
    
; return str_len
    mov rax, rcx
    pop rbp
    ret