SYSEXIT = 1
SYSREAD = 3
SYSWRITE =4
STDIN = 0
STDOUT = 1
SYSCALL = 0x80
BUFF_SIZE = 254

.bss

bufor: .space BUFF_SIZE
wynik: .space 1024000


.data
text_size: .long 0

.text

.global _start






_start:


mov $SYSREAD, %eax
mov $STDIN, %ebx
mov $bufor, %ecx
mov $BUFF_SIZE, %edx
int $SYSCALL

cmp $0,%eax
je koniec


addl text_size,%eax
movl %eax , text_size
xor %eax, %eax
xor %edi, %edi


get_byte:
# movb bufor(,%esi,1), %al
movb bufor(,%edi,1), %al
cmp $BUFF_SIZE, %edi
je _start
# je koniec



porownaj:
cmp $'9', %al
jle cyfra
cmp $'Z', %al
jle wielka_litera
cmp $'z', %al
jle mala_litera
# jmp next
jmp not_valid

mala_litera:
cmp $'a', %al
jl not_valid
# jl next
# movb bufor(,%esi,1), %al
SUBb $32, %al
movb %al, wynik(,%esi,1)
jmp next 


wielka_litera:
cmp $'A', %al
jl not_valid
# jl next
# movb bufor(,%esi,1), %al
ADD $32,%al
movb %al, wynik(,%esi,1)
jmp next

cyfra:
cmp $'0', %al
jl not_valid
# jl next
cmp $'4', %al
jle mniejsza_cyfra
jmp wieksza_cyfra


mniejsza_cyfra:
movb $'9', %bl   # bl = 57
SUbb %al, %bl # bl - al -> bl - liczba ktora trzeba odjac od 9 
movb $9, %al # 9->al
subb %bl, %al # 9 - przesuniecie 
movb $'9', %bl # - bl =52 od tego bedziemy odejmowac
subb %al, %bl
movb %bl, %al

movb %al, wynik(,%esi,1)
jmp next

wieksza_cyfra:
movb $'0', %bl # bl = 48
subb %bl, %al # al - 48 -> al
movb $9, %bl # 9 do przesuniecia
subb %al, %bl # wynik do bl 
movb $'0', %al 
ADD %bl, %al

movb %al, wynik(,%esi,1)
jmp next

next:
inc %esi
inc %edi
jmp get_byte

not_valid:
inc %edi
jmp get_byte


koniec:
movb $'\n', %bl
movb %bl, wynik(,%esi,1)


mov $SYSWRITE, %eax
mov $STDOUT, %ebx
mov $wynik, %ecx
# mov $text_size, %edx
mov %esi, %edx # 0003E170
int $SYSCALL




mov $1, %eax
mov $0, %ebx
int $SYSCALL
