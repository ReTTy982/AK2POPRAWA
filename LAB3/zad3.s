.data

string1: .ascii "Test zmiennej z C, dodawanie: %d\n"
string2: .asciz "%d\n"
string3: .asciz "%s,%d\n"
test: .long 256

zmienna_int_asm: .long 123
zmienna_char_asm: .asciz "Tutaj"





.text

.global funkcja_asm_argumenty
.global funkcja_asm_zmienne
.global zmienna_int_asm
.size zmienna_int_asm, 4
.global zmienna_char_asm
.size zmienna_char_asm,4
.global get_char


get_char:
push %ebp
mov %esp, %ebp
mov zmienna_char_asm, %eax
mov %ebp, %esp
pop %ebp
ret



funkcja_asm_argumenty: # Uzywanie argumentów podaych do funkcji w C
# Tworzenie ramki stosu
push %ebp
mov %esp, %ebp

push 8(%ebp) # Pierwszy argument funckji wprowadzonej w C
push 12(%ebp) # Drugi argument funkcji wprowadzonej w C
push $string3 # Ciag formatujacy
call printf

# Wychodzenie z funkcji
mov %ebp, %esp
pop %ebp
ret


funkcja_asm_zmienne:  # Uzywanie zmiennych globalnych zainicjalizowanych w C
# Tworzenie ramki stosu
push %ebp
mov %esp, %ebp

push zmienna_int_c # Pierwszy argument funckji wprowadzonej w C
push zmienna_char_c # Drugi argument funkcji wprowadzonej w C
push $string3 # Ciag formatujacy
call printf

# Wychodzenie z funkcji
mov %ebp, %esp
pop %ebp
ret



