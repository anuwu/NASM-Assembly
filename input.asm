; Based on Hasan Naqvi's snippet

section .data 
	 inputInt: db "%d", 0  
	 outputInt: db "Output: %d", 10, 0
	 inputPrompt : db "Enter an integer : " , 0
 
section .text 
	 global main 
	 extern scanf 
	 extern printf 
 
main: 
	 mov rbp, rsp 
		
	 sub rsp, 6	
	 mov WORD [rbp-2], 10
	 mov WORD [rbp-4], 5
	 mov WORD [rbp-6], 0


	 mov rdi, inputPrompt
	 xor rax, rax
	 mov rsi, rax
	 call printf
	 xor rax, rax


	 ;--------------------------
	 mov rdi, inputInt 
	 ;--------------------------
	 sub rsp, 10
	 mov rsi, rsp
	 sub rsi, 4
	 ;--------------------------
	 push rsi
	 call scanf 
	 pop rsi
	 ;--------------------------
	 mov ax, WORD[rsp-4]
	 mov [rbp-6], ax
	 add rsp, 10
	 ;--------------------------


	 mov ax, [rbp-6]
	 mov bx, [rbp-4]
	 add ax, bx
	 mov rdi, outputInt
	 movsx rsi, ax
	 xor rax, rax
	 call printf
	 xor rax, rax
	 
	 add rsp, 6
	 ret