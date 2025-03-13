#include <stdio.h>
#include <sys/types.h>
#include <unistd.h> /* chamadas ao sistema: defs e decls essenciais */
#include <fcntl.h> 
#include "mycat.h"

int mycat (){

    char* buffer = malloc (1024);
    ssize_t bytes_written =0;
    ssize_t bytes_read = 0 ;
    
    while ((bytes_read = read(0,&buffer,1024))> 0){
        bytes_written += write (1, &buffer ,bytes_read);
     };

    printf ("Bytes read: %d\n", bytes_read);

    printf ("Bytes written: %d\n",bytes_written);

	return 0;
}

int mycat2 (const char* path){
    char* buffer = (char*) malloc (sizeof(char)*1024);

    int fd = open (path, O_RDONLY);
    if(fd == -1){
        perror ("Open error:");
        return -1;
    }

    ssize_t bytes_written =0;
    ssize_t bytes_read = 0 ;
    while ((bytes_read = read(fd,buffer,1024))> 0){
        bytes_written += write (1, buffer ,bytes_read);
     };

    printf ("Bytes read: %d\n", bytes_read);

    printf ("Bytes written: %d\n",bytes_written);

    free (buffer);

    close(fd);

	return 0;
}

