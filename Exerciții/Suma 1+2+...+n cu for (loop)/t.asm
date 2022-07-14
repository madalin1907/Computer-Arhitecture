.data
    n: .long 5
    s: .space 4
.text

.global main

main:
    mov n, %ecx

etloop:
    add %ecx, s
    loop etloop

et_exit:
    mov $1, %eax
    mov $0, %ebx
    int $0x80
