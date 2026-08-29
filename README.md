# ar-cag-hirsutism-analysis

Statistical analysis of AR gene CAG-repeat length vs. hirsutism severity in women (R, Spearman correlation, bootstrap CI)

## Overview
This project investigates whether AR CAG repeat measurement (CALCUL) is associated 
with hirsutism severity (AVGH) in a clinical dataset of 106 women. Using R, I applied 
Spearman's rank correlation as the primary test (given non-normal distributions), 
backed by a 2,000-replicate bootstrap for the 95% CI, with Pearson's correlation as 
a supporting check.

## Key Finding
A statistically significant negative association was found:
- Spearman's ρ = -0.244, p = 0.0116
- 95% bootstrap CI: -0.421 to -0.058
- Supporting Pearson r = -0.306, p = 0.0014

Higher CAG repeat counts were modestly associated with lower hirsutism scores, 
though the effect size is small and the study is observational.

## Contents
- `analysis.R` — full R script (data cleaning, descriptive stats, correlation tests, bootstrap, plots)
- `report.docx` — full written report with methods, results, and limitations
- `figure1_calcul_histogram.png`, `figure2_avgh_histogram.png`, `figure3_scatterplot.png` — key visualizations

## Methods
Complete-case analysis (n = 106 of 109). Non-parametric Spearman correlation as 
primary test due to skewed distributions in both variables; percentile bootstrap 
(2,000 resamples) for interval estimation; Pearson correlation as a parametric check.

## Limitations
Observational, cross-sectional design; no adjustment for confounders (age, BMI, 
testosterone); modest effect size (R² ≈ 0.09); single-cohort dataset. See full 
report for details.
