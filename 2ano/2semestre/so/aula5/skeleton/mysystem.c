#include "mysystem.h"

// recebe um comando por argumento
// returna -1 se o fork falhar
// caso contrario retorna o valor do comando executado

int mysystem(const char *command)
{

	int ret = -1;
	char *exec_args[20];
	char *string, *cmd, *tofree;
	int i = 0;
	tofree = cmd = strdup(command);
	while ((string = strsep(&cmd, " ")) != NULL)
	{
		exec_args[i] = string;
		i++;
	}
	exec_args[i] = NULL;

	pid_t pid;
	if ((pid = fork) == 0)
	{
		execv(exec_args[0],exec_args);
	}
	else{

	}

	return ret;
}