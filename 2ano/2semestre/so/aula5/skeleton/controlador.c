#include <stdio.h>
#include "mysystem.h"

void controller(int N, char **commands)
{
	pid_t pid1;
	int status;
	pid_t *array = malloc(sizeof(pid_t) * N);
	int *ocorrencias = (int *)calloc(3, sizeof(int));
	for (int i = 0; i < N; i++)
	{
		int p = 1;
		int count = 0;
		if ((pid1 = fork()) == 0)
		{
			while (p > 0)
			{
				p = mysystem(commands[i]);
				count++;
				if (p == 0)
					break;
			}
			_exit(count);
		}
		array[i] = pid1; // guarda o pid dos monitores
	}
	for (int i = 0; i < N; i++)
	{
		waitpid(array[i], &status, 0);
		WEXITSTATUS(status);
		ocorrencias[i] = WEXITSTATUS(status);
	}
	free(array);
	for (int i = 0; i < N; i++) // Usar N aqui, não 3
    {
        printf("Ocorrencias do comando '%s': %d\n", commands[i], ocorrencias[i]);
    }
	free(ocorrencias);
}

int main(int argc, char *argv[])
{

	char *commands[argc - 1];
	int N = 0;
	for (int i = 1; i < argc; i++)
	{
		commands[N] = strdup(argv[i]);
		printf("command[%d] = %s\n", N, commands[N]);
		N++;
	}

	controller(N, commands);

	return 0;
}
