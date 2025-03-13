#include <stdio.h>

int contaVogais(char *s)
{
    int count = 0;
    for (int i = 0; s[i] != '\0'; i++)
    {
        if (s[i] == 'a' || s[i] == 'e' || s[i] == 'i' || s[i] == 'o' || s[i] == 'u' ||
            s[i] == 'A' || s[i] == 'E' || s[i] == 'I' || s[i] == 'O' || s[i] == 'U')
            count++;
    }

    return count;
}
// duvidas
int retiraVogaisRep(char *s)
{
    int removidas = 0, pos = 0;

    for (int i = 0; s[i] != '\0'; pos++)
    {
        s[pos] = s[i++];
        int min = (s[pos] == 'a' || s[pos] == 'e' || s[pos] == 'i' || s[pos] == 'o' || s[pos] == 'u');
        int mai = (s[pos] == 'A' || s[pos] == 'E' || s[pos] == 'I' || s[pos] == 'O' || s[pos] == 'U');
        if (min || mai)
        {
            while (s[pos] == s[i])
            {
                i++;
                removidas++;
            }
        }
    }
    s[pos] = '\0';
    return removidas;
}

// int duplicaVogais (char *s){
//
// }

int ordenado(int v[], int N)
{
    for (int i = 0; i < N - 1; i++)
    {
        if (v[i] > v[i + 1])
            return -1;
    }
    return 1;
}

void merge(int a[], int na, int b[], int nb, int r[])
{
    int i = 0, j = 0, k = 0;
    while (i < na && j < nb)
    {
        if (a[i] < b[j])
            r[k++]=a[i++];
        else
            r[k++]=b[j++];
    }
    while (i<na)
    {
        r[k++]=a[i++];
    }
    while (j<nb)
    {
        r[k++]=b[j++];
    }
    
}

int main()
{
    int v[] = {1, 2, 3, 4};
    int z[] = {4, 5, 6, 7,8,9,10};
    int r[] = {};
    merge(v, 4, z, 7, r);
    // char s[] = "Ola tadds bem";
    for (int i = 0; i < 11; i++)
    {
        printf("%d ", r[i]);
    }
    printf("\n");
    return 0;
}