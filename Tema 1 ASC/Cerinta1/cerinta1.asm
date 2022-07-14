.data
    zece: .long 10
    doisprezece: .long 12
    sum: .long 0
    indexbinar: .long 0
    indexfinal: .long 0
    sir: .space 100
    binar: .space 400
    final: .space 400
    formatScanf: .asciz "%s"
    formatPrintf: .asciz "%s\n"
    
.text

.global main

main:
    pushl $sir
    pushl $formatScanf
    call scanf
    popl %ebx
    popl %ebx

    movl $sir, %edi
	movl $binar, %esi
	xorl %ecx, %ecx

et_for:
	movb (%edi, %ecx, 1), %al 
	cmp $0, %al
	je main2

	cmp $48, %al
	je et0
	cmp $49, %al
	je et1
	cmp $50, %al
	je et2
    cmp $51, %al
    je et3
    cmp $52, %al
    je et4
    cmp $53, %al
    je et5
    cmp $54, %al
	je et6
    cmp $55, %al
	je et7
    cmp $56, %al
	je et8
    cmp $57, %al
	je et9
    cmp $65, %al
    je etA
    cmp $66, %al
    je etB
    cmp $67, %al
    je etC
    cmp $68, %al
    je etD
    cmp $69, %al
    je etE
    cmp $70, %al
    je etF

cont:
	incl %ecx
	jmp et_for 

et0:
    pushl %ecx
    movl indexbinar, %ecx

    movb $48, (%esi, %ecx, 1)
	incl %ecx
    movb $48, (%esi, %ecx, 1)
	incl %ecx
    movb $48, (%esi, %ecx, 1)
	incl %ecx
    movb $48, (%esi, %ecx, 1)
	incl %ecx

    addl $4, indexbinar
    popl %ecx
    jmp cont

et1:
    pushl %ecx
    movl indexbinar, %ecx
    
    movb $48, (%esi, %ecx, 1)
	incl %ecx
    movb $48, (%esi, %ecx, 1)
	incl %ecx
    movb $48, (%esi, %ecx, 1)
	incl %ecx
    movb $49, (%esi, %ecx, 1)
	incl %ecx

    addl $4, indexbinar
    popl %ecx
    jmp cont

et2:
    pushl %ecx
    movl indexbinar, %ecx
    
    movb $48, (%esi, %ecx, 1)
	incl %ecx
    movb $48, (%esi, %ecx, 1)
	incl %ecx
    movb $49, (%esi, %ecx, 1)
	incl %ecx
    movb $48, (%esi, %ecx, 1)
	incl %ecx

    addl $4, indexbinar
    popl %ecx
    jmp cont

et3:
    pushl %ecx
    movl indexbinar, %ecx
    
    movb $48, (%esi, %ecx, 1)
	incl %ecx
    movb $48, (%esi, %ecx, 1)
	incl %ecx
    movb $49, (%esi, %ecx, 1)
	incl %ecx
    movb $49, (%esi, %ecx, 1)
	incl %ecx

    addl $4, indexbinar
    popl %ecx
    jmp cont

et4:
    pushl %ecx
    movl indexbinar, %ecx
    
    movb $48, (%esi, %ecx, 1)
	incl %ecx
    movb $49, (%esi, %ecx, 1)
	incl %ecx
    movb $48, (%esi, %ecx, 1)
	incl %ecx
    movb $48, (%esi, %ecx, 1)
	incl %ecx

    addl $4, indexbinar
    popl %ecx
    jmp cont
    
et5:
    pushl %ecx
    movl indexbinar, %ecx
    
    movb $48, (%esi, %ecx, 1)
	incl %ecx
    movb $49, (%esi, %ecx, 1)
	incl %ecx
    movb $48, (%esi, %ecx, 1)
	incl %ecx
    movb $49, (%esi, %ecx, 1)
	incl %ecx

    addl $4, indexbinar
    popl %ecx
    jmp cont
    
et6:
    pushl %ecx
    movl indexbinar, %ecx
    
    movb $48, (%esi, %ecx, 1)
	incl %ecx
    movb $49, (%esi, %ecx, 1)
	incl %ecx
    movb $49, (%esi, %ecx, 1)
	incl %ecx
    movb $48, (%esi, %ecx, 1)
	incl %ecx

    addl $4, indexbinar
    popl %ecx
    jmp cont
    
et7:
    pushl %ecx
    movl indexbinar, %ecx
    
    movb $48, (%esi, %ecx, 1)
	incl %ecx
    movb $49, (%esi, %ecx, 1)
	incl %ecx
    movb $49, (%esi, %ecx, 1)
	incl %ecx
    movb $49, (%esi, %ecx, 1)
	incl %ecx

    addl $4, indexbinar
    popl %ecx
    jmp cont
    
