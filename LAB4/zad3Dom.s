
.data

round: .int 0
format: .string "%d\n"
tmp: .int 0




.global change_round


change_round:
push %ebp
mov %esp, %ebp
finit

fstcw tmp
movl tmp, %eax
push tmp
push $format
call printf
orl $0x17F, %eax
movl %eax, tmp

fldcw tmp

fstcw round



push round
push $format
call printf

mov %ebp, %esp
pop %ebp
ret