# as -32 zad1.s -o zad1.o &&ld -melf_i386 zad1.o -o zad1
.data
liczba: .long 0
liczba_format_output: .asciz "%d\n"
liczba_format_input: .asciz "%d"
string_format_input: .asciz "%s"
string_format_output: .asciz "%s\n"


tekst: .space 255


.global main


main:
push $tekst
push $string_format_input
call scanf

push $tekst
push $string_format_output
call printf


push $liczba 
push $liczba_format_input
call scanf


push liczba
push $liczba_format_output
call printf
call exit