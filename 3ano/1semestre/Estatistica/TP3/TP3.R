View(dados_eurostat)

dim(dados_eurostat)

library(tidyverse)
library(ggplot2)
library(dplyr)
#1
summary(dados_eurostat$year)
unique(dados_eurostat$month)
#2
eurostat_pt<-dados_eurostat |>
  filter(country == "Portugal")

head(eurostat_pt)
View(eurostat_pt)


ggplot(eurostat_pt,aes(x=time,y=Total))+
  geom_line(color="blue")

#3
dados_recentes <- filter(dados_eurostat, year == "2019")
dados_recentes |>
  group_by(country) |> 
  summarise(
    total_mulheres = (mean(Females)),
    total_homens = (mean(Males))
  ) |>
  arrange(desc(total_mulheres - total_homens))|>
  head(5)

#4

anoatual<-2025
df_ultimos5