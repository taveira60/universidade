#include <stdio.h>
// 1
// int func()
// {
// int num;
// int max = 0;
// printf("introduza um numero");
// int a[] = scanf('%d',num);
// for (int i = 0; a[i] != '\0'; i++)
// {
// if (max < a[i])
// max = a[i];
// }
// return max;
// }

// 2

// 3

// 4

int bitsUm(unsigned int n)
{
    int r = 0;
    while (n != 0)
    {
        if ((n % 2) == 1)
        {
            n = n / 2;
            r++;
        }
        else
        {
            n = n / 2;
        }
    }
    return r;
}

// 5
int trailingZ(unsigned int n)
{
    int r = 0;
    while (n != 0)
    {
        if ((n % 2) == 1)
        {
            n = n / 2;
        }
        else
        {
            n = n / 2;
            r++;
        }
    }
    return r;
}

// 6

int qDig(unsigned int n)
{
    int r = 0;
    while (n > 0)
    {
        n = n / 10;
        r++;
    }
    return r;
}

// 7

char *strcat(char s1[], char s2[])
{
    int s = 0;
    for (int i = 0; s1[i] != '\0'; i++)
    {
        s = i + 1;
    }
    for (int j = 0; s2[j] != '\0'; j++)
    {
        s1[s] = s2[j];
        s++;
    }
    s1[s] = '\0';
    return s1;
}

// 8
char *strcpy(char *dest, char source[])
{
    int s = 0;
    for (int i = 0; source[i] != '\0'; i++)
    {
        dest[i] = source[i];
        s = i;
    }
    return dest;
}

// 9
//  int strcmp (char s1[], char s2[]){
//  int i;
//  for(int i;s1[i]!='\0'&&s2[i]!='\0'&&s1[i]==s2[i];i++);
//  return s1[i]-s2[i];
// }

// 10
// char *strstr(char s1[], char s2[]) {
    // int segura=0;
    // for(int i = 0;s1[i]!='\0'&&s2[i]!='\0';i++){
        // 
    // }
// }













int main()
{
    char s1[100] = "ola";
    char s2[100] = "ole";
    printf("r=%d\n", strcmp(s2, s1));
    return 0;
}