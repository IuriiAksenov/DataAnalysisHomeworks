// Iurii Aksenov Task 3 08.02.2020


// Task 1
use "D:\HSE\Data Analysis 2019 education year М 1 курс (code 117947)\Tasks\Task 3 08.02.2020\data_games.dta", clear

// Task 1.1
tab payment_type payment_method, expected chi2

graph bar, over(payment_method) over(payment_type)

// Task 2

// Task 2.1
twoway (scatter crystalls_balance_before_buy payment)

// Task 2.2
swilk payment
swilk crystalls_bought
swilk crystalls_balance_before_buy

spearman crystalls_balance_before_buy payment
spearman crystalls_balance_before_buy crystalls_bought
spearman crystalls_bought payment

// Task 3
use "D:\HSE\Data Analysis 2019 education year М 1 курс (code 117947)\Tasks\Task 3 08.02.2020\health_funding.dta", clear

swilk fundong
swilk disease
pwcorr funding disease

pcorr funding disease visits

// Task 4
// Task 4.1
sysuse auto.dta 

swilk length
ttest length, by (foreign)

// Task 4.2

use "D:\HSE\Data Analysis 2019 education year М 1 курс (code 117947)\Tasks\Task 3 08.02.2020\data_games.dta", clear
swilk payment
ranksum payment, by( payment_type )

// Task 4.3
oneway payment payment_method , scheffe

