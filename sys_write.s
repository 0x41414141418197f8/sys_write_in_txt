BITS 64

global _main

section .rodata

	path db 'NSA.txt', 0
	write_file db "jsuis nsa", 0
	write_file_len equ $-write_file
	existepas db "Le fichier n'existe pas.", 0
	existepas_len equ $-existepas
	existe db "c bon.", 0
	existe_len equ $-existe
	
section .text

_main:
	mov rax, 2
	mov rdi, path
	mov rsi, 02
	mov rdx, 777
	syscall
	push rax
	cmp rax, 3
	je _writing
	jmp _file_pas_found

_writing:
	mov rax, 1
	pop rsi
	mov rdi,rsi
	mov rsi, write_file
	mov rdx, write_file_len
	syscall
	jmp _good

_good:
	mov rax, 1
	mov rdi, 1
	mov rsi, existe
	mov rdx, existe_len
	syscall
	jmp _exit

_file_pas_found:
	mov rax, 1
	mov rdi, 1
	mov rsi, existepas
	mov rdx, existpas_len
	syscall
	jmp _exit

_exit:
	mov rax, 0x3C
	mov rdi, 0
	syscall
