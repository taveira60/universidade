#include <stdio.h>

void quadrado(int size)
{
    int i = 0;
    for (i = 0; i < size; i++)
    {
        for (int j = 0; j < size; j++)
        {
            printf("#");
        }
        printf("\n");
    }
}

void xadrez(int size)
{
    char last = '_';
    for (int i = 0; i < size; i++)
    {
        for (int j = 0; j < size; j++)
        {
            if (last == '_')
            {
                printf("%c", '#');
                last = '#';
            }
            else
            {
                printf("%c", '_');
                last = '_';
            }
        }
        printf("\n");
    }
}

void tr8ingulos(int size)
{
    for (int i = 0; i <= size; i++)
    {
        for (int j = 0; j < i; j++)
        {
            printf("%c", '#');
        }
        printf("\n");
    }
    for (int i = size - 1; i > 0; i--)
    {
        for (int j = 0; j < i; j++)
        {
            printf("%c", '#');
        }
        printf("\n");
    }
}

// // void horizontal (int size){
    // // for(int i = 0;i<size)
// }
 

int main()
{
    tr8ingulos(5);
    return 0;
}