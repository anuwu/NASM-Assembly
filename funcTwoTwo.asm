        global  main
        extern  printf

        section .text
subProc :
        push    rbp
        mov     rbp, rsp

        mov     ax, WORD [rbp+16]
        mov     bx, WORD [rbp+18]
        sub     ax, bx
        mov     [rbp-2], ax

        mov     ax, WORD [rbp+16]
        mov     bx, WORD [rbp+18]
        add     ax, bx
        mov     [rbp-4], ax

        pop     rbp
        ret
main:
        push    rbp
        mov     rbp, rsp

        mov     WORD [rbp-2], 100
        mov     WORD [rbp-4], 5
        sub     rsp, 4

        mov     ax, WORD [rbp-4]
        push    ax
        mov     ax, WORD [rbp-2]
        push    ax
        ;-----------------------------------
        call    subProc
        ;-----------------------------------
        mov     ax, WORD [rsp-18]
        mov     WORD [rbp-2], ax
        mov     ax, WORD [rsp-20]
        mov     WORD [rbp-4], ax
        add     rsp, 4

        mov     ax, WORD[rbp-2]
        mov     rdi, Datformat
        movsx   rsi, ax
        xor     rax, rax
        call    printf

        mov     ax, WORD[rbp-4]
        mov     rdi, Datformat
        movsx   rsi, ax
        xor     rax, rax
        call    printf

        add     rsp, 4
        pop     rbp
        ret

BPbefore:
        db      "The BP before call = %ld", 10, 0
Datformat:
        db      "The data = %ld", 10, 0
IPformat:
        db      "The current IP = %lx", 10, 0
SPbefore :
        db      "The SP right before call = %ld", 10, 0
SPafter:
        db      "The SP right after call = %ld", 10, 0