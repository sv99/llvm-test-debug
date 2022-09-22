#include <stdio.h>

int call_me(int value) {
   return value < 6 ? 4: 2;
}

int main() {
    printf("ret val: %d\n", call_me(4));
    return 0;
}