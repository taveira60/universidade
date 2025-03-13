#include <stdio.h>

int main()
{

    long x = 15;
    long y = 13;

    int v = 10;
    char s = 'e';
    char d = 'e';

    int t = 10000;
    while (t >= 0)
    {
        if (t % 3 == 0 && t % 5 == 0)
        {

            // if (d == 'n')

            //     d = 'e';

            // else if (d == 'e')

            //     d = 's';

            // else if (d == 's')

            //     d = 'w';

            // else

            //     d = 'n';
        }
        else if (t % 3 == 0)

            v += 2;

        else if (t % 5 == 0)

            v -= 1;

        else
        {

            if (d == 'n')

                y += v;

            else if (d == 'e')

                x += v;

            else if (d == 's')

                y -= v;

            else

                x -= v;
        }
        t--;
    }
    printf("%c(%ld,%ld)\n", s, x, y);
    return 0;
}