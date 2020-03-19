// Iurii Aksenov 

use "D:\Downloads\Data_Analysis\6_29.02.2020\data_games.dta", clear

// Task 1 - 4
// Specify the regression equation. 
 xi:reg payment i.payment_method payment_type crystalls_balance_before_buy crystalls_bought
 
// Regression with standardized coefficient
 xi:reg payment i.payment_method payment_type crystalls_balance_before_buy crystalls_bought, beta
 
// Task 5-7
// Create residuals 
 predict r, rstandard
// Check whether the residuls normal standardized
 
 swilk r
 // visualisin the residulas
 kdensity r, normal

 
 // Task 6

 sort r

 //calculate the frequences of residuals where r >3 |  r<-3
 tabulate r if r >3 |  r<-3
 
 // Calculate influential cases
 dfbeta
 
 sort _dfbeta_1
 sort _dfbeta_2

	  
// Task 7
// Multicollearity
estat vif
  
// Heteroscedasticity
estat hettest

// Visualization 
rvfplot
