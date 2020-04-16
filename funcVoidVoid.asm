        global  main
        extern  printf

        section .text
funcNothing :
        push    rbp
        mov     rbp, rsp

        mov     rdi, SPafter
        mov     rsi, rsp
        xor     rax, rax
        call    printf

        mov     rdi, Datformat
        mov     rsi, [rbp]
        xor     rax, rax
        call    printf

        mov     rdi, Datformat
        mov     rsi, [rbp-8]
        xor     rax, rax
        call    printf

        pop     rbp
        ret
main:
        push    rbp
        mov     rbp, rsp
        
        mov     rdi, BPbefore                           ; printf
        mov     rsi, rsp
        xor     rax, rax
        call    printf

        sub     rsp, 2
        mov     rdi, SPbefore
        mov     rsi, rsp
        xor     rax, rax
        call    printf

        call funcNothing
        add     rsp, 2

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