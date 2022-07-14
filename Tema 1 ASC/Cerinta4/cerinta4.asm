.data
    minus1: .long -1
    semnOperand: .long 0
    indexAfis: .long 0
    operand: .long 0
    sir_input: .space 1700
    rez: .space 8
    nrlinii: .space 4
    nrcoloane: .space 4
    nrelemente: .space 4
    indexColoane: .space 4
    indexLinii: .space 4
    M: .space 1600
    delimitator: .asciz " "
    newline: .asciz "\n"
    formatPrintf: .asciz "%d "

.text

.global main

main:
    pushl $sir_input
    call gets
    popl %ebx
    
    pushl $delimitator
    pushl $sir_input
    call strtok
    popl %ebx
    popl %ebx


    pushl $delimitator
	pushl $0
	call strtok
	popl %ebx
	popl %ebx

    movl %eax, rez
    pushl rez
    call atoi
    popl %ebx
    movl %eax, nrlinii


    pushl $delimitator
	pushl $0
	call strtok
	popl %ebx
	popl %ebx

    movl %eax, rez
    pushl rez
    call atoi
    popl %ebx
    movl %eax, nrcoloane

    mull nrlinii
    movl %eax, nrelemente
    xorl %ecx, %ecx

for_elemente:
    cmp %ecx, nrelemente
    je let_si_nume
    pushl %ecx

	pushl $delimitator
	pushl $0
	call strtok
	popl %ebx
	popl %ebx

    movl %eax, rez
    pushl rez
    call atoi
    popl %ebx

    movl $M, %edi
    popl %ecx
    movl %eax, (%edi, %ecx, 4)

    incl %ecx
    jmp for_elemente

let_si_nume:
    pushl $delimitator
	pushl $0
	call strtok
	popl %ebx
	popl %ebx

    pushl $delimitator
	pushl $0
	call strtok
	popl %ebx
	popl %ebx

rot90d_si_operand:
    pushl $delimitator
	pushl $0
	call strtok
	popl %ebx
	popl %ebx

    movl %eax, rez
    pushl rez
    call atoi
    popl %ebx

    cmp $0, %eax
    je et_rot90d

    movl %eax, operand
    
operatie:
    pushl $delimitator
	pushl $0
	call strtok
	popl %ebx
	popl %ebx

    movl %eax, rez
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
    movl $0, %ecx
    movl $M, %edi
for_add:
    cmpl %ecx, nrelemente
    je et_print

    movl (%edi, %ecx, 4), %eax
    addl operand, %eax
    movl %eax, (%edi, %ecx, 4)

    addl $1, %ecx
    jmp for_add

et_sub:
    movl $0, %ecx
    movl $M, %edi
for_sub:
    cmpl %ecx, nrelemente
    je et_print

    movl (%edi, %ecx, 4), %eax
    subl operand, %eax
    movl %eax, (%edi, %ecx, 4)

    addl $1, %ecx
    jmp for_sub

et_mul:
    movl $0, %ecx
    movl $M, %edi
for_mul:
    cmpl %ecx, nrelemente
    je et_print

    movl (%edi, %ecx, 4), %eax
    mull operand
    movl %eax, (%edi, %ecx, 4)

    addl $1, %ecx
    jmp for_mul

et_div:
    movl $0, %ecx
    movl $M, %edi
    cmp $0, operand
    jl operand_negativ
    jmp for_div

operand_negativ:
    movl $1, semnOperand
    movl operand, %eax
    mull minus1
    movl %eax, operand
    jmp for_div

for_div:
    cmpl %ecx, nrelemente
    je et_print

    movl (%edi, %ecx, 4), %eax
    cmp $0, %eax
    jl element_negativ
    jmp element_pozitiv

element_negativ:
    mull minus1
    movl $0, %edx
    divl operand

    cmp $0, semnOperand
    je cat_negativ
    jmp cat_pozitiv

element_pozitiv:
    movl $0, %edx
    divl operand

    cmp $1, semnOperand
    je cat_negativ
    jmp cat_pozitiv

cat_negativ:
    mull minus1
    movl %eax, (%edi, %ecx, 4)
    addl $1, %ecx
    jmp for_div

cat_pozitiv:
    movl %eax, (%edi, %ecx, 4)
    addl $1, %ecx
    jmp for_div

et_print:
    pushl nrlinii
    pushl $formatPrintf
    call printf
    popl %ebx
    popl %ebx

    pushl nrcoloane
    pushl $formatPrintf
    call printf
    popl %ebx
    popl %ebx

for_print:
    movl indexAfis, %ecx
    cmpl %ecx, nrelemente
    je et_exit

    movl $M, %edi
    movl (%edi, %ecx, 4), %eax

    pushl %eax
    pushl $formatPrintf
    call printf
    popl %ebx
    popl %ebx

    addl $1, indexAfis
    jmp for_print

et_rot90d:
    pushl nrcoloane
    pushl $formatPrintf
    call printf
    popl %ebx
    popl %ebx

    pushl nrlinii
    pushl $formatPrintf
    call printf
    popl %ebx
    popl %ebx

    movl $0, indexColoane
    for_c:
        movl indexColoane, %ecx
        cmp %ecx, nrcoloane
        je et_exit

        movl nrlinii, %eax
        subl $1, %eax
        movl %eax, indexLinii
        
        for_l:
            movl indexLinii, %ecx
            movl minus1, %ebx
            cmp %ebx, %ecx
            je continuare

            movl indexLinii, %eax
            movl $0, %edx
            mull nrcoloane
            addl indexColoane, %eax

            movl $M, %edi
            movl (%edi, %eax, 4), %ebx
            pushl %ebx
            pushl $formatPrintf
            call printf
            popl %ebx
            popl %ebx

            movl indexLinii, %eax
            subl $1, %eax
            movl %eax, indexLinii
            jmp for_l
    continuare:
        incl indexColoane
        jmp for_c

et_exit:
    pushl $0
    call fflush
    popl %ebx

    movl $4, %eax
    movl $1, %ebx
    movl $newline, %ecx
    movl $2, %edx
    int $0x80

    mov $1, %eax
    xor %ebx, %ebx
    int $0x80