et8:
    pushl %ecx
    movl indexbinar, %ecx
    
    movb $49, (%esi, %ecx, 1)
	incl %ecx
    movb $48, (%esi, %ecx, 1)
	incl %ecx
    movb $48, (%esi, %ecx, 1)
	incl %ecx
    movb $48, (%esi, %ecx, 1)
	incl %ecx

    addl $4, indexbinar
    popl %ecx
    jmp cont
    
et9:
    pushl %ecx
    movl indexbinar, %ecx
    
    movb $49, (%esi, %ecx, 1)
	incl %ecx
    movb $48, (%esi, %ecx, 1)
	incl %ecx
    movb $48, (%esi, %ecx, 1)
	incl %ecx
    movb $49, (%esi, %ecx, 1)
	incl %ecx

    addl $4, indexbinar
    popl %ecx
    jmp cont
    
etA:
    pushl %ecx
    movl indexbinar, %ecx
    
    movb $49, (%esi, %ecx, 1)
	incl %ecx
    movb $48, (%esi, %ecx, 1)
	incl %ecx
    movb $49, (%esi, %ecx, 1)
	incl %ecx
    movb $48, (%esi, %ecx, 1)
	incl %ecx

    addl $4, indexbinar
    popl %ecx
    jmp cont
    
etB:
    pushl %ecx
    movl indexbinar, %ecx
    
    movb $49, (%esi, %ecx, 1)
	incl %ecx
    movb $48, (%esi, %ecx, 1)
	incl %ecx
    movb $49, (%esi, %ecx, 1)
	incl %ecx
    movb $49, (%esi, %ecx, 1)
	incl %ecx

    addl $4, indexbinar
    popl %ecx
    jmp cont
    
etC:
    pushl %ecx
    movl indexbinar, %ecx
    
    movb $49, (%esi, %ecx, 1)
	incl %ecx
    movb $49, (%esi, %ecx, 1)
	incl %ecx
    movb $48, (%esi, %ecx, 1)
	incl %ecx
    movb $48, (%esi, %ecx, 1)
	incl %ecx

    addl $4, indexbinar
    popl %ecx
    jmp cont
    
etD:
    pushl %ecx
    movl indexbinar, %ecx
    
    movb $49, (%esi, %ecx, 1)
	incl %ecx
    movb $49, (%esi, %ecx, 1)
	incl %ecx
    movb $48, (%esi, %ecx, 1)
	incl %ecx
    movb $49, (%esi, %ecx, 1)
	incl %ecx

    addl $4, indexbinar
    popl %ecx
    jmp cont
    
etE:
    pushl %ecx
    movl indexbinar, %ecx
    
    movb $49, (%esi, %ecx, 1)
	incl %ecx
    movb $49, (%esi, %ecx, 1)
	incl %ecx
    movb $49, (%esi, %ecx, 1)
	incl %ecx
    movb $48, (%esi, %ecx, 1)
	incl %ecx

    addl $4, indexbinar
    popl %ecx
    jmp cont
    
etF:
    pushl %ecx
    movl indexbinar, %ecx
    
    movb $49, (%esi, %ecx, 1)
	incl %ecx
    movb $49, (%esi, %ecx, 1)
	incl %ecx
    movb $49, (%esi, %ecx, 1)
	incl %ecx
    movb $49, (%esi, %ecx, 1)
	incl %ecx

    addl $4, indexbinar
    popl %ecx
    jmp cont
    
    
    



main2:
    movl $binar, %edi
    movl $final, %esi
    movl $1, %ecx

et_for2:
    movb (%edi, %ecx, 1), %al 
	cmp $0, %al
	je et_print

    cmp $49, %al
    je et_operatie
    
    movl $0, sum
    addl $1, %ecx
    movb (%edi, %ecx, 1), %al 
	cmp $49, %al
    je et_variabila

    addl $1, %ecx
    movb (%edi, %ecx, 1), %al 
	cmp $49, %al
    je et_minus

    addl $1, %ecx
    jmp forNr

et_minus:
    incl %ecx
    pushl %ecx
    movl indexfinal, %ecx
    
    movb $45, (%esi, %ecx, 1)
    incl %ecx

    addl $1, indexfinal
    popl %ecx
    jmp forNr

