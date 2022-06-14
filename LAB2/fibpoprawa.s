EXIT_NR  = 1
READ_NR  = 3
SYS_READ = 3
WRITE_NR = 4

STDOUT = 1
EXIT_CODE_SUCCESS = 0
STDIN = 0
.data
format: .asciz "%d\n"

.global funkcja




funkcja:
push %ebp
mov %esp, %ebp
mov $5, %edx



jeden: # 
mov $1, %eax
mov $1, %ebx
push %eax
push %ebx
cmp $0, %edx
je koniec


fibb:
pop %ebx
pop %eax
add %ebx, %eax
dec %edx
cmp $0, %edx
je koniec
push %eax
push %ebx
call fibb







koniec:
push %eax
push $format
call printf
call exit



