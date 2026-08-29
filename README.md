> setwd("C:/Users/zafar/Downloads/CAG")
Error in setwd("C:/Users/zafar/Downloads/CAG") : 
  cannot change working directory
> setwd("C:/Users/zafar/Downloads/CAG (1)")
> setwd()
Error in setwd() : argument "dir" is missing, with no default
> setwd("C:/Users/zafar/Downloads/CAG (1)")
> getwd()
[1] "C:/Users/zafar/Downloads/CAG (1)"
> list.files()
[1] "CAG"
> list.files()
[1] "CAG"
> setwd("C:/Users/zafar/Downloads/CAG (1)/CAG")
> getwd()
[1] "C:/Users/zafar/Downloads/CAG (1)/CAG"
> list.files()
 [1] "~$Data for statistics- English masked.xlsx"                                  
 [2] "ANCOVA by ATHG.TXT"                                                          
 [3] "ANOVA by ATHG (1,2,3) (2).TXT"                                               
 [4] "ANOVA by ATHG (1,2,3).TXT"                                                   
 [5] "ANOVA by ATHG (1,2+3) (2).TXT"                                               
 [6] "ANOVA by ATHG (1,2+3).TXT"                                                   
 [7] "ANOVA by ATHG (1.).TXT"                                                      
 [8] "ANOVA by AVGH (0.67.).TXT"                                                   
 [9] "ANOVA by AVGH(0.).TXT"                                                       
[10] "ANOVA by HIAC.TXT"                                                           
[11] "Chi-square ATHG by AVGH (0.).TXT"                                            
[12] "Chi-square ATHG(1.) by CHES (0,1.).TXT"                                      
[13] "Chi-square by ATHG (1,2,3).TXT"                                              
[14] "Chi-square by ATHG (1,2+3).TXT"                                              
[15] "Chi-square by ATHG (1.).TXT"                                                 
[16] "Chi-square by AVGH (0.).TXT"                                                 
[17] "Chi-square by AVGH (0.67.).TXT"                                              
[18] "Data for statistics- English masked.xlsx"                                    
[19] "Detailed Data Descriptions.TXT"                                              
[20] "Logistic Regression Dependent is ATHG(1.).TXT"                               
[21] "Logistic Regression Dependent is AVGH(0.67.).TXT"                            
[22] "New Logistic Regression (reversed) Dependent is AVGH(0.) excl CALCUL.TXT"    
[23] "New Logistic Regression (reversed) Dependent is AVGH(0.) excl CALCUL+TES.TXT"
[24] "New Logistic Regression (reversed) Dependent is AVGH(0.).TXT"                
[25] "New Logistic Regression Dependent is AVGH(0.).TXT"                           
[26] "Pearson correlations (2).TXT"                                                
[27] "Pearson correlations (3).TXT"                                                
[28] "Pearson correlations.TXT"                                                    
[29] "Simple Data Descriptions.TXT"                                                
[30] "Spearman Correlations(2).TXT"                                                
[31] "Spearman Correlations(3).TXT"                                                
[32] "Spearman Correlations.TXT"                                                   
> install.packages("readxl")
Installing package into ‘C:/Users/zafar/AppData/Local/R/win-library/4.6’
(as ‘lib’ is unspecified)
--- Please select a CRAN mirror for use in this session ---
trying URL 'https://cloud.r-project.org/bin/windows/contrib/4.6/readxl_1.5.0.zip'
Content type 'application/zip' length 1230523 bytes (1.2 MB)
downloaded 1.2 MB

package ‘readxl’ successfully unpacked and MD5 sums checked

The downloaded binary packages are in
        C:\Users\zafar\AppData\Local\Temp\RtmpOEhnOe\downloaded_packages
> library(readxl)
> data <- read_excel("Data for statistics- English masked.xlsx")

-
/
                                                                                                                                                                                          

/
                                                                                                                                                                                          

-
                                                                                                                                                                                          
> View(data)
> data[, c("CALCUL", "AVGH")]
# A tibble: 109 × 2
   CALCUL  AVGH
    <dbl> <dbl>
 1   12.8  3   
 2   19    3   
 3   23    2.67
 4   20.7  2.67
 5   22.1  2.33
 6   17.6  2.33
 7   21.3  2.33
 8   18.1  2   
 9   20.1  2   
10   21.2  2   
# ℹ 99 more rows
# ℹ Use `print(n = ...)` to see more rows
> nrow(data)
[1] 109
> summary(data$CALCUL)
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max.     NAs 
  12.56   20.36   21.50   21.58   23.12   27.00       3 
> summary(data$AVGH)
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
 0.0000  0.0000  0.6667  0.7645  1.3333  3.0000 
> cor.test(data$CALCUL, data$AVGH, use = "complete.obs")

        Pearson's product-moment correlation

