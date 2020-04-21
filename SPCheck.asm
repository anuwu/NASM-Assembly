        global  main
        extern  printf

        section .text
main:
        mov     rbp, rsp
        mov     rdi, SPformat                   ; printf
        mov     rsi, rsp
        xor     rax, rax
        call    printf

        push    rax                             ; pushing one value onto eshtack

        mov     rdi, SPformat                   ; printf
        mov     rsi, rsp
        xor     rax, rax
        call    printf

        pop     rax                             ; popping one value from the eshtack

        mov     rdi, SPformat                   ; printf
        mov     rsi, rsp
        xor     rax, rax
        call    printf
        
        mov     bx, 56
        mov     [rbp-2], bx
        mov     ax, [rbp-2]
        movsx   rax, ax

        mov     rdi, Datformat
        mov     rsi, rax
        xor     rax, rax
        call    printf

        ret
SPformat:
        db      "The current SP = %ld", 10, 0
BPformat:
        db      "The current BP = %ld", 10, 0
Datformat:
        db      "The data = %ld", 10, 0