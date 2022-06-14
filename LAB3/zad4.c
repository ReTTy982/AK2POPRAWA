#include <stdio.h>
#include <unistd.h>

unsigned long long timestamp();
void memory_test();
void register_test();


int main()
{
    unsigned long long start, finish;

    start = timestamp();
    memory_test();
    finish = timestamp();

    printf("Dostęp do pamięci: %llu\n", finish - start);

    start = 0;
    finish = 0;


    start = timestamp();
    register_test();
    finish = timestamp();

    printf("Dostęp do rejestru: %llu\n", finish - start);



}