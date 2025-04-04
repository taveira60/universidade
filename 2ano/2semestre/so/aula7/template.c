#include <unistd.h>
#include <stdio.h>
#include <sys/wait.h>
#include <stdlib.h>
#include <sys/wait.h>
#include <fcntl.h>
#define BUF_SIZE 1024

// 1. Escreva trˆes programas que ir˜ao ilustrar a operac¸ ˜ao de pipes com nome. O primeiro cria um pipe com
// nome “fifo”. O segundo repete para este pipe todas as linhas de texto lidas a partir do seu standard input.
// Por sua vez, o terceiro programa repete para o seu standard output todas as linhas de texto lidas a partir
// deste mesmo pipe.
// Note que, ao contr´ario dos pipes an´onimos, a abertura para escrita de um pipe com nome bloqueia at´e
// que um processo o abra para leitura, e vice-versa.

void ex1()
{
    int res = mkfifo("fifo", 0600);
    if (res == -1)
    {
        perror("Erro a criar o fifo");
    }
    printf("fifo criado com sucesso");
}
// 2.Pretende-se determinar todas as ocorrˆencias de um determinado n´umero num vetor de n´umeros inteiros.
// Escreva um programa ”servidor”, que fique a correr em background, e que fac¸a esta pesquisa a pedido
// dos clientes. Escreva um programa ”cliente”que envia para o servidor o n´umero a procurar. O servidor
// deve enviar o n´umero de ocorrˆencias como resposta ao cliente respetivo. O cliente e servidor devem
// comunicar via pipes com nome.
int writter()
{
    char buf[BUF_SIZE];

    int fd = open("fifo", O_WRONLY);
    if (fd == -1)
    {
        perror("falhou");
        return -1;
    }
    printf("A ler do stdin para o stdout\n");
    ssize_t bytes_lidos;
    while ((bytes_lidos = read(0, buf, BUF_SIZE)) > 0)
    {
        write(fd, buf, bytes_lidos);
    }
    close(fd);

    printf("terminei\n");
    return 0;
}
int reader(){
    char buf[BUF_SIZE];

    int fd = open("fifo", O_WRONLY);
    if (fd == -1)
    {
        perror("falhou");
        return -1;
    }
    printf("A ler do stdin para o stdout\n");
    ssize_t bytes_lidos;
    while ((bytes_lidos = read(fd, buf, BUF_SIZE)) > 0)
    {
        write(1, buf, bytes_lidos);
    }
    close(fd);
    unlink("fifo");

    printf("terminei\n");
    return 0;
}
int main(void)
{
    ex1();
}