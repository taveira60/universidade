#include <stdio.h>

float multInt1(int n, float m)
{
    int r = 0;
    for (int i = 0; i < n; i++)
    {
        r += m;
    }
    return r;
}

float multInt2(int n, float m)
{
    int r = 0;
    for (; n > 1; n /= 2)
    {
        if (n % 2 != 0)
        {
            r += m;
        }
        m = m * 2;
    }
    r = r + m;
    return r;
}

int mdc1(int a, int b)
{
    int r = 0;
    int temp = 0;
    if (a < b)
    {
        for (int i = 1; i <= a; i++)
        {
            if (a % i == 0)
            {
                temp = i;
            }
            if (b % temp == 0)
            {
                r = temp;
            }
        }
    }
    if (b < a)
    {
        for (int i = 1; i <= b; i++)
        {
            if (b % i == 0)
            {
                temp = i;
            }
            if (a % temp == 0)
            {
                r = temp;
            }
        }
    }
    return r;
}

int mdc2(int a, int b)
{
    int r = 0;
    while ((a && b) != 0)
    {
        if (a < b)
        {
            b = b - a;
        }
        else if (a > b)
        {
            a = a - b;
        }
        else
        {
            r = a;
            a = a - b;
        }
    }
    return r;
}

// int mdc3(int a, int b)
// {
//     int r = 0;
//     while ((a && b) != 0)
//     {
//         if (a < b)
//         {
//             b = b - a;
//         }
//         else if (a > b)
//         {
//             a = a - b;
//         }
//         else
//         {
//             r = a;
//             a = a - b;
//         }
//     }
//     return r;
// }

int fib1(int n)
{
    if (n < 2)
        return 1;
    else
        return fib1(n - 1) + fib1(n - 2);
}

int fib2(int n)
{
    int i, a = 1, b = 1;
    for (i = 2; i != n; i++)
    {
        b += a;
        a = b - a;
    }
    return b;
}
// duvidas
int main()
{
    printf("%d", fib2(10));
    return 0;
}
