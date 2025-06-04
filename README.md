# Mortality Prediction with Random Forest Models

This repository provides pre-trained Random Forest models for predicting:
- **In-hospital mortality** (`indeath`)
- **Six-month mortality** (`sixdeath`)

These models were trained on multiply imputed datasets using the `randomForestSRC` package in R.

---

## Usage

### 1. Requirements

Install the following R packages if not already available:

```r
install.packages(c("randomForestSRC"))
```

### 2. Load Models and New Data

```r
load("indeath_rf_models.rda")    # For in-hospital mortality
load("sixdeath_rf_models.rda")   # For six-month mortality
load("newdat.eg.RData")          # Your new dataset; should be a data.frame
```

### 3. Predict Mortality Probabilities

```r
library(randomForestSRC)

# Predict in-hospital mortality
inprob <- sapply(indeath_rf_models, function(m) predict(m, newdat.eg)$predicted)
mean(inprob)

# Predict six-month mortality
sixprob <- sapply(sixdeath_rf_models, function(m) predict(m, newdat.eg)$predicted)
mean(sixprob)
```

`mean(inprob)` and `mean(sixprob)` give you the average predicted probability across 5 models.

---

## Output

- Predicted probability of mortality for each patient
- Can be used for risk stratification or further analysis
