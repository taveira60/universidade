#ifndef PERSON_H
#define PERSON_H

#define FILENAME "file_pessoas"

#define DEBUG1

typedef struct person
{
    char name[200];
    int age;
} Person;

int new_person(char *name, int age);
int list_n_persons(int N);
int person_change_age(char *name, int age);
int person_change_age_v2(long pos, int age);

#endif