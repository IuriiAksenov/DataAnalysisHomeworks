// Task to do together

use "D:\Downloads\Data_Analysis\25.01.2020\data_games.dta", clear
// Task 1
tab payment_method

// Task 2
egen mode  = mode( crystalls_bought)
tab mode
tabstat crystalls_bought, stats(median mean range sd semean iqr iqr  p90 p10)

histogram crystalls_bought, bin(20) frequency normal (bin=20, start=0, width=84.75)
 
 // Task 3
 sum payment, detail

 // Task to do individually
sysuse bpwide.dta
 
 // Task 1
 generate int age = .
 label variable age "Age in years"

 //Task 2
 rename q1 gender

 // Task 3
 
 label variable age "Age in years"
 
 //Task 4
 sysuse nlsw88.dta
