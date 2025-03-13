#include <stdio.h>

void swapM(int *x, int *y)
{
    int temp;
    temp = *x;
    *x = *y;
    *y = temp;
}

void swap(int v[], int i, int j)
{
    int temp;
    temp = v[i];
    v[i] = v[j];
    v[j] = temp;
}

int soma(int v[], int N)
{
    int r = 0;
    for (int i = 0; i < N; i++)
    {
        r += v[i];
    }
    return r;
}

void inverteArray(int v[], int N)
{
    for (int i = 0; i < N / 2; i++)
    {
        swap(v, i, N - i - 1);
    }
}

void inverteArray1(int v[], int N)
{
    for (int i = 0; i < N / 2; i++)
    {
        swapM(v + i, v + N - i - 1);
    }
}

int maximum(int v[], int N, int *m)
{
    if (N < 1)
        return -1;
    *m = v[0];
    for (int i = 0; i < N; i++)
    {
        if (v[i] > *m)
            *m = v[i];
    }
    return *m;
}

//7 duvidas
void quadrados(int q[], int N)
{

}

//8 duvidas

int main()
{
    int v[] = {1, 2, 3, 4, 5};
    // int i=3;
    // int j=4;
    // swap(v,i ,j);
    int m;
    printf("%d\n", maximum(v, 5, &m));
    // for (int i = 0; i < 5; i++)
    // {
    // printf("%d ", v[i]);
    // }

    return 0;
}