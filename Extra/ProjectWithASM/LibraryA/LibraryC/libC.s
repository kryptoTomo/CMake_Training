.section .text

.global _add

_add:
    movl 4(%esp), %eax
    movl 8(%esp), %ebx
    addl %ebx, %eax
    ret
    