#include <stdio.h>
#include <string.h>

typedef struct aluno
{
    int numero;
    char nome[100];
    int miniT[6];
    float teste;
} Aluno;

int nota(Aluno a)
{
    int total;
    for (int i; i < 6; i++)
    {
        total += a.miniT[i];
    }
    total /= 2;
    total += a.teste * 0.7;
    if (total < 9.5)
    {
        return -1;
    }
    return 0;
}

int procuraNum(int num, Aluno t[], int N)
{
    for (int i = 0; i < N && t[i].numero <= num; i++)
    {
        if (t[i].numero == num)
            return i;
    }
    return -1;
}

void ordenaPorNum(Aluno t[], int N)
{
    Aluno temp;
    for (int i = 0; i < N - 1; i++)
    {
        for (int j = 1; i < N; j++)
        {
            if (t[j].numero < t[i].numero)
            {
                temp = t[i];
                t[i] = t[j];
                t[j] = temp;
            }
        }
    }
}

int main(void)
{
    Aluno turma[5];

    turma[0].numero = 25;
    strcpy(turma[0].nome, "Daniel Santos");
    
    turma[1].numero = 10;
    strcpy(turma[1].nome, "Ana Silva");
    
    turma[2].numero = 30;
    strcpy(turma[2].nome, "Elena Ferreira");
    
    turma[3].numero = 15;
    strcpy(turma[3].nome, "Bruno Martins");
    
    turma[4].numero = 20;
    strcpy(turma[4].nome, "Carla Oliveira");
    

    printf("Array antes da ordenação:\n");
    for (int i = 0; i < 5; i++)
    {
        printf("Aluno %d: Número %d, Nome %s\n", i, turma[i].numero, turma[i].nome);
    }
    ordenaPorNum(turma, 5);

    printf("\nArray depois da ordenação:\n");
    for (int i = 0; i < 5; i++)
    {
        printf("Aluno %d: Número %d, Nome %s\n", i, turma[i].numero, turma[i].nome);
    }
}
