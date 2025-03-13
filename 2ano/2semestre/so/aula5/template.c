#include <time.h>
#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <sys/wait.h>

// int execl(const char *path, const char *arg0, ..., NULL);
// int execlp(const char *file, const char *arg0, ..., NULL);
// int execv(const char *path, char *const argv[]);
// int execvp(const char *file, char *const argv[]);


int ex2(){
    int ret=0;
    int status;
    __pid_t pid;
    if((pid=fork())==0){
        ret=execlp("ls","ls","-l",NULL); 
        _exit(-1);   
    }
    else{
        wait(&status);
        if(WIFEXITED(status)){
            printf("ola safadinho %d\n",ret);
        }
        
    }
    return 0;
}





int main(int argc,int **argv){
    ex2();
    return 0;
}