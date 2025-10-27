library(tidyverse)
set.seed(1234)

n <- 200
alunos <- tibble(
  id            = 1:n,
  curso         = sample(c("CC", "SI"), n, replace = TRUE, prob = c(.65, .35)),
  ano           = sample(1:3, n, replace = TRUE, prob = c(.4, .35, .25)),
  sexo          = sample(c("F", "M"), n, replace = TRUE),
  horas_estudo  = round(rlnorm(n, meanlog = log(6), sdlog = 0.5), 1),
  faltas        = pmax(0, round(rpois(n, lambda = 3) - rbinom(n, 1, .1)*3)),
  nota          = pmin(20,
                       pmax(0,
                            round( 8 +
                                     0.6 * pmin(horas_estudo, 20) -
                                     0.4 * pmin(faltas, 10) +
                                     rnorm(n, 0, 2.5), 1)))
) %>%
  mutate(
    # introduzir alguns outliers na nota
    nota = replace(nota, sample(1:n, 3), c(2, 19.5, 0)),
    # introduzir NAs em horas_estudo
    horas_estudo = replace(horas_estudo, sample(1:n, 6), NA_real_)
  )

head(alunos) #visualizar primeiras 6 linhas


#1
#(a) Indique o tamanho amostral e a estrutura (nomes e tipos das variáveis).
#(b) Classifique cada variável como categórica (nominal/ordinal) ou quantitativa (discreta/contínua).
#(c) Identifique unidades e escalas (quando aplicável).
#Indique o tamanho amostral.
glimpse(alunos)

#2)
#Analise a variável nota.

#(a) Calcule média, mediana, DP, IQR e MAD.
#(b) Interprete diferenças entre média e mediana (assimetria?).
#(c) Calcule o resumo de cinco números.
with(alunos,c(mean=mean(nota,na.rm=TRUE),
              median=median(nota,na.rm=TRUE),
              sd=sd(nota,na.rm=TRUE),
              IQR=IQR(nota,na.rm=TRUE),
              MAD=mad(nota,constant = 1,na.rm=TRUE)))
summary(alunos$nota)

#3
#(a) Determine barreiras de Tukey: Q1 - 1.5×IQR e Q3 + 1.5×IQR para nota.
#(b) Liste observações classificadas como valores atípicos.
#(c) Faça um boxplot e anote a presença de outliers.

q1<-quantile(alunos$nota,.25,na.rm=TRUE)
q3<-quantile(alunos$nota,.75,na.rm=TRUE)

iqr<-q3-q1
low<-q1-1.5*iqr
high<-q3-1.5*iqr
which_out<-which(alunos$nota<low|alunos$nota>high)

ggplot(alunos,aes(y=nota))+geom_boxplot(outliner.color="red")+labs(title="Boxplot de nota")

#4
#Compare nota entre curso e sexo.

#(a) Crie boxplots lado a lado por curso; comente diferenças de centro e dispersão.
#(b) Produza uma tabela-resumo por curso e sexo (n, média, mediana, IQR).
#(c) Discuta se diferenças podem ser atribuídas a distribuições ou a outliers.

ggplot(alunos,aes(x=curso,y=nota,fill=curso))+geom_boxplot(alpha=.6) + theme(legend.position="none")

alunos %>%
  group_by(curso,sexo) %>%
  summarise(n=n(),
            media = mean(nota, na.rm=TRUE),
            mediana = median(nota, na.rm=TRUE),
            IQR = IQR(nota, na.rm=TRUE),
            .groups = "drop")

#5)
#Explore a relação horas_estudo vs nota.

#(a) Faça um gráfico de dispersão; trate os NAs.
#(b) Calcule correlação de Pearson e Spearman; comente.
#(c) Ajuste via geom_smooth(method = "lm") e interprete.

dados2<-alunos%>%drop_na(horas_estudo,nota)
ggplot(dados2,aes(horas_estudo, nota))+geom_point(alpha=6)+geom_smooth(method = "lm",se=FALSE)

cor_pearson<- cor(dados2$horas_estudo,dados2$nota,method="pearson")
cor_spearman<- cor(dados2$horas_estudo,dados2$nota, method="spearman")
c(pearson=cor_pearson,spearman=cor_spearman)

#6

#(a) Observe a distribuição de horas_estudo (histograma/densidade).
#(b) Aplique transformação log a horas_estudo e volte a comparar com nota.
#(c) Comente o efeito da transformação na linearidade e heterocedasticidade.

p1<-ggplot(alunos,aes(horas_estudo))+geom_histogram()+labs(title="Horas de Estudo")
p2<-ggplot(alunos %>% mutate(log_horas=log(horas_estudo)),aes(log_horas))+geom_histogram()+labs(title = "log(Horas de Estudo)")

p1;p2

ggplot(alunos %>% drop_na(horas_estudo, nota) %>% mutate(log_horas = log(horas_estudo)),
               aes(log_horas, nota)) + geom_point(alpha=.6) + geom_smooth(method="lm", se=FALSE)

#ver falta um exercico nao sei qual e ta perdido
#Exercício 8

#(a) Quantifique os NA por variável.
#(b) Compare resultados de lista completa (remover NA) com uma imputação simples (ex.: mediana) para horas_estudo ao estimar a média de nota por curso.
#(c) Comente potencial viés.

colSums(is.na(alunos))

lista_completa<-alunos %>%drop_na(horas_estudo)
imp_mediana<-alunos %>% 
  mutate(horas_estudo=if_else(is.na(horas_estudo),median(horas_estudo,na.rm=TRUE),horas_estudo))

lista_completa %>% group_by(curso) %>% summarise(media_nota=mean(nota,na.rm=TRUE))
imp_mediana   %>% group_by(curso) %>% summarise(media_nota = mean(nota, na.rm=TRUE))
