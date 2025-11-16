library(ISLR2)
pkgs <- c("glmnet","tidyverse","broom")
new <- setdiff(pkgs, rownames(installed.packages()))
if(length(new)) install.packages(new)
library(glmnet); library(tidyverse); library(broom)
head(College)

#a)e b)
set.seed(1)
idx <- sample(seq_len(nrow(College)), size = round(0.75*nrow(College)))

treino<-College[idx,]
teste<-College[-idx,]

dim(treino)
dim(teste)

modelo<-lm(Apps ~.,data=treino)
summary(modelo)

pre_ols<-predict(modelo,teste)
pre_ols

rmse <- function(a,b) sqrt(mean((a-b)^2))
rmse(pre_ols,teste$Apps)


#c)d)g)
X <- model.matrix(Apps ~ ., data = College)[, -1]
y <- College$Apps


Xtr <- X[idx,]; ytr <- y[idx]
Xte <- X[-idx,]; yte <- y[-idx]
cv_ridge2 <- cv.glmnet(Xtr, ytr, alpha = 0)
cv_lasso2 <- cv.glmnet(Xtr, ytr, alpha = 1)
pr_ridge <- predict(cv_ridge2, newx = Xte, s = "lambda.min")
pr_lasso <- predict(cv_lasso2, newx = Xte, s = "lambda.min")

rmse(pr_ridge,teste$Apps)
rmse(pr_lasso,teste$Apps)

