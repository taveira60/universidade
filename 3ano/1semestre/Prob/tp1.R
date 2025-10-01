#bases
a=10
b=100
a+b


#listas
bolas=c(1,2,3,4,5,6,7,8,9)
sum(bolas)
mean(bolas) 

#matrizes
matriz=matrix(c(22,20,20,20),2,2)
matriz
#tabela
dados=data.frame(nome=c("juas","asda","adsad"),
                signo=c("papau","papai","papei"),
                cidades=c("braga","fama","guima"),
                altura=c(1.60,1.30,1.2))
dados
str(dados)
summary(dados) 
dim(dados) #dimensao dos dados
dados[,3] #coluna 3
dados[2,] #linha 2
dados[1,3] #elemento da linha 1 coluna 3
dados[2:4,] #da linha 2 à 4

x <- 3
x
if (x > 0) {
  print("Positivo")
} else {
  print("Não-positivo")
}

#forma pratica de importar  -> ir a import dataset

#exportar dados
write.csv(dados, "dados.csv", row.names = FALSE)

#util, principalmente com obj grandes
#saveRDS(dados, "dados.rds")

dados
dados$signo #sintaxe pra selecionar uma var especifica
dados[dados$altura > 1.8,]

library(dplyr)

dados %>% filter(altura>1.8)

#add variavel ao data frame
dados$pe<-c(44,42,40.5,44)
dados

#fazer um grafico usando R base
plot(dados$altura, dados$pe)

library(ggplot2)

ggplot(dados, aes(x = altura, y = pe)) +
  geom_point() +
  labs(title = "Dispersão altura vs pe")


