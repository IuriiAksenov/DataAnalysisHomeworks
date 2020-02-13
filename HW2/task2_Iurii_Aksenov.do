// Iurii Aksenov Task 2 01.02.2020

// Task 1

use "D:\HSE\Data Analysis 2019 education year М 1 курс (code 117947)\Homeworks\HW2\salary.dta", clear

// Task 1.1

generate posnum = .

replace posnum = 1 if position=="assistant"
replace posnum = 2 if position=="lecturer"
replace posnum = 3 if position=="docent"
replace posnum = 4 if position=="professor"

//Task 1.2
 generate double income_taxes = .
 
 replace income_taxes = salary/69.98*0.3 if foreigner==1
 
 replace income_taxes = salary/69.98*0.13 if foreigner==0
 
//Task 1.3

 egen salary_rank = rank(salary), field
 
//Task 1.4
 gsort -salary

//Task 1.5
 save "D:\HSE\Data Analysis 2019 education year М 1 курс (code 117947)\Homeworks\HW2\salary.dta", replace

//Task 2
use "D:\HSE\Data Analysis 2019 education year М 1 курс (code 117947)\Homeworks\HW2\data_games.dta", clear

//Tas 2.1
drop if payment<100 | payment>14000

//Task 2.2
recode payment  (100/500=1) (501/1000=2) (1001/2000=3) (2001/max=4), gen(payment_group)

egen mode = mode(payment_group)
tab mode

//Task 3
use "D:\HSE\Data Analysis 2019 education year М 1 курс (code 117947)\Homeworks\HW2\revenue.dta", clear

collapse (mean) rev, by(year company)

save "D:\HSE\Data Analysis 2019 education year М 1 курс (code 117947)\Homeworks\HW2\revenue_modified.dta"


//Task 4

use "D:\HSE\Data Analysis 2019 education year М 1 курс (code 117947)\Homeworks\HW2\data_games.dta", clear

tab payment_method country

//Task 4.4


graph bar (count) if country=="US" | country=="CA" | country=="FR" | country=="GE" | country=="GB" | country=="IT", over(country) over(payment_method) blabel(bar)
