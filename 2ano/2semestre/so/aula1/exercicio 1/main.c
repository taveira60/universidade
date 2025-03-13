#include <stdio.h>
#include <sys/types.h>
#include <unistd.h> /* chamadas ao sistema: defs e decls essenciais */
#include <fcntl.h> /* O_RDONLY, O_WRONLY, O_CREAT, O_* */
#include "mycat.h"

int main (int argc,char* argv[]){

    int res;

    for(int i = 0;i<argc;i++)
    {
        printf("->argv[%d] = %s\n",i ,argv [i]);
    }

    if (argc == 1){
        res = mycat ();
    }else if (argc == 2){
        res = mycat2(argv[1]);
    }else {
        perror("Wrong args!");
        res =1;
    }
   

    return res;
}