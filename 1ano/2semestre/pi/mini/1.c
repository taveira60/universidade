#include <stdio.h>
#include <stdbool.h>
#include <math.h>

// Função otimizada para verificar se um número é primo
bool eh_primo(long n) {
    if (n < 2) return false;
    if (n == 2 || n == 3) return true;
    if (n % 2 == 0 || n % 3 == 0) return false;

    // Testamos apenas divisores da forma 6k +/- 1 até a raiz quadrada de n
    for (long i = 5; i * i <= n; i += 6) {
        if (n % i == 0 || n % (i + 2) == 0) return false;
    }
    return true;
}

int main() {
    long inicio = 4710018;
    long fim = 4810019;
    int contador = 0;

    printf("--- Listagem de Numeros Primos no Intervalo ---\n");

    for (long i = inicio; i <= fim; i++) {
        if (eh_primo(i)) {
            printf("%ld ", i);
            contador++;
            
            // Quebra de linha a cada 10 números para organizar a saída
            if (contador % 10 == 0) printf("\n");
        }
    }

    printf("\n\n--------------------------------------------\n");
    printf("Total de números primos encontrados: %d\n", contador);
    printf("--------------------------------------------\n");

    return 0;
}