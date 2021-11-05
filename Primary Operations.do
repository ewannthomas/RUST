



*Spliting Strings with Multiple codes in B
use "E:\RUST\Section B.dta", clear
split Group_Act, parse(" ") gen(temp)

*Spliting Strings with Multiple codes in D
use "E:\RUST\Section D.dta", clear
split Wat_pur_process, parse(" ") gen(temp)
encode temp1, gen( Wat_pur_process_1 )
encode temp2, gen( Wat_pur_process_2 )
encode temp3, gen( Wat_pur_process_3 )
encode temp4, gen( Wat_pur_process_4 )

label variable Wat_pur_process_1 "Water Purification Process"
label variable Wat_pur_process_2 "Water Purification Process"
label variable Wat_pur_process_3 "Water Purification Process"
label variable Wat_pur_process_4 "Water Purification Process"

label define Wat_pur_process 1 "boil" 2 "use alum" 3 "add bleach/chlorine tablets"	4 "strain through a cloth" 5 "use water filter"	6 "use electric purifier" 7 "let it stand and settle"
label values Wat_pur_process_1 Wat_pur_process_2 Wat_pur_process_3 Wat_pur_process_4 Wat_pur_process



*Spliting Strings with Multiple codes in E1
use "E:\RUST\Section E1.dta", clear
split Reason_NO_inHH, parse(" ") gen(temp)
encode temp1, gen( Reason_NO_inHH_1 )
encode temp2, gen( Reason_NO_inHH_2 )
encode temp3, gen( Reason_NO_inHH_3 )
encode temp4, gen( Reason_NO_inHH_4 )
encode temp5, gen( Reason_NO_inHH_5 )

label define Reason_NO_inHH	1 "Lack of income" 2 "Lack of access to finance" 3 "Lack of space at home" 4 "Lack of permanent residence" 5 "Prefer to go to community/ public toilets" 6 "Prefer to go for open defecation" ///
7 "Lack of recognition from the government"	99 "Other"
label values Reason_NO_inHH_1 Reason_NO_inHH_2 Reason_NO_inHH_3 Reason_NO_inHH_4 Reason_NO_inHH_5 Reason_NO_inHH


split Probs_defec_facility, parse(" ") gen(temp)
encode temp1, gen( Probs_defec_facility_1 )
encode temp2, gen( Probs_defec_facility_2 )
encode temp3, gen( Probs_defec_facility_3 )
encode temp4, gen( Probs_defec_facility_4 )
encode temp5, gen( Probs_defec_facility_5 )
encode temp6, gen( Probs_defec_facility_6 )
encode temp7, gen( Probs_defec_facility_7 )
encode temp8, gen( Probs_defec_facility_8 )
encode temp9, gen( Probs_defec_facility_9 )
encode temp10, gen( Probs_defec_facility_10)
encode temp11, gen( Probs_defec_facility_11)

label define Probs_defec_facility 0 "No specific problem" 1 "Lack of Hygiene" 2 "Water not available for self-cleaning" 3 "Flies/ Mosquitoes" 4 "Structure does not ensure privacy" 5 "Unsafe"  6 "Flooding in rainy seasons" ///
7 "Pit filled up" 8 "Difficulties for younger children to use" 9 "Difficulties for women to use during menstrual periods" 10 "Difficulties for women to use during pregnancy" 11 "Difficulties for elder people to use"
label values Probs_defec_facility_1 Probs_defec_facility_2 Probs_defec_facility_3 Probs_defec_facility_4 Probs_defec_facility_5 Probs_defec_facility_6 Probs_defec_facility_7 Probs_defec_facility_8 Probs_defec_facility_9 Probs_defec_facility_10 Probs_defec_facility_11 Probs_defec_facility 


*Spliting Strings with Multiple codes in E3
use "E:\RUST\Section E3.dta", clear
split Dispo_difficult_period, parse(" ") gen(temp)
encode temp1, gen( Dispo_difficult_period_1 )
encode temp2, gen( Dispo_difficult_period_2 )
encode temp3, gen( Dispo_difficult_period_3 )
encode temp4, gen( Dispo_difficult_period_4 )
encode temp5, gen( Dispo_difficult_period_5 )

