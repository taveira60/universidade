#include <unistd.h>
#include <stdio.h>
#include <sys/wait.h>
#include <stdlib.h>
#include <sys/wait.h>
// 1. Escreva um programa que crie um pipe an´onimo e de seguida crie um processo filho. Experimente o pai
// enviar um inteiro atrav´es do descritor de escrita do pipe, e o filho receber um inteiro a partir do respetivo
// descritor de leitura.
// (a) Experimente provocar um atraso antes do pai enviar o inteiro (p. ex., sleep(5)).
// Note que a leitura do filho bloqueia enquanto o pai n˜ao realizar a operac¸ ˜ao de escrita no pipe.

void pai_to_filho()
{
    pid_t pid;
    int fd[2];
    int res = pipe(fd);
    int value_to_read = 0;
    int status;
    if (res == -1)
    {
        perror("Erro na criaçao do pipe");
    }
    if ((pid = fork()) == 0)
    {
        close(fd[1]);
        while ((res = read(fd[0], &value_to_read, sizeof(int))) > 0)
        {
            printf("o processo filho leu %d do codigo de saida%d\n", res, value_to_read);
        }
        close(fd[0]);
        _exit(0);
    }
    else
    {
        close(fd[0]);
        for (int i = 0; i < 10000; i++)
        {
            int value = 10;
            res = write(fd[1], &value, sizeof(int));
            printf("o pai escreveu %d bytes\n", res);
        }
        close(fd[1]);
        wait(&status);
        WIFEXITED(status);
        // printf("o filho saiu com codigo de saida de %d\n",value_to_read);
    }
}

// 2. Experimente agora inverter os papeis de modo `a informac¸ ˜ao ser transmitida do filho para o pai.
// (a) Experimente provocar um atraso antes do pai ler o inteiro. Repita com uma sequˆencia de inteiros.
// Note que a escrita do filho bloqueia enquanto o pai n˜ao realizar a operac¸ ˜ao de leitura no pipe.
// (b) Modifique o programa anterior de modo `a leitura do pipe ser realizada enquanto n˜ao for detetada
// a situac¸ ˜ao de end of file no respetivo descritor. Repare que esta situac¸ ˜ao acontece apenas quando
// nenhum processo – neste caso, pai e filho – tˆem aberto o descritor de escrita do pipe.

void filho_to_pai()
{
    pid_t pid;
    int fd[2];
    int res = pipe(fd);
    int value_to_read = 0;
    int status;
    if (res == -1)
    {
        perror("Erro na criaçao do pipe");
    }
    if ((pid = fork()) == 0)
    {
        close(fd[0]);
        for (int i = 0; i < 10000; i++)
        {
            int value = 10;
            res = write(fd[1], &value, sizeof(int));
            printf("o pai escreveu %d bytes\n", res);
        }
        close(fd[1]);
        wait(&status);
        _exit(0);
    }
    else
    {
        close(fd[1]);
        while ((res = read(fd[0], &value_to_read, sizeof(int))) > 0)
        {
            printf("o processo filho leu %d do codigo de saida%d\n", res, value_to_read);
        }
        close(fd[0]);

        WIFEXITED(status);
        // printf("o filho saiu com codigo de saida de %d\n",value_to_read);
    }
}
int main(void)
{
    filho_to_pai();
    // pai_to_filho();
}