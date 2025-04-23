#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <string.h>

int main(int argc,char* argv[]){
    printf("Usage:\n");
    printf("Add a new document:dclient -a \"title\" \"authors\" \"year\" \"path\"\n");
    printf("Query:dclient -c \"key\"\n");
    printf("Remove:dclient -d \"key\"\n");
    printf("Number of line that contain the word in a document:dclient -l \"key\" \"keyword\"\n");
    printf("List of documents that contain the word:dclient -s \"keyword\"\n");
    if ( strcmp(argv[1],"-a") == 0 )
    {
        indexa(argv[2],argv[3],atoi(argv[4]),argv[5]);
    }

    if ( strcmp(argv[1],"-c") == 0 )
    {
        consulta(argv[3]);
    }

    if ( strcmp(argv[1],"-u") == 0 )
    {
        person_change_age(argv[2],(atoi(argv[3])));
    }

    if ( strcmp(argv[1],"-o") == 0 )
    {
        person_change_age_v2(atoi(argv[2]),atoi(argv[3]));
    }
    return 0;
}
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