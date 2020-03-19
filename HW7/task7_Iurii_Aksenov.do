// Iurii Aksenov Task 7

use "D:\Downloads\Data_Analysis\7_14.03.2020\WARRANTY.dta", clear

// Task 1) Specify the regression equation (the linear part of the formula). 
logit Bought i.Gender i.Gift Age i.Race Price100

// Task 2) Assess the goodness-of-fit of the model and interpret the results of the analysis.
estat gof

// Task 3 column 'Odds Ratio'  - Interpret the influence of any predictor variable on the dependent variable using Exp(b).
// Task 4 column 'P > |CH|'
logistic Bought i.Gender i.Gift Age i.Race Price100

// Task 5 What is the percentage of correctly predicted cases by the model?
estat classification

// Task 6 - Do the diagnostics of the model. 

// Task 6.1 - Are the residuals normally distributed? 

// Create residuals 
predict r, rstandard
// Check whether the residuls normal standardized
 
swilk r
// visualisin the residulas
kdensity r, normal
 
// Task 6.2 - - Are there any outliers? If yes, how many? 
 
sort r

//calculate the frequences of residuals where r >3 |  r<-3
tabulate r if r >3 |  r<-3

// Task 6.3 - - Test the multicollinearity.

tabulate Race, generate(Race_dummy)

corr Bought Gender Gift Age Race_dummy1 Race_dummy2 Race_dummy3 Race_dummy4 Price100
