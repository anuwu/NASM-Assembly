SECTION .data
    msg db "The OUTPUT is:  " 
    len equ $- msg
 	
    msgi db "INPUT: ENTER AN INTEGER VALUE:" 
    leni equ $- msgi
    
    msgt db "true  " 
    lent equ $- msgt
    
    msgf db "false  " 
    lenf equ $- msgf	
     
    msgerror db "run-time error detected"
    lenerror equ $- msgerror		


SECTION .bss
	lpBuffer: resb 18
	Buf_Len: equ $-lpBuffer

SECTION .text
	global _start

_start:
	mov eax, 10
	call printInt

	mov eax,1            ; The system call for exit (sys_exit)
	mov ebx,0            ; Exit with return code of 0 (no error)
	int 80h;

printStr:
    push    eax
    push    ebx
    mov     ebx, 1
    mov     eax, 4
    int     80H
    pop     ebx
    pop     eax
    ret


.non_neg:
    mov edx,0
    idiv ecx
    add dl,0x30
    mov [esi],dl
    dec esi
    cmp eax,0
    jnz .non_neg
    mov edx, lpBuffer
    add edx, Buf_Len
    mov ecx,esi
    sub edx,ecx
    inc ecx
    call printStr
    push 10
    mov ecx,esp
    mov edx,1
    call printStr
    add esp, 4
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop eax
    ret

printInt:
    push eax
    push ebx
    push ecx
    push edx
    push esi
    mov esi, lpBuffer
    add esi, Buf_Len
    mov ecx,10
    mov edx, eax 
    cmp eax,0
    ;jge .non_neg
    mov eax,0
    sub eax,edx
    push '-'
    mov ecx,esp
    mov edx,1
    call printStr
    add esp, 4
    mov ecx,10





