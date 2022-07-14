.data
    n: .long 5
    s: .space 4
.text

.global main

main:
    movl $0, %ecx
et_for:
    cmp %ecx, n
    je et_exit

    incl %ecx
    movl s, %eax
    add %ecx, %eax
    movl %eax, s
    jmp et_for

et_exit:
    mov $1, %eax
    mov $0, %ebx
    int $0x80
    
