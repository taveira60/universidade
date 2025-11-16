  library(modeldata)
library(dplyr)
library(rsample)   
library(glmnet)    
library(Metrics)

head(ames)
View(ames)
dim(ames)

## Exercício 1 — Ridge vs OLS (Ames)

#1. Converta inteiros em numéricos e defina `Sale_Price <- log10(Sale_Price)`.
#2. Faça *split* treino/teste (80/20).
#3. **OLS**: ajuste `lm(...)`, preveja em teste, calcule RMSE e R².
#4. **Ridge** (`alpha=0`): ajuste `cv.glmnet(..., nfolds=10)`, preveja em teste com `lambda.min` e compare com OLS.
#5. **Interpretação:** explique o **compromisso viés–variância** e por que motivo o ridge pode melhorar o RMSE em presença de colinearidade/alta dimensão.

#1

num_vars<- names(ames)[sapply(ames,is.numeric)]
num_vars<- setdiff(num_vars,"Sale_Price")
dat <- ames[,c("Sale_Price",num_vars)]

dat<-dat %>% mutate(across(where(is.integer),as.numeric))
str(dat)

dat<- dat%>% mutate(Sale_Price=log10(Sale_Price))

#2

split<-initial_split(dat,prop = 0.8)
train<- training(split)
test<- testing(split)
train
test

dim(train)
dim(test)

#3
modelo_osl<-lm(Sale_Price~.,data=train)

pred_osl<-predict(modelo_osl,newdata=test)

y_teste_reais<-test$Sale_Price

rmse_osl<-rmse(y_teste_reais,pred_osl)
rsq_osl<-cor(y_teste_reais,pred_osl)^2


rmse_osl
rsq_osl

#4

X_train<-model.matrix(Sale_Price~.,data=train)[,-1]
y_train<-train$Sale_Price

X_test<-model.matrix(Sale_Price~.,data=test)[,-1]
y_test<-test$Sale_Price

modelo_ridge_cv <- cv.glmnet(
  x=X_train,
  y=y_train,
  alpha=0,
  nfolds = 10
)

pred_ridge<-predict(modelo_ridge_cv,s="lambda.min",newx=X_test)

rsme_ridge<-Metrics::rmse(actual = y_test,predicted = pred_ridge)
rsq_ridge<- cor(y_test,pred_ridge)^2

rsme_ridge
rsq_ridge

#5
#como o osl sofre de overlifting , o ridge teve melhor desempenho ainda assim nao e uma diferença tao grande dos resultados

## Exercício 2 — Lasso (parcimónia e seleção)

#1. Ajuste **lasso** (`alpha=1`) com `cv.glmnet`.
#2. Reporte `lambda.min` e `lambda.1se`.
#3. Liste as variáveis com **coeficientes ≠ 0** em `lambda.1se`.
#4. Compare RMSE de teste entre `lambda.min` e `lambda.1se`.
#5. **Interpretação:** discuta sinais esperados dos coeficientes e o **trade-off** parcimónia vs desempenho.

#1
modelo_lasso_cv <- cv.glmnet(
  x=X_train,
  y=y_train,
  alpha=1,
  nfolds = 10
)

#2
modelo_lasso_cv$lambda.min
modelo_lasso_cv$lambda.1se

#3
coefs_1se<-coef(modelo_lasso_cv,s="lambda.1se")

coefs_df<-data.frame(
  var=rownames(coefs_1se),
  coefes=as.numeric(coefs_1se[,1])
)

variaveis_selecionadas<-coefs_df[coefs_df$coefs!=0,]

View(coefs_df)

#4

pred_lasso_min<-predict(
  modelo_lasso_cv,
  s="lambda.min",
  newx = X_test
)

rmse_lasso_min<-Metrics::rmse(actual=y_test,predicted=pred_lasso_min)

pred_lasso_1se<-predict(
  modelo_lasso_cv,
  s="lambda.1se",
  newx = X_test
)

rmse_lasso_1se<-Metrics::rmse(actual = y_test,predicted=pred_lasso_1se)

rmse_lasso_min
rmse_lasso_1se

#5
#Podemos concluir que o 1se e muit mais preciso que o min mas a direfença e tambem nas variaveis que cada um usa

## Exercício 3 — Predições para perfis

### 3.1 Predição para um perfil específico (único)

#Considere o seguinte **perfil de casa** (na escala original dos dados):
  
#- `Gr_Liv_Area = 1800`  
#- `Year_Built = 2005`  
#- `Garage_Area = 480`  
#- `Lot_Area = 9000`

#Para **todas as restantes variáveis numéricas**, utilize o **valor mediano do conjunto de treino**.

#**Tarefas:**
  
#(a) Obtenha a **predição pontual** de `log10(Sale_Price)` com o **melhor modelo** escolhido (Ridge ou Lasso).  
#(b) Converta a predição para a **escala original do preço**.  
#(c) Calcule **intervalos de previsão (95%)** por *bootstrap* simples (300 réplicas), mantendo o mesmo `λ` selecionado em CV.  
#(d) Apresente uma **tabela** com ponto e intervalo e comente a **ordem de grandeza** e a **incerteza**.

#a)
modelo_otimo<-modelo_ridge_cv

lambda_otimo<-modelo_otimo$lambda.min

medianas_X_train<-apply(X_train, 2, median)

perfil_novo<-medianas_X_train

perfil_novo["Gr_Liv_Area"]=1800
perfil_novo["Year_Built"]=2005
perfil_novo["Garage_Area"]=480
perfil_novo["Lot_Area"]=9000

perfil_X <- matrix(perfil_novo, nrow = 1, dimnames = list(NULL, names(perfil_novo)))

pred_log<-predict(modelo_otimo,s=lambda_otimo,newx=perfil_X)

pred_log

#b)
pred_preco<-10^pred_log

pred_preco

#c)
set.seed(123)
n_replicas<-300

preds_treino<-predict(modelo_otimo,s=lambda_otimo,newx=X_train)
residuos_treino<-y_train-preds_train

preds_boot_pi<-numeric(n_replicas)

??
