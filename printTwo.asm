        global  main
        extern  printf

        section .text
main:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 4

        mov     WORD [rbp-2], 10
        mov     WORD [rbp-4], 12

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

Datformat:
        db      "The data = %ld", 10, 0