label define Dispo_difficult_period 0 "no specific period" 1 "May-Sept (Summer, Moonsoon)" 2 "Oct-November (Autumn)" 3 "Jan-Feb (Winter)" 4 "March-April (Spring)"
label values Dispo_difficult_period_1 Dispo_difficult_period


*Spliting Strings with Multiple codes in E5
  split Reason_diff_toilet, parse (" ") gen( Reason_diff_toilet )
  foreach var in Reason_diff_toilet1 Reason_diff_toilet2 Reason_diff_toilet3 Reason_diff_toilet4 Reason_diff_toilet5 {
  encode `var', gen (`var'_1)
  }


  label define Reason_diff_toilet 1 "social pressure" 2 "For more privacy" 3 "Easier water access" 4 "Comfort" 5 "Hygiene" 6 "Soap access" 99 "Other reason"
  label values Reason_diff_toilet1_1- Reason_diff_toilet5_1 Reason_diff_toilet
  

************************************************************

********************Merge***********************************
**Merging Sector with A
use "E:\RUST\Section A.dta", clear
merge 1:1 KEY using "E:\RUST\Section Z.dta", keepusing(Sector Total_HH_Income)
drop _merge

*Merging D with A
use "E:\RUST\Section D.dta", clear
merge 1:1 KEY using "E:\RUST\Section A.dta", keepusing(Gender Gen_Ed Employed Religion Sc_Grp Residence_Stat Sector Total_HH_Income)
drop _merge

*Merging E1 with A
use "E:\RUST\Section E1.dta", clear
merge 1:1 KEY using "E:\RUST\Section A.dta", keepusing(Gender Gen_Ed Employed Religion Sc_Grp Residence_Stat)
drop _merge

*Merging E2 with A
use "E:\RUST\Section E2.dta", clear
merge 1:1 KEY using "E:\RUST\Section A.dta", keepusing(Gender Gen_Ed Employed Religion Sc_Grp Residence_Stat Sector Total_HH_Income)
drop _merge

*Merging E3 with A
use "E:\RUST\Section E3.dta", clear
merge 1:1 KEY using "E:\RUST\Section A.dta", keepusing(Gender Gen_Ed Employed Religion Sc_Grp Residence_Stat Sector Total_HH_Income)
drop _merge

*Merging E4 with A
use "E:\RUST\Section E4.dta", clear
merge 1:1 KEY using "E:\RUST\Section A.dta", keepusing(Gender Gen_Ed Employed Religion Sc_Grp Residence_Stat Sector Total_HH_Income)
drop _merge

****************************************************************************
**********************Tabulation and Cross Tab Codes***********************
****************************************************************************
*tabs in A
use "E:\RUST\Section A.dta", clear
tab Gender, missing
tab Marital_Stat , missing
tab Gen_Ed , missing
tab Gen_Ed_Specific , missing
tab Employed , missing
tab Emp_Sector , missing
tab Emp_Sector_Specific , missing
tab Commute_Mode , missing
tab Religion , missing
tab Sc_Grp , missing
tab Sc_Grp_Specific , missing
tab Residence_Stat , missing
tab Residence_Stat_Specific , missing
tab Second_Residence_Stat , missing
*cross tabs
tab2 Gen_Ed Sc_Grp, col nof
tab2 Employed Sc_Grp , col nof
tab2 Residence_Stat Sc_Grp , col nof

tab2 Sector Gender, col r
tab2 Sector Religion , col r
tab2 Sector Sc_Grp , col r
tab2 Sector Employed , col r
tab2 Sector Residence_Stat , col r
tab2 Sector Religion , col r



* C Tabs
tab Purpose_SBM , missing
tab Subsidy_toilet_construct , missing
tab1 Edu_sani_hygiene Community_toilet_access Public_toilet_access Solid_waste_dispo Safe_access_toilets Privacy_toilet_use Improved_health , missing
tab Privacy_toilet_use
tab Fin_toilet_construct_inHH , missing
tab Provision_pub_toilet , missing
tab Reduce_open_defec , missing
tab Better_toilet_women , missing
tab Treat_dispo_Hum_waste , missing
tab Treat_dispo_solid_waste , missing


