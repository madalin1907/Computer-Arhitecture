.data
    k: .long 0
    i: .long 0
    j: .long 0

    n: .long 0
    m: .long 0
    nrelemente: .long 0

    rez: .space 8
    contor: .space 130
    v: .space 370
    input: .space 250

    delimitator: .asciz " "
    newline: .asciz "\n"
    formatPrintf: .asciz "%d "
    formatPrintfm: .asciz "%d\n"

.text

.global main

afisare:
    pushl %ebp
    movl %esp, %ebp
    pushl %edi
    pushl %ebx

    movl 8(%ebp), %edi
    xorl %ecx, %ecx

for_afisare:
    cmp %ecx, nrelemente
    je afisare_exit

    movl (%edi, %ecx, 4), %eax
    pushl %ecx

    pushl %eax
    pushl $formatPrintf
    call printf
    popl %edx
    popl %edx

    popl %ecx
    incl %ecx
    jmp for_afisare

afisare_exit:
    pushl $0
    call fflush
    popl %edx

    pushl $newline
    call printf
    popl %edx

    popl %ebx
    popl %edi
    popl %ebp
    ret


backtracking:
    pushl %ebp
    movl %esp, %ebp
    pushl %edi

    movl 8(%ebp), %eax
    movl %eax, k
    cmp %eax, nrelemente
    je solutie

    movl $v, %edi
    movl (%edi, %eax, 4), %ecx

    cmp $0, %ecx
    jne reapel_backtracking

    movl $0, i

for_bkt:
    incl i
    movl i, %ecx
    cmp n, %ecx
    jg exit_back

    movl $contor, %edi
    movl (%edi, %ecx, 4), %edx

    cmp $3, %edx
    je for_bkt
    
    movl $0, j
    movl $v, %edi

verif_distanta:
    incl j
    movl j, %ecx
    cmp m, %ecx
    jg adaugare

if1:
    movl k, %eax
    subl %ecx, %eax
    cmp $0, %eax
    jl if2

verif1:
    movl (%edi, %eax, 4), %edx

    cmp %edx, i
    je for_bkt

if2:
    movl k, %eax
    addl %ecx, %eax
    cmp %eax, nrelemente
    jge verif2

    jmp verif_distanta

verif2:
    movl (%edi, %eax, 4), %edx

    cmp %edx, i
    je for_bkt

    jmp verif_distanta

adaugare:
    movl $contor, %edi
    movl i, %ecx
    add $1, (%edi, %ecx, 4)

    movl $v, %edi
    movl k, %eax
    movl %ecx, (%edi, %eax, 4)

    incl %eax
    pushl %eax
    call backtracking
    popl %eax 

restaurare:
    decl %eax
    movl %eax, k

    movl $v, %edi
    movl (%edi, %eax, 4), %edx
    movl $0, (%edi, %eax, 4)

    movl $contor, %edi
    sub $1, (%edi, %edx, 4)
    movl %edx, i

    jmp for_bkt

solutie:
    pushl $v
    call afisare
    popl %edx
    
    popl %edi
    pushl $0
    call exit
    popl %edx

reapel_backtracking:
    incl %eax
    pushl %eax
    call backtracking
    popl %eax

intoarcere:
    decl %eax
    movl %eax, k

exit_back:
    popl %edi
    popl %ebp
    ret


main:
    pushl $input
    call gets
    popl %ebx

    pushl $delimitator
    pushl $input
    call strtok
    popl %ebx
    popl %ebx

    movl %eax, rez
    pushl rez
    call atoi
    popl %ebx
    movl %eax, n

    pushl $delimitator
    pushl $0
    call strtok
    popl %ebx
    popl %ebx

    movl %eax, rez
    pushl rez
    call atoi
    popl %ebx
    movl %eax, m

    movl $3, %eax
    mull n
    movl %eax, nrelemente

    xorl %ecx, %ecx

for_input:
    cmp %ecx, nrelemente
    je apel_backtracking
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
    
    popl %ecx
    movl $v, %edi
    movl %eax, (%edi, %ecx, 4)

    movl $contor, %esi
    add $1, (%esi, %eax, 4)

    incl %ecx
    jmp for_input

apel_backtracking:
    pushl $0
    call backtracking
    popl %ebx

afisare_minus1:
    xorl %eax, %eax
    decl %eax

    pushl %eax
    pushl $formatPrintfm
    call printf
    popl %ebx
    popl %ebx

et_exit:
    movl $1, %eax
    xorl %ebx, %ebx
    int $0x80
