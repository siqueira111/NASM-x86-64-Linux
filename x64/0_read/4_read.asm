bits 64
default rel

section .bss
    entry_asm: resb 255

section .data
    hello_asm: db 'Hello, Assembly!', 0x0A

section .text

%include '../headers/strings.asm'
%include '../headers/os.asm'

global _start

_start:
    mov rdi, entry_asm
    mov rsi, 255
    call read

    mov rdi, hello_asm
    call write

    xor rdi, rdi
    call sys_exit


