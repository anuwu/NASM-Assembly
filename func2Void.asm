        global  main
        extern  printf

        section .text
subProc :
        push    rbp
        mov     rbp, rsp

        mov     ax, WORD [rbp+16]
        mov     bx, WORD [rbp+18]

        movsx   rax, ax
        movsx   rbx, bx
        sub     rax, rbx

        mov     rdi, Datformat                   ; printf
        mov     rsi, rax
        xor     rax, rax
        call    printf

        xor     rax, rax
        pop     rbp
        ret
main:
        push    rbp
        mov     rbp, rsp

        mov     WORD [rbp-2], 15
        mov     WORD [rbp-4], 10

        sub     rsp, 4
        mov     ax, [rbp-4]
        push    ax
        mov     ax, [rbp-2]
        push    ax
        call    subProc
        add     rsp, 8

        pop     rbp
        ret
IPformat:
        db      "The current IP = %lx", 10, 0
SPbefore :
        db      "The SP right before call = %ld", 10, 0
SPafter:
        db      "The SP right after call = %ld", 10, 0
BPbefore:
        db      "The BP before call = %ld", 10, 0
Datformat:
        db      "The data = %ld", 10, 0