*creating HH_ID for L 06 Block 06
use "E:\NSSO 76\Mother\L 07 Block 07.dta"

 gen FSU=substr(Common_ID,4,5)
 gen Sample=substr(Common_ID,14,1)
 gen Sector=substr(Common_ID,15,1)
 gen NSS_Region=substr(Common_ID,16,3)
 gen District=substr(Common_ID,19,2)
 gen Stratum=substr(Common_ID,21,2)
 gen Sub_strtm=substr(Common_ID,23,2)
 gen Scnd_stg_strtm=substr(Common_ID,30,1)
 gen sample_HH_no=substr(Common_ID,31,2)
 egen HH_ID= concat ( FSU Sample Sector NSS_Region District Stratum Sub_strtm Scnd_stg_strtm sample_HH_no )
*creationg dup tag for HH_ID
duplicates tag HH_ID, gen(dupl_HH_ID)
tab dupl_HH_ID
*post Dup_tag verification, Dupl_HH_ID was dropped
 drop dupl_HH_ID
*dropping isid string vars
drop FSU Sample Sector NSS_Region District Stratum Sub_strtm Scnd_stg_strtm sample_HH_no

save "E:\NSSO 76\Mother\L 07 Block 07.dta", replace 
***********************************************************************

*Merging Block 01 to Block 5&6 Merge
merge 1:1 HH_ID using "E:\NSSO 76\Block 1&4 Merge.dta"
save "E:\NSSO 76\Mother\L 07 Block 07.dta", replace 

**corr of fuel type after recode
recode Fuel_type_cook (1=2)(2=9)(3=9)(4=2)(5=3)(6=3)(7=9)(8=9)(9=3)(10=4)(12=1)(19=9), gen(recode_fuel)

	estpost corr recode_fuel Land_owned Sc_grp Tenur_dwell_stat MHCE Tot_flr_area Monthly_rent_Rs New_house_exp [iw= Multiplier /100]
	esttab using "E:\Energy Poverty\Writeups\NSS 76 cooki fuel correlation.rtf", ///
	title("Correlation Between Cooking Fuel and Household Development Indicators in 2018 (Data from NSS 76)") replace label

tabout recode_fuel using "E:\Energy Poverty\Writeups\nss 76.xls", oneway append ///
	c(freq col cum) f(0c 2p 2p) clab(Frequency Percentage Cumulative_Percentage)
	