*D Tabs
tab Wat_Drink_Wash_source , missing
tab Wat_qual_vary, missing
tab Wat_Purification , missing
tabm Wat_pur_process_1 Wat_pur_process_2 Wat_pur_process_3 Wat_pur_process_4 , one
tab Obs_Eutro_Watbody , missing
*cross tabs
tab2 Sc_Grp Wat_Drink_Wash_source, r nof
tab2 Employed Wat_Drink_Wash_source, r nof
tab2 Gen_Ed Wat_Drink_Wash_source, r nof
tab2 Gender Wat_Drink_Wash_source, r nof
tab2 Residence_Stat Wat_Drink_Wash_source, r nof
tab2 Religion Wat_Drink_Wash_source, r nof
tab2 Sc_Grp Wat_qual_vary , r nof
tab2 Employed Wat_qual_vary , r nof
tab2 Gen_Ed Wat_qual_vary , r nof
tab2 Gender Wat_qual_vary , r nof
tab2 Residence_Stat Wat_qual_vary , r nof
tab2 Religion Wat_qual_vary , r nof
tab2 Sc_Grp Wat_Purification , r nof
tab2 Employed Wat_Purification , r nof
tab2 Gen_Ed Wat_Purification , r nof
tab2 Gender Wat_Purification , r nof
tab2 Residence_Stat Wat_Purification , r nof
tab2 Religion Wat_Purification , r nof

*E1 Tabs
tab Defec_place, missing
tab Defec_place_specific , missing
tab Toilet_type , missing
tab Toilet_use_freq_per_day , missing
tab Toilet_inHH , missing
tabm Reason_NO_inHH_1 Reason_NO_inHH_2 Reason_NO_inHH_3 Reason_NO_inHH_4 Reason_NO_inHH_5, one
tab HH_mem_built_Toilet_inHH
tab Info_source, sort

*Cross tabs
tab2 Defec_place Employed, col r
tab2 Defec_place Gender , col r
tab2 Defec_place Sc_Grp , col r
tab2 Defec_place Religion , col r
tab2 Defec_place Residence_Stat , col r

tab2 Toilet_type Gender , col r
tab2 Toilet_type Employed , col r
tab2 Toilet_type Sc_Grp , col r
tab2 Toilet_type Religion , col r
tab2 Toilet_type Residence_Stat , col r

tab2 Toilet_inHH Gender , col r
tab2 Toilet_inHH Employed , col r
tab2 Toilet_inHH Sc_Grp , col r
tab2 Toilet_inHH Religion , col r
tab2 Toilet_inHH Residence_Stat , col r

tab2 Defec_place Sector , col r
tab2 Toilet_type Sector , col r
tab2 Toilet_inHH Sector , col r
tab2 Toilet_inHH_type Sector , col r
tab2 Toilet_inHH_type Gender , col r
tab2 Toilet_inHH_type Gender , col r
tab2 Toilet_inHH_type Employed , col r
tab2 Toilet_inHH_type Sc_Grp , col r
tab2 Toilet_inHH_type Religion , col r
tab2 Toilet_inHH_type Residence_Stat , col r

tab2 Probs_defec_facility_1 Sector , col r nol
tab2 Probs_defec_facility_1 Employed , col r nol
tab2 Probs_defec_facility_1 Employed , col r
tab2 Probs_defec_facility_1 Sc_Grp , col r
tab2 Probs_defec_facility_1 Religion , col r
tab2 Probs_defec_facility_1 Residence_Stat , col r

tab2 Reason_NO_inHH_1 Sector , col r
tab2 Reason_NO_inHH_1 Gender , col r
tab2 Reason_NO_inHH_1 Employed , col r
tab2 Reason_NO_inHH_1 Sc_Grp , col r
tab2 Reason_NO_inHH_1 Religion , col r
tab2 Reason_NO_inHH_1 Residence_Stat , col r

*E2
tab Black_wat_dispo, sort missing
tab Black_wat_dispo_specific , sort missing
tab Waste_wat_treat , sort missing

*cross tabs
tab2 Grey_wat_dispo Gender, col r
tab2 Grey_wat_dispo Sector , col r
tab2 Grey_wat_dispo Employed , col r
tab2 Grey_wat_dispo Sc_Grp , col r
tab2 Grey_wat_dispo Religion , col r
tab2 Grey_wat_dispo Residence_Stat , col r

