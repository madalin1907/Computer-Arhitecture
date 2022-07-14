.data
    x: .space 8    
    k: .long 0
    formatScanf: .asciz "%d"
    formatPrintf: .asciz "%d\n"
.text

.global main

f:
    pushl %ebp
    movl %esp, %ebp
    movl 8(%ebp), %eax

    cmp $1, %eax
    je fexit

    incl k

    xorl %edx, %edx
    movl $2, %ecx
    divl %ecx

    cmp $0, %edx
    je xpar

    jmp ximpar

xpar:
    pushl %eax
    call f
    popl %edx
    jmp fexit

ximpar:
    movl 8(%ebp), %eax
    movl $3, %ecx
    mull %ecx
    incl %eax

    pushl %eax
    call f
    popl %edx
    jmp fexit

fexit:
    popl %ebp
    ret



main:
    pushl $x
    pushl $formatScanf
    call scanf
    popl %ebx
    popl %ebx

    pushl x
    call f
    popl %ebx

    pushl k
    pushl $formatPrintf
    call printf
    popl %ebx
    popl %ebx

et_exit:
    movl $1, %eax
    xorl %ebx, %ebx
    int $0x80