data:  data$CALCUL and data$AVGH
t = -3.2747, df = 104, p-value = 0.001437
alternative hypothesis: true correlation is not equal to 0
95 percent confidence interval:
 -0.4691283 -0.1220979
sample estimates:
       cor 
-0.3057326 

> plot(data$CALCUL, data$AVGH)
> plot(data$CALCUL, data$AVGH,
+      xlab = "AR CAG Repeat Measurement",
+      ylab = "Average Hirsutism Score",
+      main = "AR CAG Repeats vs Hirsutism")
> 
> abline(lm(AVGH ~ CALCUL, data = data))
> abline(lm(AVGH ~ CALCUL, data = data))
> sum(complete.cases(data$CALCUL, data$AVGH))
[1] 106
> class(data$CALCUL)
[1] "numeric"
> class(data$AVGH)
[1] "numeric"
> sort(unique(data$AVGH))
 [1] 0.0000000 0.3333333 0.6666667 1.0000000 1.3333333 1.6666667 2.0000000 2.3333333 2.6666667 3.0000000
> sort(unique(data$CALCUL))
 [1] 12.56 12.77 16.81 17.00 17.62 18.12 18.33 18.38 18.50 18.63 19.00 19.08 19.20 19.40 19.46 19.53 19.80 19.98 20.00 20.03 20.05 20.14 20.16 20.35 20.38 20.46 20.50 20.54 20.60 20.68
[31] 20.74 20.75 20.92 20.95 21.00 21.14 21.17 21.20 21.24 21.30 21.38 21.40 21.44 21.48 21.51 21.54 21.58 21.68 21.69 21.84 21.92 22.00 22.05 22.06 22.16 22.22 22.24 22.24 22.32 22.43
[61] 22.45 22.46 22.47 22.56 22.56 22.90 23.00 23.16 23.30 23.41 23.48 23.64 23.68 23.70 23.86 23.87 23.93 24.12 24.20 24.32 24.39 24.42 24.48 24.50 24.84 25.18 25.42 25.46 25.48 25.54
[91] 25.67 26.64 27.00
> hist(data$CALCUL)
> windows()
> hist(data$CALCUL)
> hist(data$AVGH)
> cor.test(data$CALCUL, data$AVGH, method = "spearman", exact = FALSE)

        Spearman's rank correlation rho

data:  data$CALCUL and data$AVGH
S = 246961, p-value = 0.01163
alternative hypothesis: true rho is not equal to 0
sample estimates:
       rho 
-0.2442326 

> names(data)
 [1] "N"       "age"     "ATHg"    "HT"      "WT"      "BMI"     "CHIN"    "CHES"    "ABDO"    "AVGH"    "TES"     "Allele1" "CAGI"    "Allele2" "CAGII"   "CALCUL" 
> table(data$ATHg)

 1  2  3 
49 27 32 
> unique(data$ATHg)
[1]  2  3  1 NA
> analysis_data <- data[complete.cases(data$CALCUL, data$AVGH), ]
> nrow(analysis_data)
[1] 106
> plot(analysis_data$CALCUL, analysis_data$AVGH,
+      xlab = "AR CAG Repeat Measurement",
+      ylab = "Average Hirsutism Score",
+      main = "AR CAG Repeats vs Hirsutism")
> abline(lm(AVGH ~ CALCUL, data = analysis_data))
> summary(analysis_data$CALCUL)
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  12.56   20.36   21.50   21.58   23.12   27.00 
> summary(analysis_data$AVGH)
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
 0.0000  0.0000  0.5000  0.7516  1.3333  3.0000 
> cor.test(analysis_data$CALCUL, analysis_data$AVGH,
+          method = "spearman", exact = FALSE)

        Spearman's rank correlation rho

data:  analysis_data$CALCUL and analysis_data$AVGH
S = 246961, p-value = 0.01163
alternative hypothesis: true rho is not equal to 0
sample estimates:
       rho 
-0.2442326 

> head(data[, c("CAGI", "CAGII", "CALCUL")])
# A tibble: 6 × 3
   CAGI CAGII CALCUL
  <dbl> <dbl>  <dbl>
1    12    23   12.8
2    19    19   19  
3    23    23   23  
4    22    19   20.7
5    22    23   22.1
6    19    13   17.6
> (data$CAGI + data$CAGII) / 2
  [1] 17.5 19.0 23.0 20.5 22.5 16.0 21.5 19.5 20.0 21.5   NA 23.0 22.5 21.0 22.0 22.0   NA 25.0 24.5 26.0 20.0 20.0 19.0 24.5 20.5 17.0 22.0 20.0 22.0 21.0 22.0 23.0 22.5 21.5 19.5 20.5
 [37] 25.5 22.5 20.5 24.0 19.5 20.0 22.5 21.0 24.5 22.0 24.0 22.5 22.5 23.0 24.0 24.0 23.0 21.0 21.5 27.0 20.0 24.0 22.5 18.5 20.5 25.0 25.0 24.5 21.0 19.5 23.0 22.5 22.0 22.0 21.0 18.5
 [73] 19.5 22.0 25.0 24.5 23.0 20.5 21.0 20.0 25.0 24.5 22.5 18.5 21.0 26.0 19.5 21.0 21.5 26.5 24.5 24.0 24.0 20.5 20.0 22.0 22.5 22.0 27.0 23.5 23.0 17.5 22.0 25.0   NA 23.5 19.5 19.5
