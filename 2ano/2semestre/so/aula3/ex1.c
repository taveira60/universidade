#include <stdio.h>
#include <unistd.h>   /* chamadas ao sistema: defs e decls essenciais */
#include <sys/wait.h> /* chamadas wait*() e macros relacionadas */
#include <stdlib.h>
// 1. Implemente um programa que imprima o seu identificador de processo e o do seu pai. Comprove –
// invocando o comando ps – que o pai do seu processo ´e o interpretador de comandos que utilizou para o
// executar.
void ex1()
{
    fork();
    printf("child pid: %d\n", getpid());
    printf("parents pid: %d\n", getppid());
}
// 2. Implemente um programa que crie um processo filho. Pai e filho devem imprimir o seu identificador de
// processo e o do seu pai. O pai deve ainda imprimir o PID do seu filho.
void ex2()
{
    pid_t pid = fork();

    if (pid > 0)
    {
        printf("Pai: Pai:%d, Filho:%d\n", getpid(), pid); // get pid porque tou no pai e quero pegar no pid
    }
    else
    {
        printf("Filho: Pai:%d, Filho:%d\n", getppid(), getpid()); // getppid porque quero o do pai e o get pid porque quero o do filho
    }
}
// 3. Implemente um programa que crie dez processos filhos que dever˜ao executar sequencialmente. Para este
// efeito, os filhos podem imprimir o seu PID e o do seu pai, e finalmente, terminarem a sua execuc¸ ˜ao com
// um valor de sa´ıda igual ao seu n´umero de ordem (e.g.: primeiro filho criado termina com o valor 1). O
// pai dever´a imprimir o c´odigo de sa´ıda de cada um dos seus filhos.
void ex3()
{
    int status;
    pid_t pid;
    for (int i = 0; i <= 10; i++)
    {
        if (fork() == 0)
        {
            printf("Pai:%d, Filho:%d\n", getppid(), getpid());
            exit(i);
        }
        else
        {
            pid = wait(&status);
            printf("O processo filho terminou:%2d-%d\n", WEXITSTATUS(status), pid);
        }
    }
}
// 4. Implemente um programa que crie dez processos filhos que dever˜ao executar em concorrˆencia. O pai
// dever´a esperar pelo fim da execuc¸ ˜ao de todos os seus filhos, imprimindo os respetivos c´odigos de sa´ıda.
void ex4()
{
    int status;
    pid_t pid;
    for(int i=0;i<10;i++){
        if(fork()==0){
            printf("Filho:%d\n",getpid());
            exit(i);
        }
    }
    for(int i = 0;i<10;i++){
        pid = wait(&status);
        printf("O processo filho terminou:%2d-%d\n", WEXITSTATUS(status), pid);
    }
    printf("Pai:%d\n",getpid());
}

int main()
{
    //ex3();
    ex4();
    return 0;
}