forNr:
    movl %ecx, %eax
    movl $0, %edx
    divl doisprezece

    cmp $4, %edx
    je sumnr4
    cmp $5, %edx
    je sumnr5
    cmp $6, %edx
    je sumnr6
    cmp $7, %edx
    je sumnr7
    cmp $8, %edx
    je sumnr8
    cmp $9, %edx
    je sumnr9
    cmp $10, %edx
    je sumnr10
    cmp $11, %edx
    je sumnr11
    cmp $0, %edx
    je nrfinal  

sumnr4:
    movb (%edi, %ecx, 1), %al 
	cmp $49, %al
    je addnr4
    incl %ecx
    jmp forNr
addnr4:
    addl $128, sum
    incl %ecx
    jmp forNr

sumnr5:
    movb (%edi, %ecx, 1), %al 
	cmp $49, %al
    je addnr5
    incl %ecx
    jmp forNr
addnr5:
    addl $64, sum
    incl %ecx
    jmp forNr

sumnr6:
    movb (%edi, %ecx, 1), %al 
	cmp $49, %al
    je addnr6
    incl %ecx
    jmp forNr
addnr6:
    addl $32, sum
    incl %ecx
    jmp forNr

sumnr7:
    movb (%edi, %ecx, 1), %al 
	cmp $49, %al
    je addnr7
    incl %ecx
    jmp forNr
addnr7:
    addl $16, sum
    incl %ecx
    jmp forNr

sumnr8:
    movb (%edi, %ecx, 1), %al 
	cmp $49, %al
    je addnr8
    incl %ecx
    jmp forNr
addnr8:
    addl $8, sum
    incl %ecx
    jmp forNr

sumnr9:
    movb (%edi, %ecx, 1), %al 
	cmp $49, %al
    je addnr9
    incl %ecx
    jmp forNr
addnr9:
    addl $4, sum
    incl %ecx
    jmp forNr

sumnr10:
    movb (%edi, %ecx, 1), %al 
	cmp $49, %al
    je addnr10
    incl %ecx
    jmp forNr
addnr10:
    addl $2, sum
    incl %ecx
    jmp forNr

sumnr11:
    movb (%edi, %ecx, 1), %al 
	cmp $49, %al
    je addnr11
    incl %ecx
    jmp forNr
addnr11:
    addl $1, sum
    incl %ecx
    jmp forNr

nrfinal:
    addl $1, %ecx
    pushl %ecx
    movl indexfinal, %ecx

    cmp $10, sum
    jl ocifra

    cmp $100, sum
    jl douacifre

    jmp treicifre

ocifra:
    movl sum, %eax
    addl $48, %eax

    movl %eax, (%esi, %ecx, 1)
    incl %ecx
    movb $32, (%esi, %ecx, 1)
	incl %ecx

    addl $2, indexfinal
    popl %ecx
    jmp et_for2

douacifre:
    movl sum, %eax
    movl $0, %edx
    divl zece
    addl $48, %eax
    addl $48, %edx

    movl %eax, (%esi, %ecx, 1)
    incl %ecx
    movl %edx, (%esi, %ecx, 1)
    incl %ecx
    movb $32, (%esi, %ecx, 1)
	incl %ecx

    addl $3, indexfinal
    popl %ecx
    jmp et_for2

treicifre:
    movl sum, %eax
    movl $0, %edx
    divl zece
    movl %edx, sum
    movl $0, %edx
    divl zece

    addl $48, %eax
    addl $48, %edx

    movl %eax, (%esi, %ecx, 1)
    incl %ecx
    movl %edx, (%esi, %ecx, 1)
    incl %ecx

    movl sum, %eax
    addl $48, %eax
    movl %eax, (%esi, %ecx, 1)
	incl %ecx

    movb $32, (%esi, %ecx, 1)
	incl %ecx

    addl $4, indexfinal
    popl %ecx
    jmp et_for2



et_variabila:
    addl $3, %ecx
    jmp forVar

forVar:
    movl %ecx, %eax
    movl $0, %edx
    divl doisprezece

    cmp $5, %edx
    je sumv5
    cmp $6, %edx
    je sumv6
    cmp $7, %edx
    je sumv7
    cmp $8, %edx
    je sumv8
    cmp $9, %edx
    je sumv9
    cmp $10, %edx
    je sumv10
    cmp $11, %edx
    je sumv11
    cmp $0, %edx
    je varfinal

sumv5:
    movb (%edi, %ecx, 1), %al 
	cmp $49, %al
    je addv5
    incl %ecx
    jmp forVar
addv5:
    addl $64, sum
    incl %ecx
    jmp forVar

sumv6:
    movb (%edi, %ecx, 1), %al 
	cmp $49, %al
    je addv6
    incl %ecx
    jmp forVar
