#include <stdio.h>
#include <stdlib.h>

void rodaEsq(int a[], int N, int r)
{
    int newarray[N];
    for (int i = 0; i < N; i++)
    {
        int j = i - r;
        if (j < 0)
            j = j + N;
        newarray[j] = a[i];
    }
    for (int i = 0; i < N; i++)
    {
        a[i] = newarray[i];
    }
}

typedef struct lint_nodo
{
    int valor;
    struct lint_nodo *prox;
} *LInt;

int delete(int n, LInt *l)
{
    if (n == 0)
    {
        LInt temp = *l;
        *l = (*l)->prox;
        free(temp);
        return 0;
    }

    LInt atual = *l;
    int i = 0;
    while (i < n - 1 && atual->prox != NULL)
    {
        atual = atual->prox;
        i++;
    }

    if (i == n - 1 && atual->prox != NULL)
    {
        LInt temp = atual->prox;
        atual->prox = temp->prox;
        free(temp);
        return 0;
    }
    return -1;
}

int maxCresc(LInt l)
{
    int max = 1;
    int count = 1;
    LInt atual = l;
    while (atual->prox != NULL)
    {
        if (atual->prox->valor > atual->valor)
        {
            count++;
        }
        else
        {
            if (count > max)
            {
                max = count;
            }
            count = 1;
        }
        atual = atual->prox;
    }
    if (count > max)
    {
        max = count;
    }
    return count;
}

typedef struct abin_nodo
{
    int valor;
    struct abin_nodo *esq, *dir;
} *ABin;

ABin folhaEsq(ABin a)
{
    if (a == NULL)
    {
        return 0;
    }
    if (a->dir == NULL && a->esq == NULL)
    {
        return a;
    }
    if (a->esq != NULL)
    {
        ABin colhaoesq = folhaEsq(a->esq);
        if (colhaoesq != NULL)
        {
            return colhaoesq;
        }
    }
    if (a->dir != NULL)
    {
        return folhaEsq(a->dir);
    }
}

int parentesisOk(char exp[])
{
    int curvdir = 0;
    int curvesq = 0;
    int retdir = 0;
    int retesq = 0;
    int chavdir = 0;
    int chavesq = 0;
    for (int i = 0; exp[i] != "\0"; i++)
    {
        if (exp[i] == '(')
            curvdir++;
        if (exp[i] == ')')
            curvesq++;
        if (exp[i] == '[')
            retdir++;
        if (exp[i] == ']')
            retesq++;
        if (exp[i] == '{')
            chavdir++;
        if (exp[i] == '}')
            chavesq++;
    }
    if((curvdir==curvesq)&&(retdir==retesq)&&(chavdir==chavesq))return 1;
    return 0;
}

int main(void)
{
}