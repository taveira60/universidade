#include <stdio.h>
#include <stdlib.h>

typedef struct celula
{
    char *palavra;
    int ocorr;
    struct celula *prox;
} *Palavras;

void libertaLista(Palavras p)
{
    free(p);
}

int quantasP(Palavras l)
{
    Palavras temp = l;
    int j = 0;
    for (int i = 0; temp != NULL; temp = temp->prox, i++)
        j++;
    return j;
}

void listaPal(Palavras l)
{
    Palavras temp = l;
    int i = 0;
    while (temp != NULL)
    {
        i++;
        temp = temp->prox;
    }
}

char *ultima(Palavras l)
{
    Palavras temp = l;
    char *pal=NULL;

    while(temp !=NULL){
        pal=temp->palavra;
        temp=temp->prox;
    }
    return pal;
}

Palavras acrescentaInicio (Palavras l, char *p){
    Palavras temp = malloc(sizeof(struct celula));
    temp->palavra=p;
    temp->ocorr=1;
    temp->prox=l;
    return temp;
}

Palavras acrescentaFim (Palavras l, char *p){
    Palavras temp = malloc(sizeof(struct celula));
    temp->palavra = p;
    temp->ocorr = 1;
    temp->prox = NULL;
    Palavras t = l;
    
    if (l == NULL) return temp;
    
    while (t->prox != NULL) t = t->prox;
    t->prox = temp;
    
    return l;
}

int main()
{

    return 0;
}