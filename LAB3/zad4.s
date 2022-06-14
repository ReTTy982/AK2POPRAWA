.global timestamp
.global register_test
.global memory_test

.text

timestamp:

push %ebx
xor %eax, %eax
cpuid
rdtsc

pop %ebx
ret

register_test:
xor %eax, %eax
ret

memory_test:
push %eax
pop %eax
ret
