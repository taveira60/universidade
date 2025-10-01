#include <unistd.h>
#include <stdio.h>
#include <sys/wait.h>
#include <fcntl.h>
#include <string.h>
#include <stdlib.h>
#include <assert.h>

// Questão 8 Considere uma empresa que utiliza um único ficheiro escrito em formato binário para armazenar
// todos os registos individuais dos seus funcionários. Cada registo contém o nome, cargo e salário na empresa de um
// funcionário, de acordo com a seguinte estrutura:

typedef struct RegistoF
{
    char nome[20];
    char cargo[20];
    int salário;
} RegistoF;

// 1. Escreva a função void aumentaSalarios(char* ficheiro, char* cargo, int valor, long N, int P) que
// atualiza o ficheiro com N registos de forma aumentar em valor o salário dos funcionários com um dado cargo.
// A função deve desencadear uma atualização concorrente com P processos.

void aumentaSalarios(char *ficheiro, char *cargo, int valor, long N, int P)
{
    
    pid_t pid;
    for (int i = 0; i < P; i++)
    {
        
        if ((pid = fork()) == 0)
        {
            int fd = open(ficheiro, O_RDWR, 0660);
            long div = N / P;
            long inicio = i * div;
            long quantos;
            if (i == P - 1)
            {
                quantos = P - inicio;
            }
            else
            {
                quantos = div;
            }

            RegistoF r;
            for (long j = 0; j < quantos; j++)
            {
                off_t offset = (inicio + j) * sizeof(RegistoF);
                lseek(fd, offset, SEEK_SET);
                read(fd, &r, sizeof(RegistoF));
                if (strcmp(r.cargo, cargo) == 0)
                {
                    r.salário += valor;
                    lseek(fd, offset, SEEK_CUR);
                    write(fd, &r, sizeof(RegistoF));
                }
            }
        }
    }
    for (int i = 0; i < P; i++)
    {
        wait(NULL);
    }
}

int validaSalarios(char *ficheiro, char *cargo)
{
    int fd[2];
    pipe(fd);
    pid_t pid1;

    if ((pid1 = fork()) == 0)
    {
        close(fd[0]);
        dup2(fd[1], 1);
        close(fd[1]);
        execlp("filtrarcargo", "filtrarcargo", ficheiro, cargo);
    }
    pid_t pid2;
    if ((pid2 = fork) == 0)
    {
        close(fd[1]);
        dup2(fd[0], 0);
        close(fd[0]);
        execlp("validamin", "validamin", NULL);
    }
    int status;
    close(fd[0]);
    close(fd[1]);
    waitpid(pid1, NULL, 0);
    waitpid(pid2, &status, 0);
    return WEXITSTATUS(status);
}

void traduz_e_filtra(char *caminho_ficheiro, char *palavra_chave)
{
    int pipefd[2];
    pipe(pipefd);
    pid_t pid1;
    if ((pid1 = fork() == 0))
    {

        int fd = open(caminho_ficheiro, O_RDONLY);
        dup2(fd, 0);
        close(fd);
        close(pipefd[0]);
        dup2(pipefd[1], 1);
        close(pipefd[1]);
        execlp("tradutor", "tradutor", NULL);
    }
    pid_t pid2;
    if ((pid1 = fork() == 0))
    {
        close(pipefd[1]);
        dup2(pipefd[0],0);
        close (pipefd[0]);
        execlp("grep","grep",palavra_chave,NULL);

    }

    close(pipefd[1]);
    close(pipefd[0]);

    waitpid(pid1,NULL,0);
    waitpid(pid2,NULL,0);
}

void filtraN(char* caminhos_ficheiros[], int total_ficheiros, char* palavra_chave){
    pid_t pid;
    for(int i = 0; i < total_ficheiros;i++){
        if((pid=fork())==0){
            traduz_e_filtra(caminhos_ficheiros[i],palavra_chave);
        }
    
    }
    for (int i = 0; i< total_ficheiros;i++){
        wait(NULL);
    }
}



int main(int argc, char **argv)
{
}