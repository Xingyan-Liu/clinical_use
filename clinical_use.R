load("indeath_rf_models.rda")
load("sixdeath_rf_models.rda")
load("newdat.eg.RData")
library(randomForestSRC)

# Example code to predict in-hospital mortality
inprob = numeric(5)
for (i in 1:5){
  inprob[i] = predict(indeath_rf_models[[i]], newdat.eg)$predicted
}
mean(inprob) 

# Example code to predict six-month mortality
sixprob = numeric(5)
for (i in 1:5){
  sixprob[i] = predict(sixdeath_rf_models[[i]], newdat.eg)$predicted
}
mean(sixprob) 