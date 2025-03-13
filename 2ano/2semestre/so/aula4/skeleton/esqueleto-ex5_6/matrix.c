#include "matrix.h"

int **createMatrix()
{

    // seed random numbers
    srand(time(NULL));

    // Allocate and populate matrix with random numbers.
    printf("Generating numbers from 0 to %d...", MAX_RAND);
    int **matrix = (int **)malloc(sizeof(int *) * ROWS);
    for (int i = 0; i < ROWS; i++)
    {
        matrix[i] = (int *)malloc(sizeof(int) * COLUMNS);
        for (int j = 0; j < COLUMNS; j++)
        {
            matrix[i][j] = rand() % MAX_RAND;
        }
    }
    printf("Done.\n");

    return matrix;
}

void printMatrix(int **matrix)
{

    for (int i = 0; i < ROWS; i++)
    {
        printf("%2d | ", i);
        for (int j = 0; j < COLUMNS; j++)
        {
            printf("%7d ", matrix[i][j]);
        }
        printf("\n");
    }
}

// ex.5
int valueExists(int **matrix, int value)
{

    int status;

    for (int i = 0; i < ROWS; i++)
    {
        if (fork() == 0)
        {
            for (int j = 0; j < COLUMNS; j++)
            {
                if (matrix[i][j] == value)
                    _exit(1);
            }
            _exit(0);
        }
    }

    int flag;
    for (int i = 0; i < ROWS; i++)
    {
        wait(&status);
        if (WEXITSTATUS(status) != 0)
        {
            flag = 1;
        }
    }

    if (flag != 0)
        printf("O numero Procurado esta aqui malandro\n");
    else
        printf("Nao ta aqui malandro\n");
    return 0;
}

// ex.6
void linesWithValue(int **matrix, int value)
{
    pid_t *array = malloc(sizeof(pid_t) * ROWS);
    int status;
    pid_t pid;
    for (int i = 0; i < ROWS; i++)
    {
        if ((pid = fork()) == 0)
        {
            for (int j = 0; j < ROWS; j++)
            {
                if (matrix[i][j] == value)
                    _exit(i);
            }
            // array[i]= getpid();
            _exit(0);
        }
        array[i] = pid;
    }
    int flag = 0;
    for (int i = 0; i < ROWS; i++)
    {
        waitpid(array[i],&status,0);
        if (WEXITSTATUS(status) != 0)
        {
            int r = WEXITSTATUS(status);
            printf(" linha:%d e o que gamou tem o pid:%d\n", r, array[r]);
            flag = 1;
        }
    }
    if (flag == 0)
    {
        printf("nao tem aqui nada priminho\n");
    }
}
