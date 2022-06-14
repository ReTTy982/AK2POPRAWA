EXIT_NR  = 1
READ_NR  = 3
SYS_READ = 3
WRITE_NR = 4

STDOUT = 1
EXIT_CODE_SUCCESS = 0
STDIN = 0

num_length = 256
word_length = 8
num_words = num_length / word_length

.global _start

.data
wynik: .space num_length
liczba: .space num_length
pierwsza: .space num_length
druga: .space num_length
debug: .space num_length





_start:

push %ebp
movl %esp ,%ebp
movl $10, %ecx

xor %edx, %edx # licznik petli 
xor %esi, %esi # indeks wyniku





jeden:
movl $1, %eax
movl $1, %ebx
push %ebx
add %eax, %ebx
movl %eax, pierwsza
movl %ebx, druga
jmp fibb_better


petla:
movl pierwsza(, %edx, 8), %eax
movl druga(, %edx,8), %ebx
popf
adc %eax, %ebx
pushf
clc
adc %ebx, wynik(, %edx,8)
inc %edx
movl %edx, debug
cmp $num_words, %edx
jl petla
adc $0, wynik(, %edx,8)
push druga
push wynik
pop druga


fibb_better:
xor %edx, %edx
dec %ecx
pop pierwsza
cmp $0, %ecx
jnz petla





mov $WRITE_NR, %eax			
mov $STDOUT, %ebx			
mov wynik, %ecx
mov $num_length, %edx
int $0x80




mov $EXIT_NR          , %eax
mov $EXIT_CODE_SUCCESS, %ebx 
int $0x80


