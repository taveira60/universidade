library(titanic)
library(tidyverse)
View(Titanic)

data(titanic_train)
data(titanic_test)
titanic_train<-
titanic_train$Survived<- as.factor(titanic_train$Survived)

modelo1 <- glm(Survived ~ Sex + Age+Pclass, data = titanic_train,
               family = binomial(link = "logit"))

summary(modelo1)

# Probabilidades ajustadas
paw<-titanic_test$prob_Survived <- predict(
  modelo1,
  newdata = titanic_test,
  type = "response"
)
paw
