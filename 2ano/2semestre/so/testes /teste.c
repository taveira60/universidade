#include <unistd.h>
#include <stdio.h>
#include <sys/wait.h>
#include <fcntl.h>
#include <string.h>
#include <stdlib.h>
#include <assert.h>

int main(int argc, char **argv)
{
    int N = 10;
    int fd[2][2];
    int i = 0;
    while (i < 3)
    {
        if (i == 0)
        {
            pipe(fd[i]);
            switch (fork())
            {
            case 0:
                close(fd[i][0]);
                dup2(fd[i][1], 1);
                close(fd[i][1]);
                execlp("filter", "filter", NULL);
                perror("filter");
                //
                _exit(0);
                //
            default:
                close(fd[i][1]);
                break;
            }
        }
        else if (i == 1)
        {
            pipe(fd[i]);
            for (int j = 0; j < N; j++)
            {
                switch (fork())
                {
                case 0:
                    close(fd[i][0]);
                    dup2(fd[i][1], 1);
                    close(fd[i][1]);
                    //
                    dup2(fd[i][0], 0);
                    close(fd[i][0]);
                    execlp("execute", "execute", NULL);
                    perror("execute");
                    _exit(0);
                    break;
                    //
                default:
                    close(fd[0][1]);
                    break;
                }
            }
        }
        else
        {
            switch (fork())
            {
            case 0:
                dup2(fd[1][0], 0);
                close(fd[1][0]);
                execlp("merge", "merge", NULL);
                perror("merge");
                _exit(0);
                //
            default:
            }
        }
        i++;
    }
    //
    for (int i = 0; i < (N + 2); i++)
    {
        wait(NULL);
    }
    return 0;
}

int main(int argc, char **argv)
{
}