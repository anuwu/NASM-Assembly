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

	mov rdi, outputInt
	mov rsi, rsp
	xor rax, rax
	call printf

	mov rax, rsp
	and rax, 15				; mod 16 of rsp

	mov rdi, outputInt
	mov rsi, rax
	xor rax, rax
	call printf

	mov rsp, rbp
	ret