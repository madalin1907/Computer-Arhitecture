.data
    sir: .space 100
    rez: .space 100
    delimitator: .asciz " "
    formatPrintf: .asciz "%d\n"

.text

.global main

main:
    pushl $sir
    call gets
    popl %ebx

    pushl $delimitator
    pushl $sir
    call strtok
    popl %ebx
    popl %ebx

    movl %eax, rez
    pushl rez
    call atoi
    popl %ebx

    pushl %eax

et_for:
	pushl $delimitator
	pushl $0
	call strtok
	popl %ebx
	popl %ebx 
	
	cmp $0, %eax
	je et_print
    
    movl %eax, rez
    pushl rez
    call atoi
    popl %ebx
	
    cmp $0, %eax
    je et_operatie
    
    pushl %eax
    jmp et_for

et_operatie:
    movl rez, %edi
    xorl %ecx, %ecx
    movb (%edi, %ecx, 1), %al
    cmp $97, %al
    je et_add
    cmp $115, %al
    je et_sub
    cmp $109, %al
    je et_mul
    cmp $100, %al
    je et_div

et_add:
    popl %ebx
    popl %eax
    addl %ebx, %eax
    pushl %eax
    jmp et_for

et_sub:
    popl %ebx
    popl %eax
    subl %ebx, %eax
    pushl %eax
    jmp et_for

et_mul:
    popl %ebx
    popl %eax
    mull %ebx
    pushl %eax
    jmp et_for

et_div:
    movl $0, %edx
    popl %ebx
    popl %eax
    divl %ebx
    pushl %eax
    jmp et_for

et_print:
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx

et_exit:
    mov $1, %eax
    xor %ebx, %ebx
    int $0x80