addv6:
    addl $32, sum
    incl %ecx
    jmp forVar

sumv7:
    movb (%edi, %ecx, 1), %al 
	cmp $49, %al
    je addv7
    incl %ecx
    jmp forVar
addv7:
    addl $16, sum
    incl %ecx
    jmp forVar

sumv8:
    movb (%edi, %ecx, 1), %al 
	cmp $49, %al
    je addv8
    incl %ecx
    jmp forVar
addv8:
    addl $8, sum
    incl %ecx
    jmp forVar

sumv9:
    movb (%edi, %ecx, 1), %al 
	cmp $49, %al
    je addv9
    incl %ecx
    jmp forVar
addv9:
    addl $4, sum
    incl %ecx
    jmp forVar

sumv10:
    movb (%edi, %ecx, 1), %al 
	cmp $49, %al
    je addv10
    incl %ecx
    jmp forVar
addv10:
    addl $2, sum
    incl %ecx
    jmp forVar

sumv11:
    movb (%edi, %ecx, 1), %al 
	cmp $49, %al
    je addv11
    incl %ecx
    jmp forVar
addv11:
    addl $1, sum
    incl %ecx
    jmp forVar

varfinal:
    incl %ecx
    pushl %ecx
    movl indexfinal, %ecx
    
    movl sum, %eax
    movl %eax, (%esi, %ecx, 1)
    incl %ecx
    movb $32, (%esi, %ecx, 1)
	incl %ecx

    addl $2, indexfinal
    popl %ecx
    jmp et_for2 



et_operatie:
    addl $8, %ecx
    movb (%edi, %ecx, 1), %al
    cmp $49, %al
    je et_div

    addl $1, %ecx
    movb (%edi, %ecx, 1), %al
    cmp $49, %al
    je et_submul

    add $1, %ecx
    movb (%edi, %ecx, 1), %al
    cmp $49, %al
    je et_add

    jmp et_let

et_submul:
    addl $1, %ecx
    movb (%edi, %ecx, 1), %al
    cmp $49, %al
    je et_mul

    jmp et_sub

et_let:
    addl $2, %ecx
    pushl %ecx
    movl indexfinal, %ecx

    movb $108, (%esi, %ecx, 1)
	incl %ecx
    movb $101, (%esi, %ecx, 1)
	incl %ecx
    movb $116, (%esi, %ecx, 1)
	incl %ecx
    movb $32, (%esi, %ecx, 1)
	incl %ecx

    addl $4, indexfinal
    popl %ecx
    jmp et_for2

et_add:
    addl $2, %ecx
    pushl %ecx
    movl indexfinal, %ecx

    movb $97, (%esi, %ecx, 1)
	incl %ecx
    movb $100, (%esi, %ecx, 1)
	incl %ecx
    movb $100, (%esi, %ecx, 1)
	incl %ecx
    movb $32, (%esi, %ecx, 1)
	incl %ecx

    addl $4, indexfinal
    popl %ecx
    jmp et_for2

et_sub:
    addl $2, %ecx
    pushl %ecx
    movl indexfinal, %ecx

    movb $115, (%esi, %ecx, 1)
	incl %ecx
    movb $117, (%esi, %ecx, 1)
	incl %ecx
    movb $98, (%esi, %ecx, 1)
	incl %ecx
    movb $32, (%esi, %ecx, 1)
	incl %ecx

    addl $4, indexfinal
    popl %ecx
    jmp et_for2

et_mul:
    addl $2, %ecx
    pushl %ecx
    movl indexfinal, %ecx

    movb $109, (%esi, %ecx, 1)
	incl %ecx
    movb $117, (%esi, %ecx, 1)
	incl %ecx
    movb $108, (%esi, %ecx, 1)
	incl %ecx
    movb $32, (%esi, %ecx, 1)
	incl %ecx

    addl $4, indexfinal
    popl %ecx
    jmp et_for2

et_div:
    addl $4, %ecx
    pushl %ecx
    movl indexfinal, %ecx

    movb $100, (%esi, %ecx, 1)
	incl %ecx
    movb $105, (%esi, %ecx, 1)
	incl %ecx
    movb $118, (%esi, %ecx, 1)
	incl %ecx
    movb $32, (%esi, %ecx, 1)
	incl %ecx

    addl $4, indexfinal
    popl %ecx
    jmp et_for2



et_print:
    pushl $final
    pushl $formatPrintf
    call printf
    popl %ebx
    popl %ebx
    jmp et_exit

et_exit:
    mov $1, %eax
    xor %ebx, %ebx
    int $0x80