tab2 Black_wat_dispo Gender, col r
tab2 Black_wat_dispo Sector , col r
tab2 Black_wat_dispo Employed , col r
tab2 Black_wat_dispo Sc_Grp , col r
tab2 Black_wat_dispo Religion , col r
tab2 Black_wat_dispo Residence_Stat , col r

tab2 Waste_wat_treat Gender, col r
tab2 Waste_wat_treat Sector , col r
tab2 Waste_wat_treat Employed , col r
tab2 Waste_wat_treat Sc_Grp , col r
tab2 Waste_wat_treat Religion , col r
tab2 Waste_wat_treat Residence_Stat , col r

*E3
tab Waste_segreg_dispo, missing sort
tab Mixed_waste_dispo_place , missing sort
tab Seg_waste_type , missing sort
tab Waste_mgt_sys_satis , missing sort

*Cross tabs
tab2 Waste_segreg_dispo Gender, col r
tab2 Waste_segreg_dispo Sector , col r
tab2 Waste_segreg_dispo Residence_Stat , col r
tab2 Waste_segreg_dispo Sc_Grp , col r

tab2 Mixed_waste_dispo_place Gender, col r
tab2 Mixed_waste_dispo_place Sector , col r
tab2 Mixed_waste_dispo_place Employed , col r
tab2 Mixed_waste_dispo_place Sc_Grp , col r
tab2 Mixed_waste_dispo_place Religion , col r
tab2 Mixed_waste_dispo_place Residence_Stat , col r

tab2 Waste_mgt_sys_satis Gender, col r
tab2 Waste_mgt_sys_satis Sector , col r
tab2 Waste_mgt_sys_satis Employed , col r
tab2 Waste_mgt_sys_satis Sc_Grp , col r
tab2 Waste_mgt_sys_satis Religion , col r
tab2 Waste_mgt_sys_satis Residence_Stat , col r

*E4 tabs
tab Waste_wat_treat_prior_dispo, sort missing
tab Hum_excre_recycled_fertilizer , sort missing
tab Fertil_safe_cultiv_use , sort missing
tab Hum_excre_recycled_Biogas , sort missing
tab Eat_hum_fertil_food , sort missing

*cross tabs
tab2 Waste_wat_treat_prior_dispo Gender, col r
tab2 Waste_wat_treat_prior_dispo Sector , col r
tab2 Waste_wat_treat_prior_dispo Employed , col r
tab2 Waste_wat_treat_prior_dispo Sc_Grp , col r
tab2 Waste_wat_treat_prior_dispo Religion , col r
tab2 Waste_wat_treat_prior_dispo Residence_Stat , col r

tab2 Hum_excre_recycled_fertilizer Gender, col r
tab2 Hum_excre_recycled_fertilizer Sector , col r
tab2 Hum_excre_recycled_fertilizer Employed , col r
tab2 Hum_excre_recycled_fertilizer Sc_Grp , col r
tab2 Hum_excre_recycled_fertilizer Religion , col r
tab2 Hum_excre_recycled_fertilizer Residence_Stat , col r

tab2 Fertil_safe_cultiv_use Gender, col r
tab2 Fertil_safe_cultiv_use Sector , col r
tab2 Fertil_safe_cultiv_use Employed , col r
tab2 Fertil_safe_cultiv_use Sc_Grp , col r
tab2 Fertil_safe_cultiv_use Religion , col r
tab2 Fertil_safe_cultiv_use Residence_Stat , col r

tab2 Hum_excre_recycled_Biogas Gender, col r
tab2 Hum_excre_recycled_Biogas Sector , col r
tab2 Hum_excre_recycled_Biogas Employed , col r
tab2 Hum_excre_recycled_Biogas Sc_Grp , col r
tab2 Hum_excre_recycled_Biogas Religion , col r
tab2 Hum_excre_recycled_Biogas Residence_Stat , col r

tab2 Eat_hum_fertil_food Gender, col r
tab2 Eat_hum_fertil_food Sector , col r
tab2 Eat_hum_fertil_food Employed , col r
tab2 Eat_hum_fertil_food Sc_Grp , col r
tab2 Eat_hum_fertil_food Religion , col r
tab2 Eat_hum_fertil_food Residence_Stat , col r
