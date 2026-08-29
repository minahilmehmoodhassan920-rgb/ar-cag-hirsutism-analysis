# ==============================================================================
# Complete R Script: AR CAG Repeat Length vs. Hirsutism Score Analysis
# ==============================================================================

# 1. Load Required Libraries
if (!requireNamespace("readxl", quietly = TRUE)) install.packages("readxl")
if (!requireNamespace("boot", quietly = TRUE)) install.packages("boot")

library(readxl)
library(boot)

# 2. Set Working Directory & Load Data
setwd("C:/Users/zafar/Downloads/CAG (1)/CAG")
data <- read_excel("Data for statistics- English masked.xlsx")

# 3. Clean & Subset Complete Cases
# Select complete pairs of calculated AR CAG repeats (CALCUL) and Hirsutism Score (AVGH)
analysis_data <- data[complete.cases(data$CALCUL, data$AVGH), ]

# Inspect data dimensions and variable summaries
cat("Number of complete cases:", nrow(analysis_data), "

")
cat("Summary of CALCUL (AR CAG Repeat Measurement):
")
print(summary(analysis_data$CALCUL))
cat("
Summary of AVGH (Average Hirsutism Score):
")
print(summary(analysis_data$AVGH))

# 4. Exploratory Data Visualization
plot(
  analysis_data$CALCUL, analysis_data$AVGH,
  xlab = "AR CAG Repeat Measurement (CALCUL)",
  ylab = "Average Hirsutism Score (AVGH)",
  main = "AR CAG Repeats vs. Hirsutism Score",
  pch = 19, col = "steelblue"
)
abline(lm(AVGH ~ CALCUL, data = analysis_data), col = "darkred", lwd = 2)

# Histograms to assess distribution shapes
hist(analysis_data$CALCUL, main = "Histogram of CALCUL", xlab = "CAG Repeats", col = "lightblue")
hist(analysis_data$AVGH, main = "Histogram of AVGH", xlab = "Hirsutism Score", col = "lightgreen")

# 5. Statistical Hypothesis Testing
# Pearson Correlation
pearson_res <- cor.test(analysis_data$CALCUL, analysis_data$AVGH, use = "complete.obs")
cat("
--- Pearson Correlation ---
")
print(pearson_res)

# Spearman Rank Correlation
spearman_res <- cor.test(analysis_data$CALCUL, analysis_data$AVGH, method = "spearman", exact = FALSE)
cat("
--- Spearman Rank Correlation ---
")
print(spearman_res)

# Individual Allele Correlations with CALCUL
cat("
--- Correlation: CAGI vs CALCUL ---
")
print(cor.test(data$CAGI, data$CALCUL, method = "spearman", exact = FALSE))

cat("
--- Correlation: CAGII vs CALCUL ---
")
print(cor.test(data$CAGII, data$CALCUL, method = "spearman", exact = FALSE))

# 6. Non-Parametric Bootstrap Confidence Interval for Spearman's Rho
set.seed(123) # Ensures reproducibility

# Define correlation statistic function for boot()
spearman_boot_fn <- function(d, i) {
  cor(d$CALCUL[i], d$AVGH[i], method = "spearman")
}

# Run 2,000 bootstrap iterations
boot_result <- boot(
  data = analysis_data,
  statistic = spearman_boot_fn,
  R = 2000
)

# Output Percentile & BCa Confidence Intervals
cat("
--- Bootstrap Confidence Intervals (R = 2000) ---
")
print(boot_result)
boot_ci_perc <- boot.ci(boot_result, type = "perc")
boot_ci_bca  <- boot.ci(boot_result, type = "bca")

print(boot_ci_perc)
print(boot_ci_bca)
