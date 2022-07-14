.data
    x: .space 4
    par: .asciz "%d este par \n"
    impar: .asciz "%d este impar \n"
    formatScanf: .asciz "%d"
    
.text

.global main

este_par:
    pushl %ebp
    movl %esp, %ebp
    
    pushl %ebx
    
    movl 8(%ebp), %eax
    xorl %edx, %edx
    movl $2, %ebx
    divl %ebx
    movl %edx, %eax

    popl %ebx
    popl %ebp
    ret

main:
    pushl $x 
    pushl $formatScanf
    call scanf
    popl %ebx
    popl %ebx

    pushl x
    call este_par
    popl %ebx

    cmpl $1, %eax
    je et_impar

    jmp et_par

et_impar:
    pushl x
    pushl $impar
    call printf
    popl %ebx
    popl %ebx
    jmp et_exit

et_par:
    pushl x
    pushl $par
    call printf
    popl %ebx
    popl %ebx

et_exit:
    movl $1, %eax
    xorl %ebx, %ebx
    int $0x80
