.data

x: .float 2.0
y: .float 0.0
z: .float 3.3
format: .string "%d\n"
status: .int 0






.global exception_test


exception_test:
push %ebp
mov %esp, %ebp

finit

fld y
fld x
fdivp 
fld z
fld x
fdivp  


fstsw status
push status
push $format
call printf


mov %ebp, %esp
pop %ebp
ret

