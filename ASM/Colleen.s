section .data
    msg db "Hello World", 10
    msg_len equ $ - msg

section .text
    global _main

_main:
    ; write syscall
    mov rax, 0x2000004      ; sys_write
    mov rdi, 1              ; stdout
    mov rsi, msg            ; message
    mov rdx, msg_len        ; message length
    syscall

    ; exit syscall
    mov rax, 0x2000001      ; sys_exit
    mov rdi, 0              ; exit status
    syscall