.data
    x: .long 30
    y: .long -7
    suma: .space 4
    diferenta: .space 4
    produs: .space 4
    cat: .space 4
    rest:.space 4

.text

.global main

main:
    movl x, %eax
    add y, %eax
    movl %eax, suma

    movl x, %eax
    sub y, %eax
    movl %eax, diferenta

    movl x, %eax
    mull y
    movl %eax, produs

    movl $0, %edx
    movl x, %eax
    movl y, %ebx
    idivl %ebx
    movl %eax, cat
    movl %edx, rest

et_exit:
    mov $1, %eax
    mov $0, %ebx
    int $0x80
