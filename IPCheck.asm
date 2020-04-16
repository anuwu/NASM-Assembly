; -----------------------------------------------------------------------------
; A 64-bit Linux application that writes the first 90 Fibonacci numbers. To
; assemble and run:
;
;     nasm -felf64 fib.asm && gcc fib.o && ./a.out
; -----------------------------------------------------------------------------

        global  main
        extern  printf

        section .text
main:
        mov     rdi, IPformat                   ; printf
        mov     rsi, rsp
        xor     rax, rax
        call    printf

        push    rax                             ; pushing one value onto stack

        mov     rdi, IPformat                   ; printf
        mov     rsi, rsp
        xor     rax, rax
        call    printf

        pop     rax                             ; popping one value from the stack
        
        mov     rdi, BPformat
        mov     rsi, rbp
        xor     rax, rax
        call    printf



        ret
IPformat:
        db      "The current IP = %ld", 10, 0
BPformat:
        db      "The current BP = %ld", 10, 0