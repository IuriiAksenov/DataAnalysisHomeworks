// Student’s Name and Surname Iurii Aksenov

// ==================================
// Task to do together

use "D:\Downloads\Data_Analysis\25.01.2020\data_games.dta", clear
// Task 1
tab payment_method

// Task 2
egen mode  = mode(crystalls_bought)
tab mode
tabstat crystalls_bought, stats(median mean range sd semean iqr p90 p10 sk k)

histogram crystalls_bought, bin(20) frequency normal (bin=20, start=0, width=84.75)
 
 // Task 3
 sum payment, detail

// ==================================
 
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

 //Task 4 a
 label list
 
 //Task 4 b
 tab occupation, missing // for What in the percent of Professional/technical out of all the research participants
 
 tab occupation // for What in the percent of Professional/technical out of the research participants that gave valid information about their occupation
 
 //Task 4 c
egen mode  = mode(age)
tab mode
 
tabstat age, stats(median mean range sd semean iqr p90 p10 sk k)

histogram age, bin(20) frequency normal
(bin=20, start=34, width=.6)

//Task 4 d

tabstat age, stats(mean), if married==0 // single

tabstat age, stats(mean), if married==1 // married (not single)

//Task e

tabstat age, stats(max), if married==0 & tenure>50

//Task f
 tabstat age, stats(N), if married==1 & collgrad==1 // college graduates are marries 
 
 tabstat age, stats(N) // all people

//Task g

//not marries
tabstat age, stats(N mean sd), if married==0

//not college graduates
tabstat age, stats(N mean sd), if collgrad==0

//not members of the union
tabstat age, stats(N mean sd), if union==0

//not marries, not college graduates, not members of the union
tabstat age, stats(N mean sd), if union==0 & collgrad==0 & married==0
