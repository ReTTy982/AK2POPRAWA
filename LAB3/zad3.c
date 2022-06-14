#include <stdio.h>

extern void funkcja_asm_argumenty(int x, char* y);
extern void funkcja_asm_zmienne();
extern int zmienna_int_asm;
extern char* zmienna_char_asm;
char* get_char();


int zmienna_int_c = 1234;
char* zmienna_char_c = "Zmienna char*";

int sum(int x, int y){
    return x+y;
}

void funkcja_c(int x, char* y){
    printf("%s",y);
    printf("%s %d",y,x);
}

int main(){
    funkcja_asm_argumenty( 8,"test");
    funkcja_asm_zmienne();
    funkcja_c(zmienna_int_asm,zmienna_char_asm);



    return 0;
}

