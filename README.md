# ar-cag-hirsutism-analysis
Statistical analysis of AR gene CAG-repeat length vs. hirsutism severity in women (R, Spearman correlation, bootstrap CI)
# ==============================================================================
# R Script: Analysis of AR CAG Repeat Measurement vs Hirsutism Severity
# ==============================================================================

# 1. Load Dataset & Prepare Complete Cases
raw_data <- read.csv("AR_CAG_Hirsutism_Analysis.csv")

# Complete-case selection for primary variables
analysis_data <- subset(raw_data, !is.na(CALCUL) & !is.na(AVGH))
n_obs <- nrow(analysis_data)
cat("Complete case sample size n =", n_obs, "\n")

# 2. Summary Statistics Function
get_summary <- function(x) {
  c(
    N = length(x),
    Mean = mean(x),
    SD = sd(x),
    Median = median(x),
    Q1 = quantile(x, 0.25),
    Q3 = quantile(x, 0.75),
    Min = min(x),
    Max = max(x)
  )
}

calcul_stats <- get_summary(analysis_data$CALCUL)
avgh_stats <- get_summary(analysis_data$AVGH)

print("CALCUL Summary:")
print(calcul_stats)
print("AVGH Summary:")
print(avgh_stats)

# 3. Graphical Distributions
# Figure 1: CALCUL Histogram
hist(analysis_data$CALCUL,
     main = "Distribution of AR CAG Repeat Measurement",
     xlab = "AR CAG Repeat Measurement (CALCUL)",
     ylab = "Frequency",
     col = "lightblue",
     border = "black")

# Figure 2: AVGH Histogram
hist(analysis_data$AVGH,
     main = "Distribution of Average Hirsutism Score",
     xlab = "Average Hirsutism Score (AVGH)",
     ylab = "Frequency",
     col = "lightgreen",
     border = "black")

# Outlier check for CALCUL
boxplot(analysis_data$CALCUL,
        main = "AR CAG Repeat Measurement",
        ylab = "CALCUL",
        col = "lightgray")

# 4. Figure 3: Scatterplot with Fitted Regression Line
plot(analysis_data$CALCUL, analysis_data$AVGH,
     xlab = "AR CAG Repeat Measurement",
     ylab = "Average Hirsutism Score",
     main = "AR CAG Repeats vs Hirsutism",
     pch = 19,
     col = "darkblue")

# Descriptive fitted line
fit_lm <- lm(AVGH ~ CALCUL, data = analysis_data)
abline(fit_lm, col = "red", lwd = 2)

# 5. Primary Statistical Analysis: Spearman Correlation
spearman_res <- cor.test(analysis_data$CALCUL, analysis_data$AVGH, method = "spearman")
print(spearman_res)

# Percentile Bootstrap for Spearman 95% CI
set.seed(123)
n_boot <- 2000
boot_rhos <- numeric(n_boot)

for(i in 1:n_boot) {
  boot_idx <- sample(1:n_obs, replace = TRUE)
  boot_rhos[i] <- cor(analysis_data$CALCUL[boot_idx], 
                      analysis_data$AVGH[boot_idx], 
                      method = "spearman")
}

boot_ci <- quantile(boot_rhos, probs = c(0.025, 0.975))
cat("95% Bootstrap CI for Spearman rho:", boot_ci[1], "to", boot_ci[2], "\n")

# 6. Supporting Analysis: Pearson Correlation
pearson_res <- cor.test(analysis_data$CALCUL, analysis_data$AVGH, method = "pearson")
print(pearson_res)
