
// Task 1
use "D:\HSE\Data Analysis 2019 education year М 1 курс (code 117947)\Tasks\Task 4 15.02.2020\Worldbank_data.dta", clear

egen z_internet = std(internet)
egen z_secure = std(secure)
egen z_export = std(export)
egen z_import = std(import)

// Task 1.a
cluster wardslinkage z_internet z_secure z_export z_import , measure(L2) name(myclust)
cluster stop myclust,  rule(calinski)

// Task 1.a and b
cluster dendrogram myclust, vertical cutvalue(1)
cluster generate clustdes = groups (6), name (myclust) 

// Task 1.d and c Analyze clusters
tab clustdes
tabstat internet secure export import, by(clustdes)

gsort clustdes
by clustdes, sort : list country_code, nocompress noobs clean noheader


save "D:\HSE\Data Analysis 2019 education year М 1 курс (code 117947)\Homeworks\HW4\Worldbank_modified.dta"

// Task 2
use "D:\HSE\Data Analysis 2019 education year М 1 курс (code 117947)\Tasks\Task 4 15.02.2020\video_games_sales.dta", clear

generate NA_Sales_Num = real(NA_Sales)
generate EU_Sales_Num = real( EU_Sales )
generate JP_Sales_Num = real( JP_Sales )
generate Other_Sales_Num = real( Other_Sales )

egen z_NA_Sales = std(NA_Sales_Num)
egen z_EU_Sales = std(EU_Sales_Num)
egen z_JP_Sales = std(JP_Sales_Num)
egen z_Other_Sales = std(Other_Sales_Num)


// Choose the k

cluster kmeans z_NA_Sales z_EU_Sales z_JP_Sales z_Other_Sales, k(6) measure(L2) start(krandom) name(myclust6)
cluster stop myclust6,  rule(calinski)

cluster kmeans z_NA_Sales z_EU_Sales z_JP_Sales z_Other_Sales, k(7) measure(L2) start(krandom) name(myclust7)
cluster stop myclust7,  rule(calinski)

cluster kmeans z_NA_Sales z_EU_Sales z_JP_Sales z_Other_Sales, k(8) measure(L2) start(krandom) name(myclust8)
cluster stop myclust8,  rule(calinski)

cluster kmeans z_NA_Sales z_EU_Sales z_JP_Sales z_Other_Sales, k(9) measure(L2) start(krandom) name(myclust9)
cluster stop myclust9,  rule(calinski)

// 

cluster kmeans NA_Sales_Num EU_Sales_Num JP_Sales_Num Other_Sales_Num, k(5) measure(L2) start(krandom) name(myclust5_1)
cluster stop myclust5_1,  rule(calinski)

cluster kmeans NA_Sales_Num EU_Sales_Num JP_Sales_Num Other_Sales_Num, k(6) measure(L2) start(krandom) name(myclust6_1)
cluster stop myclust6_1,  rule(calinski)

cluster kmeans NA_Sales_Num EU_Sales_Num JP_Sales_Num Other_Sales_Num, k(7) measure(L2) start(krandom) name(myclust7_1)
cluster stop myclust7_1,  rule(calinski)

cluster kmeans NA_Sales_Num EU_Sales_Num JP_Sales_Num Other_Sales_Num, k(8) measure(L2) start(krandom) name(myclust8_1)
cluster stop myclust8_1,  rule(calinski)

cluster kmeans NA_Sales_Num EU_Sales_Num JP_Sales_Num Other_Sales_Num, k(9) measure(L2) start(krandom) name(myclust9_1)
cluster stop myclust9_1,  rule(calinski)

// Analyze the clusters
tab myclust6_1
tabstat NA_Sales_Num EU_Sales_Num JP_Sales_Num Other_Sales_Num, by(myclust6_1)
tabstat NA_Sales_Num EU_Sales_Num JP_Sales_Num Other_Sales_Num, by(myclust6_1)

