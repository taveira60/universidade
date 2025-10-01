#include <stdio.h>
#include <unistd.h>
#include <time.h>
#include <stdlib.h>
#include <sys/wait.h>
#include <fcntl.h>

// 1
int ex1()
{
    int fdin = open("/etc/passwd", O_RDONLY);
    int fdout = open("saida.txt", O_CREAT | O_TRUNC | O_WRONLY, 0666);
    int fderr = open("erros.txt", O_CREAT | O_TRUNC | O_WRONLY, 0666);

    dup2(fdin, 0);
    close(fdin);

    dup2(fdout, 1);
    close(fdout);

    dup2(fderr, 2);
    close(fderr);
    printf("Terminei !!!");
    fflush(printf);
    return 0;
}

int ex1v2()
{
    int fdin = open("/etc/passwd", O_RDONLY);
    int fdout = open("saida.txt", O_CREAT | O_TRUNC | O_WRONLY, 0666);
    int fderr = open("erros.txt", O_CREAT | O_TRUNC | O_WRONLY, 0666);

    int originalfdin = dup(0);
    int originalfdout = dup(1);
    int originalfderr = dup(3);

    dup2(fdin, 0);
    close(fdin);

    dup2(fdout, 1);
    close(fdout);

    dup2(fderr, 2);
    close(fderr);

    ssize_t bytes_read = 0;
    char buffer[1024];

    while ((bytes_read = read(0, &buffer, 1024)) > 0)
    {
        write(1, &buffer, bytes_read);
        write(2, &buffer, bytes_read);
    }

    dup2(originalfderr, 2);
    close(originalfderr);

    dup2(originalfdin, 0);
    close(originalfdin);

    dup2(originalfdout, 1);
    close(originalfdout);

    printf("Terminei !!!");
    // fflush(printf);
    return 0;
}

// 2
int ex2()
{
    int status;
    pid_t pid;

    if ((pid = fork()) == 0)
    {
        int fdin = open("/etc/passwd", O_RDONLY);
        int fdout = open("saida.txt", O_CREAT | O_TRUNC | O_WRONLY, 0666);
        int fderr = open("erros.txt", O_CREAT | O_TRUNC | O_WRONLY, 0666);

        int originalfdin = dup(0);
        int originalfdout = dup(1);
        int originalfderr = dup(3);

        dup2(fdin, 0);
        close(fdin);

        dup2(fdout, 1);
        close(fdout);

        dup2(fderr, 2);
        close(fderr);

        ssize_t bytes_read = 0;
        char buffer[1024];

        while ((bytes_read = read(0, &buffer, 1024)) > 0)
        {
            write(1, &buffer, bytes_read);
            write(2, &buffer, bytes_read);
        }

        _exit(0);
    }
    else
    {
        wait(&status);
    }
    // dup2(originalfderr, 2);
    // close(originalfderr);

    // dup2(originalfdin, 0);
    // close(originalfdin);

    // dup2(originalfdout, 1);
    // close(originalfdout);
    printf("Terminei !!!");
    // fflush(printf);
    return 0;
}

// 3
int ex3()
{
    int fdin = open("/etc/passwd", O_RDONLY);
    int fdout = open("saida.txt", O_CREAT | O_TRUNC | O_WRONLY, 0666);
    int fderr = open("erros.txt", O_CREAT | O_TRUNC | O_WRONLY, 0666);

    int originalfdin = dup(0);
    int originalfdout = dup(1);
    int originalfderr = dup(3);

    dup2(fdin, 0);
    close(fdin);

    dup2(fdout, 1);
    close(fdout);

    dup2(fderr, 2);
    close(fderr);

    execlp("wc", "wc", NULL);

    // dup2(originalfderr, 2);
    // close(originalfderr);

    // dup2(originalfdin, 0);
    // close(originalfdin);

    // dup2(originalfdout, 1);
    // close(originalfdout);
    // printf("Terminei !!!");
    // fflush(printf);
    return 0;
}

// 4
int ex4()
{
    pid_t pid;
    int fd[2];
    int res = pipe(fd);

    if (res == -1)
    {
        perror("erro da criaçao do pipe");
    }

    int originalfdout = dup(1);
    int originalfdin = dup(0);

    if ((pid = fork()) == 0)
    {
        close(fd[1]);
        dup2(fd[0], 0);
        close(fd[0]);
        execlp("wc", "wc", NULL);
        _exit(0);
    }
    else
    {
        close(fd[0]);
        ssize_t bytes_read;
        char buffer[1024];
        while ((bytes_read = read(0, &buffer, 1024)) > 0)
        {
            write(fd[1], &buffer, bytes_read);
        }
        close(fd[1]);
    }
    wait(NULL);
    return 0;
}

//
int ex5()
{
    pid_t pid;
    int fd[2];
    if (pipe (fd)==-1){
        perror("nao abre cao\n");
    }
    int originalfdout=dup(1);
    if((pid=fork())==0){
        close(fd[0]);
        dup2(fd[1],1);
        close(fd[1]);
        execlp("ls","ls","/etc",NULL);
        _exit(1);
    }
    
    if((pid=fork())==0){
        close(fd[1]);
        dup2(fd[0],0);
        close(fd[0]);
        execlp("wc","wc","-l",NULL);
        _exit(1);
    }
    close(fd[0]);
    close(fd[1]);
    wait(NULL);
    wait(NULL);
    return 0;

}

int main(void)
{
    ex5();
}