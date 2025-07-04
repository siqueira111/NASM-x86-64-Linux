bits 64
default rel

section .data
    new_line: db 0x0A
    is_palindrome: db 'is a palindrome!', 0x0A, 0x00
    not_is_palindrome: db 'is not a palindrome!', 0x0A, 0x00

    string_table: dq not_is_palindrome, is_palindrome

section .bss
    string_buffer: resb 255

section .text
global _start

_start:
    mov rdi, string_buffer
    call scan

    mov rdi, string_buffer
    call check_palindrome

    mov rdi, [string_table + rax * 8]
    call print

    call sys_exit


sys_exit:
    mov rax, 60
    xor rdi, rdi
    syscall


check_palindrome:
    push rbp
    mov rbp, rsp
    mov r8, rdi

    call strlen

    lea r9, [r8 + rax - 2]

check_palindrome_inner_loop:
    cmp r9, r8
    jle check_palindrome_end_a

    mov bl, [r9]
    mov dl, [r8]

    dec r9
    inc r8
    cmp bl, dl
    jne check_palindrome_end_b
    jmp check_palindrome_inner_loop

check_palindrome_end_a:
    mov rax, 1
    jmp check_palindrome_end

check_palindrome_end_b:
    mov rax, 0

check_palindrome_end:
    pop rbp
    ret


scan:
    push rbp
    mov rbp, rsp
    
    mov rax, 0
    mov rsi, rdi
    mov rdi, 0
    mov rdx, 255
    syscall

scan_end:
    pop rbp
    ret


print:
    push rbp
    mov rbp, rsp

    mov r8, rdi

    call strlen
    mov r10, rax

    mov rax, 1
    mov rdi, 1
    mov rsi, r8
    mov rdx, r10
    syscall

print_end:
    pop rbp
    ret


strlen:
    push rbp
    mov rbp, rsp

    mov rax, rdi
strlen_loop:
    cmp byte [rdi], 0
    je strlen_end
    inc rdi
    jmp strlen_loop
strlen_end:
    sub rdi, rax
    mov rax, rdi

    pop rbp
    ret
