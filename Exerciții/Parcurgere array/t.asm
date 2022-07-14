.data
    v: .long 10, 20, 30, 40, 50
    n: .long 5
.text

.global main

main:
    movl $0, %ecx
    movl $v, %edi
    
et_for:
    cmp n, %ecx
    je et_exit

    mov (%edi, %ecx, 4), %ebx

    incl %ecx
    jmp et_for

et_exit:
    mov $1, %eax
    mov $0, %ebx
    int $0x80
    
