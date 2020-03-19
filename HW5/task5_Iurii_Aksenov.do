// Iurii Akenov

use "D:\Downloads\Data_Analysis\5_22.02.2020\TOSSE-R.dta", clear
// Task 1

estat kmo, novar

// Task 2 - 5
factor  q1 q2 q3 q4 q5 q6 q7 q8 q9 q10 q11 q12 q13 q14 q15 q16 q17 q18 q19 q20 q21 q22 q23 q24 q25 q26 q27 q28, pcf
rotate, blanks(.3)

// Task 6
predict factor1 factor2 factor3 factor4 factor5
 recode factor1 factor2 factor3 factor4 factor5 (min/-3 = 1) (-3/-2 = 2) (-2/-1 = 3) (-1/0 = 4) (0/1 = 5) (1/2 = 6) (2/max = 7), gen(factor1_num factor2_num factor3_num factor4_num factor5_num)
