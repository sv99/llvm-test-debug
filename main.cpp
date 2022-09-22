#include <stdio.h>

int main() {
    int arr[3] = {1, 2, 4};
    int mat[3][2] = {1, 2, 3, 4, 5, 6};
    int result[2] = {0};
    int i = 0, j = 0;
    for (i = 0; i < 2; i++)
        for (j = 0; j < 3; j++) {
            result[i] += mat[j][i] * arr[j];
        }
    int k = 0;
    for (k = 0; k < 2; k++) {
        printf("%d\n", result[k]);
    }

    return 0;
}
