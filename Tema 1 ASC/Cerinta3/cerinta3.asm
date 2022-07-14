.data
    sir: .space 100
    rez: .space 100
    v: .space 120
    codlitera: .space 4
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
    
    cmp $0, %eax
    je variabila1

    pushl %eax
    jmp et_for

variabila1:
    movl rez, %edi
    xorl %ecx, %ecx
    movb (%edi, %ecx, 1), %al
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
    je varsauop
    
    pushl %eax
    jmp et_for

varsauop:
    movl rez, %edi
    movl $1, %ecx
    movb (%edi, %ecx, 1), %al
    cmp $0, %al
    je variabila

    xorl %ecx, %ecx
    movb (%edi, %ecx, 1), %al
    cmp $108, %al
    je et_let
    cmp $97, %al
    je et_add
    cmp $115, %al
    je et_sub
    cmp $109, %al
    je et_mul
    cmp $100, %al
    je et_div

variabila:
    xorl %ecx, %ecx
    movb (%edi, %ecx, 1), %al
    movl %eax, codlitera
    subl $97, %eax

    movl $v, %esi
    movl (%esi, %eax, 4), %ebx
    cmp $0, %ebx
    jne inloc_litera_cu_nr

    pushl codlitera
    jmp et_for

inloc_litera_cu_nr:
    pushl %ebx
    jmp et_for

et_let:
    popl %eax
    popl %ecx
    sub $97, %ecx
    movl $v, %esi
    movl %eax, (%esi, %ecx, 4)
    jmp et_for

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

exit:
    mov $1, %eax
    xor %ebx, %ebx
    int $0x80
