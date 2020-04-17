; Based on Hasan Naqvi's snippet

section .data 
         inputInt: db "%d", 0  
         outputInt: db "Output: %d", 10, 0
         inputPrompt : db "Enter an integer : " , 0
 
section .text 
         global main 
         extern scanf 
         extern printf
         extern malloc
         extern free

main :
        push rbp
        push rbp
        mov rbp, rsp

        sub rsp,8
        mov rdi, 10
        call malloc
        mov [rbp-8], rax

        mov rax, [rbp-8]
        mov WORD [rax], 0
        mov WORD [rax+2], 1
        mov WORD [rax+4], 2
        mov WORD [rax+6], 3
        mov WORD [rax+8], 4 

        mov ax, [rax+4]
        mov rdi, outputInt
        movsx rsi, ax
        xor rax, rax
        call printf

        mov rax, [rbp-8]
        mov rdi, rax
        call free

        mov rsp, rbp
        pop rbp
        pop rbp
        ret