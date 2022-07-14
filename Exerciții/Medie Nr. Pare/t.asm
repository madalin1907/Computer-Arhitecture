.data
    v: .long 1, 2, 3, 4, 5, 4
    n: .long 6
    s: .long 0
    r: .long 0
    media: .space 4
    d: .long 2
.text

.global main

main:
    movl $v, %edi
    movl $0, %ecx

et_for:
    cmp n, %ecx
	je et_ma
    
    movl $0, %edx
    movl (%edi, %ecx, 4), %eax
    divl d
    cmp $0, %edx
    je et_suma

    incl %ecx
	jmp et_for

et_suma:
    mull d
    movl s, %ebx
    add %eax, %ebx
    movl %ebx, s
    movl r, %ebx
    incl %ebx
    movl %ebx, r
    incl %ecx
    jmp et_for

et_ma:
    movl $0, %edx
    movl s, %eax
    divl r
    jmp et_exit

et_exit:
    movl $1, %eax
    movl $0, %ebx
    int $0x80