[109] 22.5
> head(data[, c("CAGI", "CAGII", "CALCUL")], 10)
# A tibble: 10 × 3
    CAGI CAGII CALCUL
   <dbl> <dbl>  <dbl>
 1    12    23   12.8
 2    19    19   19  
 3    23    23   23  
 4    22    19   20.7
 5    22    23   22.1
 6    19    13   17.6
 7    19    24   21.3
 8    18    21   18.1
 9    21    19   20.1
10    20    23   21.2
> data.frame(
+   CAGI = data$CAGI,
+   CAGII = data$CAGII,
+   CALCUL = data$CALCUL,
+   difference = data$CALCUL - (data$CAGI + data$CAGII)/2
+ )[1:10, ]
   CAGI CAGII CALCUL difference
1    12    23  12.77      -4.73
2    19    19  19.00       0.00
3    23    23  23.00       0.00
4    22    19  20.68       0.18
5    22    23  22.06      -0.44
6    19    13  17.62       1.62
7    19    24  21.30      -0.20
8    18    21  18.12      -1.38
9    21    19  20.14       0.14
10   20    23  21.17      -0.33
> summary(data$CAGI)
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max.     NAs 
  11.00   19.00   21.00   21.06   23.00   28.00       3 
> summary(data$CAGII)
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max.     NAs 
  13.00   21.00   23.00   22.91   25.00   31.00       3 
> cor.test(data$CAGI, data$CALCUL, method = "spearman", exact = FALSE)

        Spearman's rank correlation rho

data:  data$CAGI and data$CALCUL
S = 35915, p-value < 2.2e-16
alternative hypothesis: true rho is not equal to 0
sample estimates:
      rho 
0.8190561 

> cor.test(data$CAGII, data$CALCUL, method = "spearman", exact = FALSE)

        Spearman's rank correlation rho

data:  data$CAGII and data$CALCUL
S = 85568, p-value = 1.987e-10
alternative hypothesis: true rho is not equal to 0
sample estimates:
      rho 
0.5688966 

> attributes(data$CALCUL)
NULL
> install.packages("boot")
Installing package into ‘C:/Users/zafar/AppData/Local/R/win-library/4.6’
(as ‘lib’ is unspecified)
trying URL 'https://cloud.r-project.org/bin/windows/contrib/4.6/boot_1.3-32.zip'
Content type 'application/zip' length 661995 bytes (646 KB)
downloaded 646 KB

package ‘boot’ successfully unpacked and MD5 sums checked

The downloaded binary packages are in
        C:\Users\zafar\AppData\Local\Temp\RtmpOEhnOe\downloaded_packages
> library(boot)
> set.seed(123)
> boot_result <- boot(
+   analysis_data,
+   function(d, i) cor(d$CALCUL[i], d$AVGH[i], method = "spearman"),
+   R = 2000
+ )
> boot.ci(boot_result, type = "perc")
BOOTSTRAP CONFIDENCE INTERVAL CALCULATIONS
Based on 2000 bootstrap replicates

CALL : 
boot.ci(boot.out = boot_result, type = "perc")

Intervals : 
Level     Percentile     
95%   (-0.4208, -0.0581 )  
Calculations and Intervals on Original Scale
> boxplot(analysis_data$CALCUL,
+         main = "AR CAG Repeat Measurement",
+         ylab = "CALCUL")
> prop.table(table(data$ATHg)) * 100

       1        2        3 
45.37037 25.00000 29.62963 
> prop.table(table(data$ATHg)) * 100

       1        2        3 
45.37037 25.00000 29.62963 
> write.csv(analysis_data, "AR_CAG_Hirsutism_Analysis.csv", row.names = FALSE)
> c(
+   N = nrow(analysis_data),
+   CALCUL_mean = mean(analysis_data$CALCUL),
+   CALCUL_SD = sd(analysis_data$CALCUL),
+   AVGH_mean = mean(analysis_data$AVGH),
+   AVGH_SD = sd(analysis_data$AVGH)
+ )
          N CALCUL_mean   CALCUL_SD   AVGH_mean     AVGH_SD 
106.0000000  21.5783019   2.4296186   0.7515723   0.7995519 
> 
