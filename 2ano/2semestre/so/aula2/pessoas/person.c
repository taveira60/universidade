#include "person.h"
#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <string.h>
int new_person(char *name, int age)
{
    int fd = open(FILENAME, O_CREAT | O_APPEND | O_RDWR, 0660);
    Person p;
    strcpy(p.name, name);
    p.age = age;
    write(fd, &p, sizeof(Person));
    close(fd);
    return 0;
}

int list_n_persons(int N)
{
    Person p;
    int fd = open(FILENAME, O_RDONLY, 0600);
    for (int i = 0; i < N; i++)
    {
        if (read(fd, &p, sizeof(Person)) != sizeof(Person))
        {
            close(fd);
            return 0;
        }
        printf("%d:Nome: %s, Idade: %d\n", i, p.name, p.age);
    }
    close(fd);
    return 0;
}

int person_change_age(char *name, int age)
{
    int fd = open(FILENAME, O_RDWR, 0660);
    Person p;
    while (read(fd, &p, sizeof(Person)) != 0)
    {
        
        if (!(strcmp(p.name, name)))
        {
            lseek(fd, -sizeof(Person), SEEK_CUR);
            p.age = age;
            write(fd, &p, sizeof(Person));
        }
    }
    close(fd);
    return 0;
}

int person_change_age_v2(long pos, int age){
    int fd=open(FILENAME,O_RDWR,0666);
    int n=(pos+1)*sizeof(Person);
    
    lseek(fd,n-sizeof(int),SEEK_SET);
    write(fd,&age,sizeof(int));

    close(fd);
    return 0;
}