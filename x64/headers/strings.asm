bits 64
default rel

section .text

; appends to the left contents of of rdi into rsi
append_left:
    push rbp
    mov rbp, rsp

    pop rbp
    ret

; appends to the right contents of of rdi into rsi
append_right:
    push rbp
    mov rbp, rsp

    pop rbp
    ret
