#include <stdio.h>
#include <unistd.h>

unsigned long long timestamp();

int main()
{
    unsigned long long start, finish;

    start = timestamp();
    sleep(1);
    finish = timestamp();

    printf("Liczba cykli na jedna sekunde: %llu\n", finish - start);
}