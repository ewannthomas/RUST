*Cleaning L 01  Block 01
*operations on 13/05/2020

use "E:\NSSO 76\L 01 Block 01.dta"

*dropping variable Blank
drop Blank

*creating common HH Id 
egen HH_ID = concat(FSU Sample Sector NSS_Region District Stratum Sub_stratum Scnd_stg_strtm Sample_HH_no)
*creationg dup tag for HH_ID
duplicates tag HH_ID, gen(dupl_HH_ID)
tab dupl_HH_ID 
*post Dup_tag verification, Dupl_HH_ID was dropped
drop dupl_HH_ID



*Labelling variables of L 01 Block 1
label variable Centr_Round "Centre or Round" 
label variable FSU "FSU"
label variable Round "Round"
label variable Schedule "Schedule"
label variable Sample "Sample"
label variable Sector "Sector"
label variable NSS_Region "NSS Region"
label variable District "District"
label variable Stratum "Stratum"
label variable Sub_stratum "Sub Stratum" 
label variable Sub_Round "Sub Round"
label variable FOD_Sub_Reg "FOD Sub Region"
label variable Scnd_stg_strtm "Second Stage Stratum"
label variable Sample_HH_no "Sample Household Number"
label variable Level "Level"
label variable Filler "Filler"
label variable Sl_No_Informant "Serial Number of Informant"
label variable Response_Code "Response Code"
label variable Survey_Code "Survey Code"
label variable Reason_for_subs "Reason for Substitution"
label variable NSC "NSC"
label variable Multiplier "Multiplier"


*Assigning Value labels for L01 Block 01
label define ResponseCode 1"informant: co-operative and capable" 2"informant: co-operative but not capable" ///
3"informant: busy" 4"informant: reluctant" 9"informant: others" 
label values Response_Code ResponseCode

label define SurveyCode 1"household surveyed: original" 2"household surveyed: substitute" 3"household surveyed: casualty"
label values Survey_Code SurveyCode

label define ReasonForSubstitution 1"informant busy" 2"members away from home" 3"informant non-cooperative" 9"others"
label values Reason_for_subs ReasonForSubstitution

destring NSS_Region,replace
tostring NSS_Region , replace

gen NSS_Region_State= NSS_Region
tostring NSS_Region_State,replace
destring NSS_Region,replace

gen State=substr( NSS_Region_State ,1,1 ) if inrange( NSS_Region ,1,99)

replace State=substr( NSS_Region_State ,1,2 ) if inrange( NSS_Region ,100,362)

tostring State, replace 

egen State_District= concat(State District)

destring State_District, replace 

gen Aspirational_Districts=1 if inlist(State_District, 2802,2803, 2810,1215,1803,1804,1825,1819,1826,1827, ///
1004,1007,1009,1010,1014,1020,1021,1023,1026,1033,1034,1035,1036,2205,2209,2212,2214,2215,2216,2217,2218,2221,2222, ///
2418, 2420,619,201,101,108,2001,2011,2012,2013,2014,2019,2020,2021,2022,2023,2002,2004,2006,2007,2008,2010,2015,2016,2017, ///
2905,2907,2925,2926,2903, 2308,2346,2311,2326,2325,2324,2349,2341,2701,2703,2715,2729,2706,2712,1409,1705,1501,1309,2120,2121,2124,2125,2126, ///
2127,2128,2129,2130,2114,308,309,816,817,819,808,809,830,1102,1104,3324,3325,3601,3602,3608,3611,3631,1603,512,513,941,949,950,951,953,965,969, ///
940,1905,1908,1910)

replace Aspirational_Districts=0 if Aspirational_Districts==.
label define  Aspirational_Districts 1 " Aspirational_Districts" 0 "Other Districts"
label value  Aspirational_Districts  Aspirational_Districts

drop State

save "E:\NSSO 76\L 01 Block 01.dta", replace




*operations on 13/05/2020
*Cleaning L 02  Block 03

use "E:\NSSO 76\L 02 Block 03.dta"


*dropping variable Blank
drop Blank

*Labelling variables of L 02 Block 03
label variable Common_ID "Common ID"
label variable Level "Level"
label variable Filler "Filler"
label variable Per_Srl_No "Person Serial Number"
label variable Relate_Head "Relation to Head"
label variable Gender "Gender"
label variable Age "Age"
label variable Marital_status "Marital Status"
label variable Gen_ed_lev "Highest Level of Education"
label variable Usual_P_act_stat "Status of Usual Principal Activity"
label variable indus_cde "Industry Code"
label variable occup_cde "Occupation Code"
label variable use_latrine "use of latrine"
label variable type_latrine "type of latrine"
label variable latrine_only_HH "latrine for exclusive use of HH"
label variable reason_No_latrine "reason for not using latrine"
label variable NSC "NSC"
label variable Multiplier "Multiplier"


*Assigning Value labels for L02 Block 03
*for Industry and Occupation codes NIC(2008) and NCO(2004) 
label define RelationToHead 1"self" 2"spouse of head" 3"married child" 4"spouse of married child" 5"unmarried child" ///
6"grandchild" 7"father/mother/father-in-law/mother-in-law" 8"brother/sister/brother-in-law/sister-in-law/other relatives" ///
9"servant/employees/other non-relatives"
label values Relate_Head RelationToHead

label define MaritalStatus 1 "never married" 2 "currently married" 3 "widowed" 4 "divorced/separated"
label values Marital_status MaritalStatus

label define Gender 1 "male" 2 "female" 3 "third gender"
label values Gender Gender

label define HighestLevelOfEducation 1"not literate" 2"literate without any schooling" 3"literate without formal schooling: through NFEC" ///
4"literate without formal schooling: through TLC/ AEC" 5"literate without formal schooling: others" 6"literate with formal schooling: below primary" ///
7"primary" 8"upper primary/middle" 10"secondary" ///
11"higher secondary" 12"diploma /certificate course (upto secondary)" ///
13"diploma/certificate course (higher secondary)" 14"diploma/certificate course (graduation & above)" ///
15"graduate" 16"post graduate and above"
label values Gen_ed_lev HighestLevelOfEducation

label define StatUsualPrinAct 11 "worked in h.h. enterprise (self-employed): own account worker" 12 "worked in h.h. enterprise (self-employed):employer"  21 "worked as helper in h.h. enterprise (unpaid family worker)" ///
31 "worked as regular salaried/ wage employee" 41 "worked as casual wage labour: in public works" 51 "worked as casual wage labour:in other types of  work" 81 "did not work but was seeking and/or available for work" ///
91 "attended educational institution" 92 "attended domestic duties only" ///
93 "attended domestic duties and was also engaged in free collection of goods (vegetables, roots, firewood, cattle feed, etc.), sewing, tailoring, weaving, etc. for household use" /// 
94 "rentiers, pensioners , remittance recipients, etc." 95 "not able to work due to disability" ///
97 "others (including begging, prostitution,  etc.)" 99 "children of age 0-4 years" 
label values Usual_P_act_stat StatUsualPrinAct

label define LatrineUse 1"regularly" 2"occasionally" 3"never" 
label values use_latrine LatrineUse

label define LatrineType 1"flush/pour-flush to: piped sewer system" 2"septic tank" 3"twin leach pit" 4"single pit" 5"elsewhere (open drain, open pit, open field, etc)" ///
6"ventilated improved pit latrine" 7"pit latrine with slab" 8"pit latrine without slab/open pit" 10"composting latrine" 19"others"
label values type_latrine LatrineType


label define ReasonNotUsingLatrine 1"latrine has no superstructure" 2"latrine is not clean/sufficient water is not available in the latrine" 3"malfunctioning of the latrine " ///
4"shortage of latrine" 5"latrine is used for other purposes" 6"lack of privacy/safety" 7"personal preference" 8"cannot afford charges for paid latrine" 9"others"
label values reason_No_latrine ReasonNotUsingLatrine
 

label define LatrineExclusiveForHH 1"Yes" 2"No"
label values latrine_only_HH LatrineExclusiveForHH
 
 

save "E:\NSSO 76\L 02 Block 03.dta", replace





*operations on 13/05/2020
*Cleaning L 03  Block 04

use "E:\NSSO 76\L 03 Block 04.dta"


*dropping variable Blank
drop Blank

*Labelling variables of L 03 Block 04
label variable Common_ID "Common ID"
label variable Level "Level"
label variable Filler "Filler"
label variable HH_size "Household Size"
label variable Relgn "Religion"
label variable Sc_grp "Social Group"
label variable Land_owned "land owned"
label variable MHCE_purch_A "MHCE from purchase (A)"
label variable MHCE_home_grwn_stck_B "MHCE from home grown stock (B)"
label variable MHCE_wage_C "MHCE from wages in kind(C)"
label variable YHCE_durab " YHCE from durables bought(D)"
label variable MHCE "total monthly HH consumer expenditure"
label variable Tenur_dwell_stat "tenurial status of dwelling"
label variable Dwell_locat_type "area type of dwelling location"
label variable New_house_pur " New House Purchased?"
label variable New_house_exp "amount spent(Rs.)House Purchase"
label variable Source_fin_1 "sources of finance 1"
label variable Source_fin_2 "sources of finance 2"
label variable Source_fin_3 "sources of finance 3"
label variable Source_fin_4 "sources of finance 4"
label variable Dist_work_M "distance travel to work by M"
label variable Dist_work_F "distance travel to work by F"
label variable Dist_work_TransG "distance travel to work by TransG"
label variable NSC "NSC"
label variable Multiplier "Multiplier"


**variable definitions

**HH_size - HouseHold size
*Relgn -Religion
*Sc_grp - Social Group
*Land_owned -land possessed as on the date of survey (code)
*MHCE_purch_A - usual consumer expenditure in a month for household purposes out of purchase (A)
*MHCE_home_grwn_stck_B -imputed value of usual consumption in a month from home grown stock (B)
*MHCE_wage_C - imputed value of usual consumption in a month from wages in kind, free collection, gifts, etc. (C)
*YHCE_durab - expenditure on purchase of household durables during last 365 days (D)
*MHCE - usual monthly consumer expenditure [A + B + C +(D/12)]
*Tenur_dwell_stat - tenurial status of dwelling
*Dwell_locat_type - area type in which the dwelling unit is located

*amount spent by the household on construction/first-hand purchase of houses/ flats for residential purpose and sources of finance
*New_house_pur - whether spent any amount during last 365 days ? 
*New_house_exp - amount spent (Rs.)
*Source_fin_1 - sources of finance 1 
*Source_fin_2 - sources of finance 2
*Source_fin_3 - sources of finance 3
*Source_fin_4 - sources of finance 4
*Dist_work_M - maximum distance normally travelled to the place of work: among the male earners
*Dist_work_F - maximum distance normally travelled to the place of work: among the female earners
*Dist_work_TransG - maximum distance normally travelled to the place of work: among the transgender earners


*operations on 15/05/2020

*Assigning Value labels for L03 Block 04

label define Religion 1"Hinduism" 2"Islam" 3"Christianity"  4"Sikhism" 5"Jainism" 6"Buddhism" 7"Zoroastrianism" 9"others"
label values Relgn Religion

label define SocialGroup 1"scheduled tribe" 2"scheduled caste" 3"other backward class" 9"others"
label values Sc_grp SocialGroup

label define LandOwned 1"less than 0.005 hectare" 2"0.005 - 0.02 hectare" 3"0.02 - 0.21 hectare" 4"0.21 - 0.41 hectare" 5"0.41 - 1.01 hectare" 6"1.01 – 2.01 hectare" ///
7"2.01 – 3.01 hectare" 8"3.01 - 4.01 hectare" 10"4.01 - 6.01 hectare" 11"6.01 - 8.01 hectare" 12"greater than or equal to 8.01 hectare" 99"does not possess any land"
label values Land_owned LandOwned

label define TenurialStat 1"owned: freehold" 2"owned: leasehold" 3"hired: employer quarter" 4"hired dwelling unit with written contract" 5"hired dwelling unit without written contract" 6"no dwelling" 9"others"
label values Tenur_dwell_stat TenurialStat

label define DwellLocateType 1"notified slum" 2"non-notified slum" 3"squatter settlement" 9"other areas"
label values Dwell_locat_type DwellLocateType

label define NewHousePurchase 1"yes" 2"no" 
label values New_house_pur NewHousePurchase


label define SourceFin 1"own source (including own labour)" 2"government" 3"bank" 4"insurance" 5"provident fund (advance/loan)" 6"financial corporation/institution" ///
7"other institutional agencies" 8"non-institutional agencies: self help group" 9"non-institutional agencies: money lender" 10"non-institutional agencies: friends and relatives" 11"other non-institutional agencies"
label values Source_fin_1 SourceFin
label values Source_fin_2 SourceFin
label values Source_fin_3 SourceFin
label values Source_fin_4 SourceFin
*institutional agencies: 1-7  non-institutional agencies: 8-11

label define DistanceToWork 1"not required to travel" 2"less than 1 k.m." 3"1 to 5 k.m." 4"5 to 10 k.m." 5"10 to 15 k.m." 6"15 to 30 k.m." 7"30 k.m. or more" 
label values Dist_work_M DistanceToWork
label values Dist_work_F DistanceToWork
label values Dist_work_TransG DistanceToWork


save "E:\NSSO 76\L 03 Block 04.dta", replace







*Cleaning L 04  Block 04(item 15)

use "E:\NSSO 76\L 04 Block 04 (item 15).dta"


*dropping variable Blank
drop Blank

*Labelling variables of L 04 Block 04 (item 15)
label variable Common_ID "Common ID"
label variable Level "Level"
label variable Filler "Filler"
label variable Dwat_benefit "Whether ever received any benefit?"
label variable Dwat_ben_last3_years "whether received benefit during last 3 years"
label variable Dwat_ben_scheme "scheme from which maximum benefit was received"
label variable Sani_benefit "Whether ever received any benefit?"
label variable Sani_ben_last3_years "whether received benefit during last 3 years"
label variable Sani_ben_scheme "scheme from which maximum benefit was received"
label variable House_benefit "Whether ever received any benefit?"
label variable House_ben_last3_years "Whether received benefit during last 3 years"
label variable House_ben_scheme "scheme from which maximum benefit was received"
label variable Electri_benefit "Whether ever received any benefit?"
label variable Electri_ben_last3_years "Whether received benefit during last 3 years"
label variable Electri_ben_scheme "scheme from which maximum benefit was received"
label variable LPG_benefit "Whether ever received any benefit?"
label variable LPG_ben_last3_years "Whether received benefit during last 3 years"
label variable LPG_ben_scheme "scheme from which maximum benefit was received"
label variable NSC "NSC"
label variable Multiplier "Multiplier"


**variable definitions
*Dwat_benefit - Drinking water-Whether ever received any benefit?
*Dwat_ben_last3_years - Drinking water-whether received benefit during last 3 years
*Dwat_ben_scheme - Drinking water-scheme from which maximum benefit was received
*Sani_benefit - Sanitation- Whether ever received any benefit?
*Sani_ben_last3_years - Sanitation- whether received benefit during last 3 years
*Sani_ben_scheme - Sanitation- scheme from which maximum benefit was received
*House_benefit - Houseing- Whether ever received any benefit?
*House_ben_last3_years - Housing-  whether received benefit during last 3 years
*House_ben_scheme - Housing-  scheme from which maximum benefit was received
*Electri_benefit - Electrification- Whether ever received any benefit for electrification?
*Electri_ben_last3_years - Electrification- whether received benefit during last 3 years
*Electri_ben_scheme - Electrification- scheme from which maximum benefit was received
*LPG_benefit - LPG connection- Whether ever received any benefit?
*LPG_ben_last3_years - LPG connection- whether received benefit during last 3 years
*LPG_ben_scheme - LPG Connection- scheme from which maximum benefit was received


*Assigning Value labels for L04 Block 04 (item 15)

label define BenefitReceived 1"Yes" 2"No" 3"Not known"
label values Dwat_benefit BenefitReceived
label values Sani_benefit BenefitReceived
label values House_benefit BenefitReceived
label values Electri_benefit BenefitReceived
label values LPG_benefit BenefitReceived

label define BenefitLast3Yrs 1"Yes" 2"No" 3"Not known"
label values Dwat_ben_last3_years BenefitLast3Yrs
label values Sani_ben_last3_years BenefitLast3Yrs
label values Electri_ben_last3_years BenefitLast3Yrs
label values LPG_ben_last3_years BenefitLast3Yrs
label values House_ben_last3_years BenefitLast3Yrs

label define DwatBenScheme 1"National Rural Drinking Water Programme (NRDWP)" 2"Atal Mission for Rejuvenation and Urban Transformation (AMRUT)" ///
3"Smart Cities Mission" 5"not known" 9"other scheme"
label values Dwat_ben_scheme DwatBenScheme

label define SaniBenScheme 1"Swachh Bharat Mission (SBM)" 2"Atal Mission for Rejuvenation and Urban Transformation (AMRUT)" ///
3"Smart Cities Mission" 5"not known" 9"other scheme"
label values Sani_ben_scheme SaniBenScheme

label define HouseBenScheme 1"Pradhan Mantri Awaas Yojana (PMAY)" 5"not known" 9"other scheme"
label values House_ben_scheme HouseBenScheme

label define ElectriBenScheme 1"Deendayal Upadhyaya Gram Jyoti Yojana (DDUGJY)" 5"not known" 9"other scheme"
label values Electri_ben_scheme ElectriBenScheme

label define LPGBenScheme 1"Pradhan Mantri Ujjwala Yojana (PMUY)" 5"not known" 9"other scheme"
label values LPG_ben_scheme LPGBenScheme


save "E:\NSSO 76\L 04 Block 04 (item 15).dta", replace





*Cleaning L 05  Block 05

use "E:\NSSO 76\L 05 Block 05.dta"


*dropping variable Blank
drop Blank

*Labelling variables of L 05 Block 05
label variable Common_ID "Common ID"
label variable Level "Level"
label variable Filler "Filler"
label variable Dwat_P_source " Principal source of drinking water"
label variable Dwat_suff_1yr " Whether drinking water sufficient"
label variable Dwat_insuff_Jan " Insufficiency of drinking water-Jan"
label variable Dwat_insuff_Feb " Insufficiency of drinking water-Feb"
label variable Dwat_insuff_Mar " Insufficiency of drinking water-Mar"
label variable Dwat_insuff_Apr " Insufficiency of drinking water-Apr"
label variable Dwat_insuff_May " Insufficiency of drinking water-May"
label variable Dwat_insuff_June " Insufficiency of drinking water-Jun"
label variable Dwat_insuff_July " Insufficiency of drinking water-July"
label variable Dwat_insuff_Aug " Insufficiency of drinking water-Aug"
label variable Dwat_insuff_Sep " Insufficiency of drinking water-Sep"
label variable Dwat_insuff_Oct " Insufficiency of drinking water-Oct"
label variable Dwat_insuff_Nov " Insufficiency of drinking water-Nov"
label variable Dwat_insuff_Dec " Insufficiency of drinking water-Dec"
label variable Dwat_P_source_access " Access to principal source of drinking water"
label variable Dwat_P_source_Dist " Distance of the principal source of drinking water"
label variable Dwat_per_fetch " Who fetches drinking water"
label variable Dwat_fetch_time " Time taken in a day(in minutes)"
label variable Dwat_fetch_wait_time " Waiting time in a day(in minutes)"
label variable Dwat_fetch_trips " number of trips required in a day for fetching drinking water from principal source"
label variable Stag_wat_Dwat_source " Is there stagnant water around source"
label variable Dwat_S_source " Supplementary source of drinking water"
label variable Dwat_treat_method " Method of treatment"
label variable Dwat_contnr_matril " Material of the main container"
label variable Dwat_store_time " how long drinking water is stored" 
label variable Dwat_store_coverd " whether stored drinking water is covered"
label variable Dwat_contnr_take_out " how drinking water is taken out from the main container"
label variable Wat_P_source " Principal source of water excluding drinking"
label variable Wat_suff_1yr " Whether gets sufficient water"
label variable Wat_supply_freq " Frequency of supply of water"
label variable Wat_supply_meter " Whether water is metered"
label variable Wat_monthly_charge_info " Whether any amount is usually paid in a month for purchase of water"
label variable Wat_monthly_charge_paid_Rs " average amount paid per month (Rs.)"
label variable BathR_access " Access of the household to bathroom 9"
label variable BathR_type " type of bathroom used by the household"
label variable BathR_dist " Distance from the bathing place"
label variable Latrine_access  " Access of the household to latrine"
label variable Latrine_type " type of latrine used by the household"
label variable BathR_Latrine_inHH " Whether bathroom and latrine both are within the household premises"
label variable excre_empty " whether excreta from septic tank/pit/composting latrine have ever been emptied"
label variable who_empty_excre " who emptied the excreta last time"
label variable excre_dispo_locat " place of disposal of excreta  last time"
label variable excre_dispo_charge_Rs " amount paid (payable) for emptying the excreta last time (Rs.)"
label variable excre_empty_freq " how frequently excreta is emptied"
label variable Child_less_3yr_excre_dispo " Disposal of faeces for children of age below 3 years"
label variable Latrine_wat_avail " availability of water in or around the latrine used"
label variable HandW_bef_meal " Whether household members regularly wash their hands before meal"
label variable HandW_aft_defec " Whether household members regularly wash their hands after defecation"
label variable NSC "NSC"
label variable Multiplier "Multiplier"



**variable definitions
*Dwat_P_source - Principal source of drinking water
*Dwat_suff_1yr - Whether drinking water sufficient
*Dwat_insuff_Jan - Insufficiency of drinking water-Jan
*Dwat_insuff_Feb - Insufficiency of drinking water-Feb
*Dwat_insuff_Mar - Insufficiency of drinking water-Mar
*Dwat_insuff_Apr - Insufficiency of drinking water-Apr
*Dwat_insuff_May - Insufficiency of drinking water-May
*Dwat_insuff_June - Insufficiency of drinking water-Jun
*Dwat_insuff_July - Insufficiency of drinking water-July
*Dwat_insuff_Aug - Insufficiency of drinking water-Aug
*Dwat_insuff_Sep - Insufficiency of drinking water-Sep
*Dwat_insuff_Oct - Insufficiency of drinking water-Oct
*Dwat_insuff_Nov - Insufficiency of drinking water-Nov
*Dwat_insuff_Dec - Insufficiency of drinking water-Dec
*Dwat_P_source_access - Access to principal source of drinking water
*Dwat_P_source_Dist - Distance of the principal source of drinking water
*Dwat_per_fetch - Who fetches drinking water
*Dwat_fetch_time - Time taken in a day(in minutes)
*Dwat_fetch_wait_time - Waiting time in a day(in minutes)
*Dwat_fetch_trips - number of trips required in a day for fetching drinking water from principal source
*Stag_wat_Dwat_source - Is there stagnant water around source
*Dwat_S_source - Supplementary source of drinking water
*Dwat_treat_method - Method of treatment
*Dwat_contnr_matril - Material of the main container
*Dwat_store_time - how long drinking water is stored 
*Dwat_store_coverd - whether stored drinking water is covered
*Dwat_contnr_take_out - how drinking water is taken out from the main container
*Wat_P_source - Principal source of water excluding drinking
*Wat_suff_1yr - Whether gets sufficient water
*Wat_supply_freq - Frequency of supply of water
*Wat_supply_meter - Whether water is metered
*Wat_monthly_charge_info - Whether any amount is usually paid in a month for purchase of water
*Wat_monthly_charge_paid_Rs - average amount paid per month (Rs.)
*BathR_access - Access of the household to bathroom 9
*BathR_type - type of bathroom used by the household
*BathR_dist - Distance from the bathing place
*Latrine_access  - Access of the household to latrine
*Latrine_type - type of latrine used by the household
*BathR_Latrine_inHH - Whether bathroom and latrine both are within the household premises
*excre_empty - whether excreta from septic tank/pit/composting latrine have ever been emptied
*who_empty_excre - who emptied the excreta last time
*excre_dispo_locat - place of disposal of excreta  last time
*excre_dispo_charge_Rs - amount paid (payable) for emptying the excreta last time (Rs.)
*excre_empty_freq - how frequently excreta is emptied
*Child_less_3yr_excre_dispo - Disposal of faeces for children of age below 3 years
*Latrine_wat_avail - availability of water in or around the latrine used
*HandW_bef_meal - Whether household members regularly wash their hands before meal
*HandW_aft_defec - Whether household members regularly wash their hands after defecation



*opeerations on 17/05/2020
*Assigning Value labels for L 05 Block 05
label define DwaterPrinSource 1"bottled water" 2"piped water into dwelling" 3"piped water to yard/plot" 4"piped water from neighbour" 5"public tap/standpipe" ///
6"tube well" 7"hand pump" 8"well: protected" 9"well: unprotected" 10"tanker-truck: public" 11"tanker-truck: private" 12"spring: protected" ///
13"spring: unprotected" 14"rainwater collection" 15"surface water: tank/pond" 16"other surface water (river, dam, stream, canal, lake, etc.)" 19"others (cart with small tank or drum, etc)"
label values Dwat_P_source DwaterPrinSource

label define DwatSuffFor1yr 1"Yes" 2"No"
label values Dwat_suff_1yr DwatSuffFor1yr

label define DwattInsuff 1"Yes"
label values Dwat_insuff_Jan DwattInsuff 
label values Dwat_insuff_Feb DwattInsuff  
label values Dwat_insuff_Mar DwattInsuff
label values Dwat_insuff_Apr DwattInsuff
label values Dwat_insuff_May DwattInsuff
label values Dwat_insuff_June DwattInsuff
label values Dwat_insuff_July DwattInsuff
label values Dwat_insuff_Aug DwattInsuff
label values Dwat_insuff_Sep DwattInsuff
label values Dwat_insuff_Oct DwattInsuff
label values Dwat_insuff_Nov DwattInsuff
label values Dwat_insuff_Dec DwattInsuff

label define DwatPrinSourceAccess 1"exclusive use of household" 2"common use of households in the building" 3"neighbour’s source" ///
4"community use: public source restricted to particular community" 5"community use: public source unrestricted" 6"community use: private source restricted to particular community" ///
7"community use:  private source unrestricted" 9"others"
label values Dwat_P_source_access DwatPrinSourceAccess


label define DistanceToDwatPrinSource 1"within dwelling" 2"outside dwelling but within the premises" 3"outside premises: less than 0.2 k.m." ///
4"outside premises: 0.2 to 0.5 k.m." 5"outside premises: 0.5 to 1.0 k.m." 6"outside premises: 1.0 to 1.5 k.m." 7"outside premises: 1.5 k.m. or more"
label values Dwat_P_source_Dist DistanceToDwatPrinSource

label define WhoFetchDwat 1"male members of HH of age: below 18 years" 2"male members of HH of age: 18 years or more" 3"female members of HH of age: below 18 years" 4"female members of HH of age: 18 years or more" 5"hired labour" 9"others"
label values Dwat_per_fetch WhoFetchDwat

label define StagWatPrsentInDwatSource 1"Yes" 2"No" 
label values Stag_wat_Dwat_source StagWatPrsentInDwatSource

label define DwatSubSource  1"bottled water" 2"piped water into dwelling" 3"piped water to yard/plot" 4"piped water from neighbour" 5"public tap/standpipe" ///
6"tube well" 7"hand pump" 8"well: protected" 9"well: unprotected" 10"tanker-truck: public" 11"tanker-truck: private" 12"spring: protected" ///
13"spring: unprotected" 14"rainwater collection" 15"surface water: tank/pond" 16"other surface water (river, dam, stream, canal, lake, etc.)" 19"others (cart with small tank or drum, etc)"
label values Dwat_S_source DwatSubSource

label define DwatTreatMethod 1"electric purifier" 2"boiling" 3"chemically treated with alum" 4"chemically treated with bleach/chlorine tablets" 5"non-electric purifier" 6"filtered with cloth" 9"others" 7"not treated"
label values Dwat_treat_method DwatTreatMethod 

label define DwatMainContainerMaterial 1"non-metal: earthen" 2"non-metal: plastic" 3"other non-metal" 4"metal: iron" 5"metal:copper" ///
6"metal:stainless steel" 7"metal: brass" 8"other metal" 9"no storage"
label values Dwat_contnr_matril DwatMainContainerMaterial

label define DwatStoreTime 1"less than 1 day" 2"1 day or more but less than 3 days" 3"3 days or more"
label values Dwat_store_time DwatStoreTime

label define DwatMainContainerCover 1"Yes" 2"No"
label values Dwat_store_coverd DwatMainContainerCover

label define DwatTakenOut 1"through tap" 2"vessel with handle dipped in to take out water" 3"vessel without handle dipped in to take out water" 4"poured out"
label values Dwat_contnr_take_out DwatTakenOut

label define WatPrinSource 1"bottled water" 2"piped water into dwelling" 3"piped water to yard/plot" 4"piped water from neighbour" 5"public tap/standpipe" ///
6"tube well" 7"hand pump" 8"well: protected" 9"well: unprotected" 10"tanker-truck: public" 11"tanker-truck: private" 12"spring: protected" ///
13"spring: unprotected" 14"rainwater collection" 15"surface water: tank/pond" 16"other surface water (river, dam, stream, canal, lake, etc.)" 19"others (cart with small tank or drum, etc)"
label values Wat_P_source WatPrinSource

label define WatSuffFor1yr 1"Yes" 2"No"
label values Wat_suff_1yr WatSuffFor1yr

label define FreqWatSupply 1"daily" 2"once in two days" 3"once in three days" 4"once in a week" 9"others"
label values Wat_supply_freq FreqWatSupply

label define MeteredWatSupply 1"Yes" 2"No" 
label values Wat_supply_meter MeteredWatSupply

label define WatMonthlyChargeInfo 1"yes: information on full amount of payment is available" 2"yes: information on some amount of payment is available" ///
3"yes: no information on amount paid is separately available" 4"not required to pay"
label values Wat_monthly_charge_info WatMonthlyChargeInfo
 
label define BathRAccess 1"exclusive use of household" 2"common use of households in the building" 3"public/community use without payment" 4"public/community use with payment" ///
9"others" 5"no bathroom"
label values BathR_access BathRAccess

label define BathRType 1"used: attached to the dwelling unit" 2"used: detached to the dwelling unit but within the household premises" 9"used: others" 3"not used"
label values BathR_type BathRType

label define DistToBathR 1"within dwelling" 2"outside dwelling but within the premises" 3"outside premises: less than 0.2 k.m." 4"outside premises: 0.2 to 0.5 k.m." 5"outside premises: 0.5 to 1.0 k.m." ///
6"outside premises: 1.0 k.m. to 1.5 k.m." 7"outside premises: 1.5 k.m. or more"
label values BathR_dist DistToBathR

label define LatrineAccess 1"exclusive use of household" 2"common use of households in the building" 3"public/community latrine without payment" 4"public/community latrine with payment" 9"others" 5"no latrine"
label values Latrine_access LatrineAccess

label define LatrineType 1"piped sewer system" 2"septic tank" 3"twin leach pit" 4"single pit" 5"elsewhere (open drain, open pit, open field, etc)" 6"ventilated improved pit latrine" 7"pit latrine with slab" 8"pit latrine without slab/open pit" 10"composting latrine" 11"not used" 19"others"
label values Latrine_type LatrineType

label define BathRLatrineInsideHH 1"Yes" 2"No"
label values BathR_Latrine_inHH BathRLatrineInsideHH

label define ExcretaEverEmptied 1"Yes" 2"No" 3"Not Known"
label values excre_empty ExcretaEverEmptied
 
label define WhoEmptiedExcreta 1"panchayet/municipality /corporation" 2"private agency" 3"hired labour engaged by the household" 4"member(s) of the household" 5"not known" 9"others"
label values who_empty_excre WhoEmptiedExcreta

label define ExcretaDispoLocation 1"treatment plant" 2"buried in covered twin leach pit/single pit" 3"uncovered pit/open land/pond/river etc." 9"other places" 4"not known"
label values excre_dispo_locat ExcretaDispoLocation

label define ExcretaEmptyFreq 1"once or more in a year" 2"once in 2 years" 3"once in 5 years" 4"once in 10 years" 9"others" 5"not known"
label values excre_empty_freq ExcretaEmptyFreq

label define ExcretaDispoOfChild 1"children used latrine" 2"put/rinsed into latrine" 3"put/rinsed into drain or ditch" 4"thrown into garbage" 5"thrown or left in open area" 6"buried" 9"others" 7"not applicable"
label values Child_less_3yr_excre_dispo ExcretaDispoOfChild

label define WatAvailableInLatrine 1"water is available with soap/detergent" 2"water is available with ash/mud/sand etc." 3"only water is available" 4"not available"
label values Latrine_wat_avail WatAvailableInLatrine

label define HandWashBeforeMeal 1"yes: with water and soap/detergent" 2"yes: with water and ash/mud/sand etc." 3"yes: with water only" 4"no"
label values HandW_bef_meal HandWashBeforeMeal

label define HandWashAfterDefecation 1"yes: with water and soap/detergent" 2"yes: with water and ash/mud/sand etc." 3"yes: with water only" 4"no"
label values HandW_aft_defec HandWashAfterDefecation



save "E:\NSSO 76\L 05 Block 05.dta",replace





*Cleaning L 06  Block 06

use "E:\NSSO 76\L 06 Block 06.dta"


*dropping variable Blank
drop Blank

*Labelling variables of L 06 Block 06
label variable Common_ID "Common ID"
label variable Level "Level"
label variable Filler "Filler"
label variable House_plinth " Plinth level of the house "
label variable House_floor_no " Number of floor (s) in the house"
label variable House_use  " Use of house "
label variable Built_since " Period since built "
label variable Start_yr " Year of start"
label variable Complet_yr " Year of completion"
label variable Struc_conditn " Condition  of structure  "
label variable HH_dom_use_electri " Whether the household has electricity for domestic use"
label variable Electri_wire_type " Type of electric wiring "
label variable HH_drain_type " Drainage system of the household  "
label variable HH_waste_wat_dispo " System of disposal of household waste water "
label variable HH_garb_dispo_place " Place of disposal of household garbage"
label variable HH_garb_agency_collect " Agency made arrangement for collection of garbage of the household "
label variable Garb_collect_freq " How frequently garbage is cleared"
label variable Flood_prev_5yrs " Whether experienced any flood during last 5 years"
label variable HH_road_opens " Approach road / lane / constructed path "
label variable HH_stagWat_prob_inOraround " Whether the household faces problem of stagnant water in or around the household premises"
label variable Human_faece_visib_inOraround_HH " Whether human faeces are visible in or around the household premises"
label variable Exis_anim_shed_poult_farm " Existence of animal shed/poultry farm"
label variable Anim_poult_excre_dispo " Disposal of animal/poultry excreta  "
label variable HH_face_flymosqui_prob_1yr " Whether the household faced problem of flies/mosquitoes during last 365 days"
label variable Fly_mosq_solv_Loc_SteGovt_1yr  " Whether any effort was made by the Local Bodies/State Government during last 365 days to tackle problem of flies/mosquitoes"
label variable Fly_mosq_solv_HH_365d " Whether any effort was made by the household during last 365 days to tackle problem of flies/mosquitoes"
label variable diarea_dysntry_cholera " Stomach problems like diarrhea/dysentery/cholera"
label variable Malria_dengy_chikgnya_enceflits " Malaria/dengue/chikungunya/encephalitis"
label variable Skin_diseases " Skin diseases  "
label variable Jaundice " Jaundice  "
label variable Other_diseases " Other diseases  "
label variable NSC "NSC"
label variable Multiplier "Multiplier"


*Assigning Value labels for L 06 Block 06
label define HouseUse 1"residential only" 2"residential-cum-commercial" 9"residential-cum-others"
label values House_use 

label define BuiltSince 1"less than 1 year" 2"1 to 2 years" 3"2 to 3 years" 4"3 to 4 years" 5"4 to 5 years" 6"5 to 10 years" 7"10 to 20 years" 8"20 to 40 years" 10"40 to 60 years" 11"60 years or more" 12"not known"
label values Built_since BuiltSince

label define ConditionOfStructure 1"good" 2"satisfactory" 3"bad"
label values Struc_conditn ConditionOfStructure

label define ElcetriAvailForDomUse 1"Yes" 2"No" 
label values HH_dom_use_electri ElcetriAvailForDomUse

label define ElectriWireType 1"conduit wiring" 2"fixed to the walls" 3"temporary"
label values Electri_wire_type ElectriWireType

label define HHDrainageType 1"underground" 2"covered pucca" 3"open pucca" 4"open katcha" 5"no drainage"
label values HH_drain_type HHDrainageType

label define HHWasteWatDisposal 1"safe re-use after treatment" 2"disposed off without treatment to: drainage system" 3"disposed off without treatment to: open low land areas/streets" 4"disposed off without treatment to: ponds" 5"disposed off without treatment to: nearby river/nalla" 6"not known" 9"disposed off with or without treatment to other places"
label values HH_waste_wat_dispo HHWasteWatDisposal

label define HHGarbageDispoPlace 1"bio-gas plant or manure pit" 2"household’s individual dumping spot(s)" 3"community dumping spot (vat, container, etc.)" 4"common place other than community dumping spot (open area/street/open drain)" 9"others" 5"not known"
label values HH_garb_dispo_place HHGarbageDispoPlace

label define HHCollectedByAgency 1"panchayet/municipality/corporation" 2"resident/group of residents" 3"not known" 4"no arrangement" 9"others"
label values HH_garb_agency_collect HHCollectedByAgency

label define GarbCollectionFreq 1"daily" 2"not daily but at least once in a week" 3"not even once in a week" 4"not known"
label values Garb_collect_freq GarbCollectionFreq

label define AnyFloodInPrevious5yrs 1"yes: from excessive rain during monsoon" 2"yes: from river, sea, etc." 3"no"
label values Flood_prev_5yrs AnyFloodInPrevious5yrs

label define HHOpensToRoad 1"direct opening to: motorable road / lane / constructed path with street light" 2"direct opening to:motorable road / lane / constructed path without street light" 3"direct opening to: other road / lane /constructed path with street light" 4"direct opening to: other road / lane / constructed path without street light" 5"no direct opening to road / lane / constructed path"
label values HH_road_opens HHOpensToRoad

label define StagWatProbInOraroundHH 1"Yes" 2"No"
label values HH_stagWat_prob_inOraround StagWatProbInOraroundHH

label define HumanFaeceVisibleInOraroundHH 1"Yes" 2"No"
label values Human_faece_visib_inOraround_HH HumanFaeceVisibleInOraroundHH

label define AnimShedPoultFarmExists 1"attached to the house" 2"detached from the house" 3"no animal shed/poultry farm"
label values Exis_anim_shed_poult_farm AnimShedPoultFarmExists

label define AnimPoultExcreDispo 1"to biogas plant" 2"manure pit" 3"used as fuel" 9"others" 4"not known"
label values Anim_poult_excre_dispo AnimPoultExcreDispo
 
label define FlyMosProb1yrHH 1"yes: severe" 2"yes: moderate" 3"no" 
label values HH_face_flymosqui_prob_1yr FlyMosProb1yrHH

label define FlyMosqSolvByLSGovt 1"yes" 2"No" 3"Not Known" 
label values Fly_mosq_solv_Loc_SteGovt_1yr FlyMosqSolvByLSGovt

label define FlyMosqSolvByHH 1"Yes" 2"No" 
label values Fly_mosq_solv_HH_365d FlyMosqSolvByHH

label define DiaDysChol 1"Yes" 2"No"
label values diarea_dysntry_cholera DiaDysChol

label define MalDenChikEnce 1"Yes" 2"No"
label values Malria_dengy_chikgnya_enceflits MalDenChikEnce

label define SkinDiseases 1"Yes" 2"No"
label values Skin_diseases SkinDiseases

label define Jaundice 1"Yes" 2"No"
label values Jaundice Jaundice

label define OtherDiseases 1"Yes" 2"No"
label values Other_diseases OtherDiseases


save "E:\NSSO 76\L 06 Block 06.dta",replace





*Cleaning L 07  Block 07

use "E:\NSSO 76\L 07 Block 07.dta"


*dropping variable Blank
drop Blank

*Labelling variables of L 07 Block 07
label variable Common_ID "Common ID"
label variable Level "Level"
label variable Filler "Filler"
label variable Dwell_type "Type of the dwelling"
label variable Live_room_no "Number of living rooms"
label variable Other_room_no  "Number of other rooms"
label variable Live_room_flr_area "Floor area- living rooms"
label variable Other_room_flr_area"Floor area- other rooms"
label variable covrd_veran_flr_area  "Floor area- covered veranda"
label variable uncovrd_veran_flr_area"Floor area- uncovered veranda"
label variable Tot_flr_area  "Total (sum of items  4 to 7)"
label variable ventil_dwell "Ventilation of the dwelling unit"
label variable Tot_no_maried_coupl_HH "Total number of married couples in the household"
label variable no_maried_coupl_seprt_room "Number of married couples having separate room"
label variable Kitchen_type "Kitchen type"
label variable Fuel_type_cook  "Type of fuel used by household for cooking"
label variable Floor_type "Floor type"
label variable Wall_type  "Wall type"
label variable Roof_type "Roof type"
label variable Monthly_rent_Rs "If hired, monthly rent Rs."
label variable NSC "NSC"
label variable Multiplier "Multiplier"


*Assigning Value labels for L 07 Block 07
label define DwellType 1"independent house" 2"flat" 9"others"
label value Dwell_type DwellType

label define VentilTypeDwell 1"good" 2"satisfactory" 3"bad" 
label value ventil_dwell VentilTypeDwell

label define KitchenType 1"separate kitchen: with water tap" 2"separate kitchen: without water tap" 3"no separate kitchen"
label value Kitchen_type KitchenType

label define FuelTypeCooking 1"firewood, chips & crop residue " 2"LPG" 3"other natural gas" 4"dung cake" 5"kerosene" 6" coke/coal" 7"gobar gas" 8"other biogas" 9"charcoal" 10"electricity (incl. generated by solar or wind power generators)" 11"solar cooker" 19"others" 12"no cooking arrangement"
label value Fuel_type_cook FuelTypeCooking 

label define FloorType 1"mud" 2"bamboo / log" 3"wood / plank" 4"brick / stone / lime stone" 5"cement" 6"mosaic / tiles" 9"others"
label value Floor_type FloorType

label define WallType 1"grass/ straw/ leaves/ reeds/ bamboo, etc." 2" mud (with/without bamboo)/unburnt brick " 3"canvas / cloth" 4"other katcha" 5"timber" 6"burnt brick /stone/ lime stone" 7"iron or other metal sheet" 8"cement / RBC / RCC" 9"other pucca"
label value Wall_type WallType

label define RoofType 1"grass/ straw/ leaves/ reeds/ bamboo etc." 2"mud / unburnt brick" 3"canvas / cloth" 4"other katcha" 5"tiles / slate" 6"burnt brick / stone / lime stone" 7"iron / zinc /other metal sheet /asbestos sheet" 8"cement / RBC / RCC" 9"other pucca"
label value Roof_type RoofType


save "E:\NSSO 76\L 07 Block 07.dta", replace



*Cleaning L 07  Block 07

use "E:\NSSO 76\L 08 Block 08.dta"


*dropping variable Blank
drop Blank

*Labelling variables of L 07 Block 07
label variable Common_ID "Common ID"
label variable Level "Level"
label variable Filler "Filler"
label variable Stay_duratn_HH_prsnt_area"Duration of stay of the household in the present area"
label variable Prev_HH_locatn "Where the household was residing before coming to the present area"
label variable Prev_struc_type "Type of structure of accommodation availed immediately before coming to present area"
label variable Reason_move_new_locatn  "Reason for movement to the present area"
label variable no_membs_move_in_HH_last_365d "Number of members who moved into the household during the last 365 days"
label variable no_membs_move_out_HH_last_365d  "Number of members who moved out of  the household during the last 365 day"
label variable HH_head_docs_resid_stat "Does head of HH possess any documents of residence status in the present slum/squatter settlement"
label variable HH_receive_bene_slum_resid "Whether the household received any benefit as a dweller of present slum/squatter settlement"
label variable HH_attempt_move_out_slum  "Whether the household tried to move out of the present slum/squatter settlement"
label variable Main_reason "Main reason"
label variable NSC "NSC"
label variable Multiplier "Multiplier"


*Assigning Value labels for L 08 Block 08
label define StayDuratnHHPrsntArea 1"less than 1 year" 2"1 to 2 years" 3"2 to 5 years" 4"5 to 10 years" 5"10 to 20 years" 6"20 to 40 years" 7"40 to 60 years" 8"60 years or more" 10"not known"
label value Stay_duratn_HH_prsnt_area StayDuratnHHPrsntArea

label define PreviousHHLocation 1"in slum/squatter settlement of the same town" 2"in other areas of the same town" 3"in slum/squatter settlement of other town" 4"in other areas of other town" 5"village"
label value Prev_HH_locatn PreviousHHLocation

label define PrevStructureType 1"pucca" 2"semi -pucca" 3"katcha" 4"no dwelling" 
label value Prev_struc_type PrevStructureType

label define ReasonForMoveNewLocatn 1"free / low rent" 2"independent accommodation " 3"accommodation in better locality" 4"employment related reasons: proximity to place of work" 5"other employment related reasons" 9"others"
label value Reason_move_new_locatn ReasonForMoveNewLocatn

label define DocsOfResidStatus 1"ration card" 2"voter ID card" 3"passport" 4"any combination of ration card,voter ID card, passport" 5"none" 9"other"
label value HH_head_docs_resid_stat DocsOfResidStatus

label define BeneReceivdSlumResid 1"received allotment of land / tenement" 9"received other benefits " 2"received no benefit" 
label value HH_receive_bene_slum_resid BeneReceivdSlumResid 

label define AttemptToMoveOutOfSlum 1"Yes" 2"No"
label value HH_attempt_move_out_slum AttemptToMoveOutOfSlum

label define MainReason 1"better accommodation" 2"proximity to place of work" 3"social / religious factors" 9"others"
label value Main_reason


save "E:\NSSO 76\L 08 Block 08.dta", replace



*Operations on 19/05/2020
*creating states, HH_ID and merging blocks 1, 5, 6


*creating States for L 01 Block 01
use "E:\NSSO 76\L 01 Block 01.dta"

*renamimg and destringing NSS-region 
***so that using NSS_Region, we could operate as integers

rename NSS_Region str_NSS_Region

destring str_NSS_Region , gen(NSS_Region)


gen State = 1 if NSS_Region<15
replace State = 2 if inrange(NSS_Region, 21,22)
replace State = 3 if inrange(NSS_Region, 31,32)
replace State = 4 if NSS_Region==41
replace State = 5 if NSS_Region==51
replace State = 6 if inrange(NSS_Region, 61,62)
replace State = 7 if NSS_Region==71
replace State = 8 if inrange(NSS_Region, 81,85)
replace State = 9 if inrange(NSS_Region, 91,95)
replace State = 10 if inrange(NSS_Region, 101,102)
replace State = 11 if NSS_Region==111
replace State = 12 if NSS_Region==121
replace State = 13 if NSS_Region==131
replace State = 14 if inrange(NSS_Region, 141,142)
replace State = 15 if NSS_Region==151
replace State = 16 if NSS_Region==161
replace State = 17 if NSS_Region==171
replace State = 18 if inrange(NSS_Region, 181,184)
replace State = 19 if inrange(NSS_Region, 191,195)
replace State = 20 if inrange(NSS_Region, 201,202)
replace State = 21 if inrange(NSS_Region, 211,213)
replace State = 22 if inrange(NSS_Region, 221,223)
replace State = 23 if inrange(NSS_Region, 231,236)
replace State = 24 if inrange(NSS_Region, 241,245)
replace State = 25 if NSS_Region==251
replace State = 26 if NSS_Region==261
replace State = 27 if inrange(NSS_Region, 271,276)
replace State = 28 if inrange(NSS_Region, 281,283)
replace State = 29 if inrange(NSS_Region, 291,294)
replace State = 30 if NSS_Region==301
replace State = 31 if NSS_Region==311
replace State = 32 if inrange(NSS_Region, 321,322)
replace State = 33 if inrange(NSS_Region, 331,334)
replace State = 34 if NSS_Region==341
replace State = 35 if NSS_Region==351
replace State = 36 if inrange(NSS_Region, 361,362)
label define State 35 "Andaman & Nicobar Islands" 28 "Andhra Pradesh" ///
12 "Arunachal Pradesh" 18 "Assam" 10 "Bihar" 4 "Chandigarh" 22 "Chhattisgarh" ///
26 "Dadra & Nagar Haveli" 25 "Daman & Diu " 7 "Delhi" 30 "Goa" 24 "Gujarat" 6 "Haryana" ///
2 "Himachal Pradesh" 1 "Jammu & Kashmir " 20 "Jharkhand" 29 "Karnataka" 32 "Kerala" 31 "Lakshadweep" ///
23 "Madhya Pradesh" 27 "Maharashtra" 14 "Manipur" 17 "Meghalaya" 15 "Mizoram" 13 "Nagaland" 21 "Odisha" 34 "Puducherry" ///
3 "Punjab" 8 "Rajasthan" 11 "Sikkim" 33 "Tamil Nadu" 36 "Telangana" 16 "Tripura" 5 "Uttarakhand" 35 "Andaman & Nicobar Islands" 36 "Telengana" ///
9 "Uttar Pradesh" 19 "West Bengal"
label values State State

*dropping NSS_Region post state creation
drop NSS_Region Sector
*renaming NSS_Region back to string form
rename str_NSS_Region NSS_Region

***So now the Block 01 file reamins as original post state creation
save "E:\NSSO 76\L 01 Block 01.dta", replace
*******************************************************************



*creating HH_ID for L 05 Block 05
use "E:\NSSO 76\L 05 Block 05.dta"

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


save "E:\NSSO 76\L 05 Block 05.dta", replace 
*************************************************





*creating HH_ID for L 06 Block 06
use "E:\NSSO 76\L 06 Block 06.dta"

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

save "E:\NSSO 76\L 06 Block 06.dta", replace 
***********************************************************************

*Merging Block 5 to Block 6
use "E:\NSSO 76\L 05 Block 05.dta" 
merge 1:1 HH_ID using "E:\NSSO 76\L 06 Block 06.dta"
save "E:\NSSO 76\Block 5&6 Merge.dta" 

*Merging Block 01 to Block 5&6 Merge
use "E:\NSSO 76\L 01 Block 01.dta" 
merge 1:1 HH_ID using "E:\NSSO 76\Block 5&6 Merge.dta"
save "E:\NSSO 76\Block 1&5&6 Merge.dta" 
**********************************************************************************************



*Removing unnecessary variables from 1&5&6 Merge
use "E:\NSSO 76\Block 1&5&6 Merge.dta" 
drop sample_HH_no Sub_strtm
*destringing sector
destring Sector, gen (Rural_Urban)

save "E:\NSSO 76\Block 1&5&6 Merge.dta", replace
***********************************************************************************************


*Operations on 21/05/2020

*creaing HH_ID in block 03
use "E:\NSSO 76\L 02 Block 03.dta"

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
 
save "E:\NSSO 76\L 02 Block 03.dta", replace
**************************************************************


*Merging Blocks 1 and 3
use "E:\NSSO 76\L 01 Block 01.dta"
merge 1:m HH_ID using "E:\NSSO 76\L 02 Block 03.dta"
drop _merge
drop sample_HH_no Sub_strtm
save "E:\NSSO 76\Block 1&3 Merge.dta"
***************************************************


*creaing HH_ID in block 04
use "E:\NSSO 76\L 03 Block 04.dta"

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
 
save "E:\NSSO 76\L 03 Block 04.dta", replace
**************************************************************


*Merging Blocks 1 and 4
use "E:\NSSO 76\L 01 Block 01.dta"
merge 1:1 HH_ID using "E:\NSSO 76\L 03 Block 04.dta"
drop _merge
drop sample_HH_no Sub_strtm
save "E:\NSSO 76\Block 1&4 Merge.dta"
***************************************************


*creaing HH_ID in block 04 (item 15)
use "E:\NSSO 76\L 04 Block 04 (item 15).dta"

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
 
 *destringing sector
destring Sector, gen (Rural_Urban)


save "E:\NSSO 76\L 04 Block 04 (item 15).dta", replace
**************************************************************


*Merging Blocks 1 and 4 (item 15)
use "E:\NSSO 76\L 01 Block 01.dta"
merge 1:1 HH_ID using "E:\NSSO 76\L 04 Block 04 (item 15).dta"
drop _merge
drop sample_HH_no Sub_strtm
save "E:\NSSO 76\Block 1&4(item 15) Merge.dta"
***************************************************








*creaing HH_ID in block 08
use "E:\NSSO 76\L 08 Block 08.dta"

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
 
save "E:\NSSO 76\L 08 Block 08.dta", replace
**************************************************************


*Merging Blocks 1 and 8
use "E:\NSSO 76\L 01 Block 01.dta"
merge 1:1 HH_ID using "E:\NSSO 76\L 08 Block 08.dta"
drop _merge
drop sample_HH_no Sub_strtm
save "E:\NSSO 76\Block 1&8 Merge.dta"
***************************************************


Operations as on 19/06/2020

*Correcting tabs using correct state code for Telangana 
*Block 3
tab Gen_ed_lev [iw= Multiplier /100] if State==36
tab Gender [iw= Multiplier /100] if State==36
tab use_latrine [iw= Multiplier /100] if State==36
tab type_latrine [iw= Multiplier /100] if State==36
tab latrine_only_HH [iw= Multiplier /100] if State==36
tab reason_No_latrine [iw= Multiplier /100] if State==36

*Block 4
tab Sc_grp [iw= Multiplier /100] if State==36
tab Relgn [iw= Multiplier /100] if State==36
tab Land_owned [iw= Multiplier /100] if State==36
tab Tenur_dwell_stat [iw= Multiplier /100] if State==36
tab Dwell_locat_type [iw= Multiplier /100] if State==36

*Block 4 item 15
tab Dwat_benefit [iw= Multiplier /100] if State==36
tab Dwat_ben_last3_years [iw= Multiplier /100] if State==36
tab Dwat_ben_scheme [iw= Multiplier /100] if State==36
tab Sani_benefit [iw= Multiplier /100] if State==36
tab Sani_ben_last3_years [iw= Multiplier /100] if State==36
tab Sani_ben_scheme [iw= Multiplier /100] if State==36

*Block 5A
tab Dwat_P_source [iw= Multiplier /100] if State==36
tab Dwat_suff_1yr [iw= Multiplier /100] if State==36
tab Dwat_P_source_access [iw= Multiplier /100] if State==36
tab Dwat_P_source_Dist [iw= Multiplier /100] if State==36
tab Stag_wat_Dwat_source [iw= Multiplier /100] if State==36
tab Dwat_S_source [iw= Multiplier /100] if State==36
tab Dwat_treat_method [iw= Multiplier /100] if State==36


*Block 5D
tab Latrine_access [iw= Multiplier /100] if State==36
tab Latrine_type [iw= Multiplier /100] if State==36
tab BathR_Latrine_inHH [iw= Multiplier /100] if State==36
tab excre_empty [iw= Multiplier /100] if State==36
tab who_empty_excre [iw= Multiplier /100] if State==36
tab excre_dispo_locat [iw= Multiplier /100] if State==36
tab excre_empty_freq [iw= Multiplier /100] if State==36
tab Child_less_3yr_excre_dispo [iw= Multiplier /100] if State==36
tab Latrine_wat_avail [iw= Multiplier /100] if State==36

*Block 5E
tab HandW_bef_meal [iw= Multiplier /100] if State==36
tab HandW_aft_defec [iw= Multiplier /100] if State==36

*Block 6
tab HH_drain_type [iw= Multiplier /100] if State==36
tab HH_waste_wat_dispo [iw= Multiplier /100] if State==36
tab HH_garb_dispo_place [iw= Multiplier /100] if State==36
tab HH_garb_agency_collect [iw= Multiplier /100] if State==36
tab Garb_collect_freq [iw= Multiplier /100] if State==36
tab HH_stagWat_prob_inOraround [iw= Multiplier /100] if State==36
tab Human_faece_visib_inOraround_HH [iw= Multiplier /100] if State==36
tab HH_face_flymosqui_prob_1yr [iw= Multiplier /100] if State==36
tab Fly_mosq_solv_Loc_SteGovt_1yr [iw= Multiplier /100] if State==36
tab Fly_mosq_solv_HH_365d [iw= Multiplier /100] if State==36
tab diarea_dysntry_cholera [iw= Multiplier /100] if State==36
tab Malria_dengy_chikgnya_enceflits [iw= Multiplier /100] if State==36
tab Skin_diseases [iw= Multiplier /100] if State==36
tab Jaundice [iw= Multiplier /100] if State==36
tab Other_diseases [iw= Multiplier /100] if State==36
 

***************************************************************************************************
*operations as on 18/06/2020
* MLogit operations as on 18/06/2020

*reducing Block1&3&4 into 106,838 individuals ie HH heads
drop if Relate_Head!=1
* n = 106,838

*Merging 134 with 156
merge 1:1 HH_ID using "E:\NSSO 76\Block 1&5&6 Merge.dta"

*156 has only 106,837 values. one extra from master doesnt look appropriat in br command
drop if _merge==1
drop _merge


*droppping unnecessary variables
drop Centr_Round FSU Round Schedule Sample Sector NSS_Region District Stratum Sub_stratum Sub_Round FOD_Sub_Reg Scnd_stg_strtm Sample_HH_no Level Filler Sl_No_Informant Response_Code Survey_Code Reason_for_subs NSC
drop Common_ID Dwat_suff_1yr Dwat_insuff_Jan Dwat_insuff_Feb Dwat_insuff_Mar Dwat_insuff_Apr Dwat_insuff_May Dwat_insuff_June Dwat_insuff_July Dwat_insuff_Aug Dwat_insuff_Sep Dwat_insuff_Oct Dwat_insuff_Nov Dwat_insuff_Dec
drop Flood_prev_5yrs HH_road_opens Electri_wire_type HH_dom_use_electri Struc_conditn Complet_yr Start_yr Built_since
drop Dwat_treat_method Dwat_contnr_matril Dwat_store_time Dwat_store_coverd Dwat_contnr_take_out Wat_suff_1yr Wat_supply_freq Wat_supply_meter Wat_monthly_charge_info Wat_monthly_charge_paid_Rs
drop Source_fin_1 Source_fin_2 Source_fin_3 Source_fin_4 Dist_work_M Dist_work_F Dist_work_TransG
drop Exis_anim_shed_poult_farm Anim_poult_excre_dispo Human_faece_visib_inOraround_HH HH_stagWat_prob_inOraround Garb_collect_freq
drop Other_diseases Jaundice Skin_diseases Malria_dengy_chikgnya_enceflits diarea_dysntry_cholera Fly_mosq_solv_Loc_SteGovt_1yr Fly_mosq_solv_HH_365d HH_face_flymosqui_prob_1yr excre_dispo_charge_Rs excre_empty_freq who_empty_excre excre_dispo_locat
drop Per_Srl_No
drop Dwat_per_fetch Dwat_fetch_time Dwat_fetch_wait_time Dwat_fetch_trips Child_less_3yr_excre_dispo excre_empty Dwat_P_source_Dist

*saving Mlogit file
save "E:\NSSO 76\MLogit.dta"
****************************************************************************************************************************************************************

 



*Operations on 23/06/2020
*Creating district variables for tabulating population distribution in sample
merge 1:1 HH_ID using"E:\NSSO 76\Block 1&4 Merge.dta", keepusing( District )
drop _merge
encode District, gen(District_num)
drop District
*tabulation of poulation district wise
tab District_num Rural_Urban [iw= Multiplier /100] if State ==36, r nof
tab District_num Rural_Urban [iw= Multiplier* HH_size /100] if State ==36, r nof
tab District_num [iw= Multiplier* HH_size /100] if State ==36



*Operations on 24/06/2020
*Creation of Poverty line with Base year 2011-2012 for only Telangana
gen CPI_oct_2018= 147.1 if State==36 & Rural_Urban==1
replace CPI_oct_2018= 138.4 if State==36 & Rural_Urban==2 

*Deflating MHCE to base year 2012 index (Base Index=100)
gen Deflated_MHCE=MHCE*100/CPI_oct_2018 if State==36

*creating deflated MPCE
gen Deflated_MPCE= Deflated_MHCE/ HH_size

*creating Poverty line as per rangarajan
*Rural BP =972
*urban BP=1407
gen poverty_line=1 if Deflated_MPCE<=972 & Rural_Urban==1
replace poverty_line=1 if Deflated_MPCE<=1407 & Rural_Urban==2
replace poverty_line=2 if Deflated_MPCE>972 & Rural_Urban==1 & State==36
replace poverty_line=2 if Deflated_MPCE>1407 & Rural_Urban==2 & State==36
label variable poverty_line "Poverty Line"


*creating Poverty line as 10th percentile of Deflated MPCE
*Rural BP =2027.872
*urban BP=3612.717
gen pov_10=1 if Deflated_MPCE<=991.6723 & Rural_Urban==1 & State==36
replace pov_10=1 if Deflated_MPCE<=1589.595 & Rural_Urban==2 & State==36
replace pov_10=2 if Deflated_MPCE> 1589.595 & Rural_Urban==2 & State==36
replace pov_10=2 if Deflated_MPCE>991.6723 & Rural_Urban==1 & State==36

*labelling Poverty Line
label define Poverty_Line 1"Below Poverty" 2"Above Poverty"
label values pov_10 Poverty_Line
label values poverty_line Poverty_Line

*labelling Rural_Urban
label define Rural_Urban 1"Rural" 2"Urban"
label values Rural_Urban Rural_Urban


*Operations on 26/06/2020
tab Land_owned_recoded [iw=Multiplier/100] if State==36
tab Gen_ed_lev_recoded [iw=Multiplier/100] if State==36
tab Gender_recoded [iw=Multiplier/100] if State==36
tab lat_access_recoded [iw=Multiplier/100] if State==36
tab HH_garb_dispo_place_recoded [iw=Multiplier/100] if State==36
tab Dwat_access_recoded [iw=Multiplier/100] if State==36
tab Dwell_locat_type_recoded [iw=Multiplier/100] if State==36
tab Tenur_dwell_stat_recoded [iw=Multiplier/100] if State==36























**********************************************************LOGIT REGRESSION CODES****************************************************************
*recoding Gen_ed_lev
 recode Gen_ed_lev (1/5=1 "Not Literate") (6/8=2 "Primary") (10/13=3 "Secondary") (14/16=4 "Tertiary"), gen (Gen_ed_lev_recoded)
 label variable Gen_ed_lev_recoded "Education of HH Head"
 
*recoding Gender
 recode Gender (1=1 "Male") (2/3=2 "Female"), gen (Gender_recoded)
 label variable Gender_recoded "Gender of HH Head"
 
*recoding Latrine Access for Logistic
 recode Latrine_access (1=1 "exclusive use of household") (2/4=2 "Common Latrine") (5=3 "No Latrine") (9=2), gen (lat_access_recoded)
 label variable lat_access_recoded "Access to Latrine"
 
*recoding Land Owned as per NSS 70 report
recode Land_owned (1=1 "Landless") (2/5=2 "Marginal") (6=3 "Small") (7/12=4 "Large") (99=1) (else=0 "Everything else"), gen (Land_owned_recoded)
label variable Land_owned_recoded "Land Owned"

*recoding HH garbage disposal location
recode HH_garb_dispo_place (1/2=1 "Exclusive HH Spot") (3/9=2 "Common Spot")  (else=0 "Everything Else"), gen (HH_garb_dispo_place_recoded)
label variable HH_garb_dispo_place_recoded "Place of Disposal of HH Garbage"

*recoding Dwat P Source Access
recode Dwat_P_source_access (1=1 "Exclusive HH Use") (2/7=2 "Common Use") (9=3 "Others") (else=0 "Everything else"), gen (Dwat_access_recoded)
label variable Dwat_access_recoded "Access to Drinking Water" 

 *recoding Dwelling status
 recode Dwell_locat_type (1/3=1 "Slum") (9=2 "Other Areas") (else=0 "Everything Else"), gen(Dwell_locat_type_recoded)
 label variable Dwell_locat_type_recoded "Type of Dwelling Location"
 
 *recoding Religion
 recode Relgn (1=1 "Hinduism") (2=2 "Islam") (3=3 "Christianity") (4/9=4 "Others") (else=0 "Everything else"), gen (Relgn_recoded)
 label variable Relgn_recoded "Religion"
 
 *recoding Tenurial Status
 recode Tenur_dwell_stat (1/2=1 "Owned") (3/9=2 "Hired") (else=0 "Everything else"), gen(Tenur_dwell_stat_recoded)
 label variable Tenur_dwell_stat_recoded "Tenurial Status of Dwelling"
****************************************************************************************************************************************************************
 
*MLogit Third Run
mlogit lat_access_recoded Age ib(1).Gender_recoded HH_size ib(1).Gen_ed_lev_recoded ib(1).Land_owned_recoded ib2.Rural_Urban#ib3.Sc_grp ib(2).Tenur_dwell_stat_recoded ib(1).Dwell_locat_type_recoded ib(2).poverty_line House_plinth if State==36 [iw= Multiplier /100], base(2) rrr allbase

mlogit HH_garb_dispo_place_recoded Age ib(1).Gender_recoded HH_size ib(3).Gen_ed_lev_recoded ib(2).Land_owned_recoded ib2.Rural_Urban#ib3.Sc_grp ib(2).Tenur_dwell_stat_recoded ib(2).Dwell_locat_type_recoded ib(2).poverty_line House_plinth if State==36 [iw= Multiplier /100], base(2) rrr allbase

mlogit Dwat_access_recoded Age ib(1).Gender_recoded HH_size ib(4).Gen_ed_lev_recoded ib(4).Land_owned_recoded ib1.Rural_Urban#ib9.Sc_grp ib(2).Tenur_dwell_stat_recoded ib(2).Dwell_locat_type_recoded ib(1).poverty_line House_plinth if State==36 [iw= Multiplier /100], base(3) rrr allbase

********************************************* 

global Indep_vars Age ib(1).Gender_recoded HH_size ib(1).Gen_ed_lev_recoded ib(1).Land_owned_recoded ib(2).Rural_Urban ib(3).Sc_grp ib2.Rural_Urban#ib3.Sc_grp
ib(2).Tenur_dwell_stat_recoded ib(1).Dwell_locat_type_recoded ib(2).poverty_line ib(2).poverty_line#ib(1).Gender_recoded House_plinth c.House_plinth#ib(2).Rural_Urban
c.House_plinth#ib(1).Gender_recoded c.House_plinth#ib(1).Gen_ed_lev_recoded ib(1).Land_owned_recoded#ib(3).Sc_grp ib(1).Gen_ed_lev_recoded#ib(3).Sc_grp



*MLogit 4th Run
global Indep_vars Age ib1.Gender_recoded HH_size ib1.Gen_ed_lev_recoded ib1.Land_owned_recoded ib2.Rural_Urban ib2.Rural_Urban#ib3.Sc_grp ib4.Relgn_recoded ib2.Tenur_dwell_stat_recoded ib1.Dwell_locat_type_recoded ib2.poverty_line House_plinth ib2.poverty_line#ib1.Gender_recoded c.House_plinth#ib2.Rural_Urban c.House_plinth#ib1.Gender_recoded c.House_plinth#ib1.Gen_ed_lev_recoded ib2.Tenur_dwell_stat_recoded#ib2.Rural_Urban ib1.Gender_recoded#ib2.Rural_Urban
mlogit lat_access_recoded $Indep_vars if State==36 [iw= Multiplier /100], base(2) rrr allbase

global Indep_vars Age ib1.Gender_recoded HH_size ib1.Gen_ed_lev_recoded ib1.Land_owned_recoded ib2.Rural_Urban ib3.Sc_grp ib2.Rural_Urban#ib3.Sc_grp ib4.Relgn_recoded ib2.Tenur_dwell_stat_recoded ib2.Dwell_locat_type_recoded ib2.poverty_line House_plinth ib2.poverty_line#ib1.Gender_recoded c.House_plinth#ib2.Rural_Urban c.House_plinth#ib1.Gender_recoded c.House_plinth#ib1.Gen_ed_lev_recoded ib2.Tenur_dwell_stat_recoded#ib2.Rural_Urban ib1.Gender_recoded#ib2.Rural_Urban  ib1.Gen_ed_lev_recoded#ib3.Sc_grp ib1.Land_owned_recoded# ib3.Sc_grp ib1.Land_owned_recoded# ib2.Rural_Urban
mlogit HH_garb_dispo_place_recoded $Indep_vars if State==36 [iw= Multiplier /100], base(2) rrr allbase

global Indep_vars Age ib1.Gender_recoded HH_size ib1.Gen_ed_lev_recoded ib1.Land_owned_recoded ib2.Rural_Urban ib3.Sc_grp ib2.Rural_Urban#ib3.Sc_grp ib4.Relgn_recoded ib2.Tenur_dwell_stat_recoded ib2.Dwell_locat_type_recoded ib2.poverty_line House_plinth ib2.poverty_line#ib1.Gender_recoded c.House_plinth#ib2.Rural_Urban c.House_plinth#ib1.Gender_recoded c.House_plinth#ib1.Gen_ed_lev_recoded ib2.Tenur_dwell_stat_recoded#ib2.Rural_Urban ib1.Gender_recoded#ib2.Rural_Urban  ib1.Gen_ed_lev_recoded#ib3.Sc_grp ib1.Land_owned_recoded# ib2.Rural_Urban
mlogit Dwat_access_recoded $Indep_vars if State==36 [iw= Multiplier /100], base(3) rrr allbase

***********************************



***Recoding House  Plinth***
recode House_plinth (0/2=1) (3/4=2) (5/6=3) (7/8=4) (9/10=6) (else=99), gen(House_plinth_recoded)

***Correlation between House Plinth, YHCE, Deflated MHCE & MPCE, Durable Goods Expenditure***
corr House_plinth Deflated_MPCE Deflated_MHCE YHCE_durab MHCE HH_size if State==36, m

tab2 House_plinth Sc_grp if State==36, chi cchi2
tab2 House_plinth Land_owned_recoded if State==36, chi cchi2
tab2 House_plinth poverty_line if State==36, chi cchi2
tab2 House_plinth Gen_ed_lev_recoded if State==36, chi cchi2

spearman House_plinth Sc_grp Land_owned Deflated_MHCE Deflated_MPCE YHCE_durab Gen_ed_lev_recoded Rural_Urban poverty_line  if State==36, stats(rho p) star(0.01) pw
ktau House_plinth Sc_grp Land_owned Deflated_MHCE Deflated_MPCE YHCE_durab Gen_ed_lev_recoded Rural_Urban poverty_line  if State==36, stats(taub p) star(0.01) pw


*************merge for FSU addition**********
use "E:\NSSO 76\MLogit.dta", clear
merge 1:1 HH_ID using "E:\NSSO 76\Block 1&8 Merge.dta", keepusing(FSU)
drop _merge
encode FSU, gen(fsu)
drop FSU
***********************************************

**************Erstwhile District Number**************
gen AP_dist_num=1 if State==36 & District_num==1
replace AP_dist_num=1 if State==36 & District_num==2
replace AP_dist_num=1 if State==36 & District_num==3
replace AP_dist_num=1 if State==36 & District_num==4
replace AP_dist_num=2 if State==36 & District_num==15
replace AP_dist_num=2 if State==36 & District_num==5
replace AP_dist_num=3 if State==36 & District_num==6
replace AP_dist_num=3 if State==36 & District_num==8
replace AP_dist_num=3 if State==36 & District_num==13
replace AP_dist_num=3 if State==36 & District_num==7
replace AP_dist_num=3 if State==36 & District_num==14
replace AP_dist_num=4 if State==36 & District_num==17
replace AP_dist_num=4 if State==36 & District_num==16
replace AP_dist_num=4 if State==36 & District_num==18
replace AP_dist_num=5 if State==36 & District_num==22
replace AP_dist_num=6 if State==36 & District_num==21
replace AP_dist_num=6 if State==36 & District_num==23
replace AP_dist_num=6 if State==36 & District_num==24
replace AP_dist_num=7 if State==36 & District_num==26
replace AP_dist_num=7 if State==36 & District_num==25
replace AP_dist_num=7 if State==36 & District_num==28
replace AP_dist_num=7 if State==36 & District_num==27
replace AP_dist_num=8 if State==36 & District_num==29
replace AP_dist_num=8 if State==36 & District_num==30
replace AP_dist_num=8 if State==36 & District_num==20
replace AP_dist_num=9 if State==36 & District_num==19
replace AP_dist_num=9 if State==36 & District_num==10
replace AP_dist_num=9 if State==36 & District_num==11
replace AP_dist_num=9 if State==36 & District_num==12
replace AP_dist_num=10 if State==36 & District_num==9
replace AP_dist_num=10 if State==36 & District_num==31
tab AP_dist_num
*********************************************************


***********M Logit 5th Run********************
global Indep_vars Age ib1.Gender_recoded HH_size ib1.Gen_ed_lev_recoded ib1.Land_owned_recoded ib2.Rural_Urban ib2.Rural_Urban#ib3.Sc_grp ib4.Relgn_recoded ib2.Tenur_dwell_stat_recoded ib1.Dwell_locat_type_recoded ib2.poverty_line House_plinth ib2.poverty_line#ib1.Gender_recoded c.House_plinth#ib2.Rural_Urban c.House_plinth#ib1.Gender_recoded c.House_plinth#ib1.Gen_ed_lev_recoded ib2.Tenur_dwell_stat_recoded#ib2.Rural_Urban ib1.Gender_recoded#ib2.Rural_Urban
mlogit lat_access_recoded $Indep_vars i.AP_dist_num if State==36 [iw= Multiplier /100], base(2) rrr allbase
*************************************************


*************************Vulnerability Index Creation*******************************
*****merging 5&6&Mlogit**********
merge 1:1 HH_ID using"E:\NSSO 76\Block 1&5&6 Merge.dta" , keepusing(Child_less_3yr_excre_dispo Human_faece_visib_inOraround_HH diarea_dysntry_cholera Malria_dengy_chikgnya_enceflits Skin_diseases Jaundice Other_diseases HH_stagWat_prob_inOraround HH_face_flymosqui_prob_1yr)
drop _merge
**********************************

***********VI creation per variable**********
*VI Lat_access
gen VI_lat_access=0 if lat_access_recoded==1
replace VI_lat_access=1 if lat_access_recoded==2
replace VI_lat_access=2 if lat_access_recoded==3
*VI Child Lat Use
gen VI_child_lat=0 if Child_less_3yr_excre_dispo==1 | Child_less_3yr_excre_dispo==2 | Child_less_3yr_excre_dispo==3 | Child_less_3yr_excre_dispo==7
replace VI_child_lat=1 if Child_less_3yr_excre_dispo==4 | Child_less_3yr_excre_dispo==5 | Child_less_3yr_excre_dispo==6 | Child_less_3yr_excre_dispo==9
*VI Lat water avail
gen VI_lat_wat=0 if Latrine_wat_avail==1
replace VI_lat_wat=1 if Latrine_wat_avail==2 | Latrine_wat_avail ==3
replace VI_lat_wat=2 if Latrine_wat_avail==4
*VI hand wash before meal
gen VI_handwash_meal=0 if HandW_bef_meal==1
replace VI_handwash_meal=1 if HandW_bef_meal==2 | HandW_bef_meal==3
replace VI_handwash_meal=2 if HandW_bef_meal==4
*VI hand wash after defecation
gen VI_handwash_defec=0 if HandW_aft_defec ==1
replace VI_handwash_defec=1 if HandW_aft_defec ==2| HandW_aft_defec==3
replace VI_handwash_defec=2 if HandW_aft_defec ==4
*VI excreta around HH
gen VI_excreta_around_HH=1 if Human_faece_visib_inOraround_HH==1
replace VI_excreta_around_HH=0 if Human_faece_visib_inOraround_HH==2
*VI diarrhea
gen VI_diarrhea=1 if diarea_dysntry_cholera ==1
replace VI_diarrhea=0 if diarea_dysntry_cholera ==2
* VI Malaria
gen VI_malaria=1 if Malria_dengy_chikgnya_enceflits==1
replace VI_malaria=0 if Malria_dengy_chikgnya_enceflits==2
*VI skin diseases
gen VI_skin=1 if Skin_diseases ==1
replace VI_skin=0 if Skin_diseases ==2
*VI other diseases
gen VI_other_disease=1 if Other_diseases ==1
replace VI_other_disease=0 if Other_diseases ==2
*VI jaundice
gen VI_jaundice=1 if Jaundice ==1
replace VI_jaundice=0 if Jaundice ==2 
*VI Stagnant water in and around HH
gen VI_Stag_wat=1 if HH_stagWat_prob_inOraround==1
replace VI_Stag_wat=0 if HH_stagWat_prob_inOraround==2
*VI Mosquito problem in HH
gen VI_mosq=2 if HH_face_flymosqui_prob_1yr ==1
replace VI_mosq=1 if HH_face_flymosqui_prob_1yr ==2
replace VI_mosq=0 if HH_face_flymosqui_prob_1yr ==3
*VI Waste water disposal
gen VI_wast_wat_dispo=0 if HH_waste_wat_dispo==1
replace VI_wast_wat_dispo=1 if HH_waste_wat_dispo>1
*****************************************************

*******************Creating Cumulative VI**********************
egen VI_Total=rowtotal( VI_lat_access VI_child_lat VI_lat_wat VI_handwash_meal VI_handwash_defec VI_excreta_around_HH VI_diarrhea VI_malaria VI_skin VI_jaundice VI_Stag_wat VI_mosq VI_wast_wat_dispo )

**Creating 4 Dimensions of VI
  egen VI_In_House= rowtotal(VI_lat_access VI_child_lat VI_lat_wat)
  egen VI_Behave= rowtotal(VI_handwash_meal VI_handwash_defec)
  egen VI_Micro= rowtotal(VI_excreta_around_HH VI_Stag_wat VI_mosq VI_wast_wat_dispo)
  egen VI_Diseases= rowtotal(VI_diarrhea VI_malaria VI_skin VI_jaundice)
******************************************************************************  
  
  
  
     
*****************************Graphing VI **********************************
*Akdensity of VI Total
	akdensity VI_revamp if State==36, bw(0.1)normal title(Vulnerability Index Distribution) subtitle(Across Households in Telangana in 2018) xtitle(Vulnerability Index) xscale(range(0 1)) xsize(6) xlabel(0(0.1)1) legend(position (3) ring(0)) clwidth(thick) clpattern(dash) xline( .3242677) text(.5 .2 "Mean VI =  .32" )
  
*********HBars for Mean VI*****
**BY Social Group and Gender
	graph bar (mean) VI_revamp if State==36 [pw= Multiplier /100], over ( Gender_recoded ) over ( Sc_grp, relabel(1 "ST" 2 "SC" 3 "OBC" 4 "Others") ///
	label(angle(0) labsize(medium)) ) title(Mean of Vulnerability Index) ytitle(Mean VI) ylabel(0(0.1)0.5) asyvars nofill legend(rows(1) position(2) ///
	ring(0) title(Gender,  size(small)) size(small))  blabel(bar, format(%4.0g)) b1title(Social Group)

**BY Education and Gender 
  graph bar (mean)  VI_Total if State==36 [pw= Multiplier /100], over ( Gender_recoded ) ///
  over ( Gen_ed_lev_recoded , label(angle(0) labsize(medium)) ) title(Mean of Vulnerability Score) ytitle(Mean VS) ylabel(0(1)6) ///
  asyvars nofill legend(rows(1) position(2) ring(0))  blabel(bar, format(%4.0g)) b1title(Gender, position(6))
  
**By Gender, Lat Access, Social Group
  graph bar (mean)  VI_Total if State==36 [pw= Multiplier /100], over ( Gender_recoded, gap(5)) ///
  over ( lat_access_recoded , relabel(1 "EHL" 2 "CL" 3 "NL") label(angle(0) labsize(small))) ///
  over( Sc_grp, relabel(1 "ST" 2 "SC" 3 "OBC" 4 "Others") ) title(Mean of Vulnerability Score) subtitle(Across Households of Telangana in 2018) ytitle(Mean VS) ylabel(0(1)8) ///
  asyvars nofill legend(rows(1) position(6) ring(1)title(Gender of HH Head, size(medium)))  blabel(bar, format("%4.1f") size(vsmall)) 

**By Gender, Lat Access, Education  
  graph bar (mean)  VI_Total if State==36 [pw= Multiplier /100], over ( Gender_recoded, gap(5)) ///
  over ( lat_access_recoded , relabel(1 "EHL" 2 "CL" 3 "NL") label(angle(0) labsize(small))) ///
  over( Gen_ed_lev_recoded) title(Mean of Vulnerability Score) subtitle(Across Households of Telangana in 2018) ytitle(Mean VS) ylabel(0(1)8) ///
  asyvars nofill legend(rows(1) position(6) ring(1)title(Gender of HH Head, size(medium)))  blabel(bar, format("%4.1f") size(vsmall))

**By Gender, Lat Access, Dwell locate  
  graph bar (mean)  VI_Total if State==36 [pw= Multiplier /100], over ( Gender_recoded, gap(5)) ///
  over ( lat_access_recoded , relabel(1 "EHL" 2 "CL" 3 "NL") label(angle(0) labsize(small))) ///
  over( Dwell_locat_type_recoded) title(Mean of Vulnerability Score) subtitle(Across Households of Telangana in 2018) ytitle(Mean VS) ylabel(0(1)8) ///
  asyvars nofill legend(rows(1) position(6) ring(1)title(Gender of HH Head, size(medium)))  blabel(bar, format("%4.1f") size(small))

**By Gender, Lat Access, Religion
  graph bar (mean)  VI_Total if State==36 [pw= Multiplier /100], over ( Gender_recoded, gap(5)) ///
  over ( lat_access_recoded , relabel(1 "EHL" 2 "CL" 3 "NL") label(angle(0) labsize(small))) ///
  over( Relgn_recoded) title(Mean of Vulnerability Score) subtitle(Across Households of Telangana in 2018) ytitle(Mean VS) ylabel(0(1)8) ///
  asyvars nofill legend(rows(1) position(6) ring(1)title(Gender of HH Head, size(medium)))  blabel(bar, format("%4.1f") size(vsmall))

**By Gender, Lat Access, Land Owned  
  graph bar (mean)  VI_Total if State==36 [pw= Multiplier /100], over ( Gender_recoded, gap(5)) ///
  over ( lat_access_recoded , relabel(1 "EHL" 2 "CL" 3 "NL") label(angle(0) labsize(small))) ///
  over( Land_owned_recoded) title(Mean of Vulnerability Score) subtitle(Across Households of Telangana in 2018) ytitle(Mean VS) ylabel(0(1)8) ///
  asyvars nofill legend(rows(1) position(6) ring(1)title(Gender of HH Head, size(medium)))  blabel(bar, format("%4.1f") size(vsmall))

**By Gender, Lat Access, Poverty Line
  graph bar (mean)  VI_Total if State==36 [pw= Multiplier /100], over ( Gender_recoded, gap(5)) ///
  over ( lat_access_recoded , relabel(1 "EHL" 2 "CL" 3 "NL") label(angle(0) labsize(small))) ///
  over( poverty_line) title(Mean of Vulnerability Score) subtitle(Across Households of Telangana in 2018) ytitle(Mean VS) ylabel(0(1)8) ///
  asyvars nofill legend(rows(1) position(6) ring(1)title(Gender of HH Head, size(medium)))  blabel(bar, format("%4.1f") size(vsmall))

**By Gender, Lat Access, Sector
  graph bar (mean)  VI_Total if State==36 [pw= Multiplier /100], over ( Gender_recoded, gap(5)) ///
  over ( lat_access_recoded , relabel(1 "EHL" 2 "CL" 3 "NL") label(angle(0) labsize(small))) ///
  over( Rural_Urban) title(Mean of Vulnerability Score) subtitle(Across Households of Telangana in 2018) ytitle(Mean VS) ylabel(0(1)8) ///
  asyvars nofill legend(rows(1) position(6) ring(1)title(Gender of HH Head, size(medium)))  blabel(bar, format("%4.1f") size(vsmall))
  
       
  
  
******************VI Dimensions****************  
**VI Dimensions Percentage Share
  graph pie VI_In_House- VI_Diseases if State==36 [pw= Multiplier /100], legend (rows(2) position(6) label(1 "Infrastructure Deficiency") label(2 "Hygiene risk") ///
  label(3 "Unsanitary Micro Environment") label(4 "Disease risk")) plabel(_all per, format(%4.0g)) title(Vulnerability Score) subtitle(Percentage Share of Dimensions)

**VI Dimensions Percentage Share by Social Group
  graph pie VI_In_House- VI_Diseases if State==36 [pw= Multiplier /100], xsize(6) by( Sc_grp, title(Vulnerability Score) ///
  subtitle(Percentage Share of Dimensions by Social Group)  legend (row(2) pos(6)))  legend(label(1 "Infrastructure Deficiency") ///
  label(2 "Hygiene risk") label(3 "Unsanitary Micro Environment") label(4 "Disease risk"))   plabel(1 per, format("%4.0f")size(small) gap(8)) ///
  plabel(2 per, format("%4.0f")size(small)) plabel(3 per, format("%4.0f") size(small)) plabel(4 per, format("%4.0f") size(small) gap(-5))

**VI Dimensions Percentage Share by Education 
  graph pie VI_In_House- VI_Diseases if State==36 [pw= Multiplier /100], xsize(6) by( Gen_ed_lev_recoded, title(Vulnerability Score) ///
  subtitle(Percentage Share of Dimensions by Education of HH Head)  legend (row(2) pos(6)))  legend(label(1 "Infrastructure Deficiency") ///
  label(2 "Hygiene risk") label(3 "Unsanitary Micro Environment") label(4 "Disease risk"))   plabel(1 per, format("%4.0f")size(small) gap(8)) ///
  plabel(2 per, format("%4.0f")size(small)) plabel(3 per, format("%4.0f") size(small)) plabel(4 per, format("%4.0f") size(small) gap(-5))

**VI Dimensions Percentage Share by Gender 
  graph pie VI_In_House- VI_Diseases if State==36 [pw= Multiplier /100], xsize(6) by( Gender_recoded, title(Vulnerability Score) ///
  subtitle(Percentage Share of Dimensions by Gender of HH Head)  legend (row(2) pos(6)))  legend(label(1 "Infrastructure Deficiency") ///
  label(2 "Hygiene risk") label(3 "Unsanitary Micro Environment") label(4 "Disease risk"))   plabel(1 per, format("%4.0f")size(small) gap(8)) ///
  plabel(2 per, format("%4.0f")size(small)) plabel(3 per, format("%4.0f") size(small)) plabel(4 per, format("%4.0f") size(small) gap(-5))

**VI Dimensions Percentage Share by Land Owned 
  graph pie VI_In_House- VI_Diseases if State==36 [pw= Multiplier /100], xsize(6) by( Land_owned_recoded, title(Vulnerability Score) ///
  subtitle(Percentage Share of Dimensions by Land Owned)  legend (row(2) pos(6)))  legend(label(1 "Infrastructure Deficiency") ///
  label(2 "Hygiene risk") label(3 "Unsanitary Micro Environment") label(4 "Disease risk"))   plabel(1 per, format("%4.0f")size(small) gap(8)) ///
  plabel(2 per, format("%4.0f")size(small)) plabel(3 per, format("%4.0f") size(small)) plabel(4 per, format("%4.0f") size(small) gap(-5))
  
**VI Dimensions Percentage Share by Poverty Line
  graph pie VI_In_House- VI_Diseases if State==36 [pw= Multiplier /100], xsize(6) by( poverty_line, title(Vulnerability Score) ///
  subtitle(Percentage Share of Dimensions by Poverty Line)  legend (row(2) pos(6)))  legend(label(1 "Infrastructure Deficiency") ///
  label(2 "Hygiene risk") label(3 "Unsanitary Micro Environment") label(4 "Disease risk"))   plabel(1 per, format("%4.0f")size(small) gap(8)) ///
  plabel(2 per, format("%4.0f")size(small)) plabel(3 per, format("%4.0f") size(small)) plabel(4 per, format("%4.0f") size(small) gap(-5))  
  
**VI Dimensions Percentage Share by Religion
  graph pie VI_In_House- VI_Diseases if State==36 [pw= Multiplier /100], xsize(6) by( Relgn_recoded, title(Vulnerability Index) ///
  subtitle(Percentage Share of Dimensions by Religion)  legend (row(2) pos(6)))  legend(label(1 "Infrastructure Deficiency") ///
  label(2 "Hygiene risk") label(3 "Unsanitary Micro Environment") label(4 "Disease risk"))   plabel(1 per, format("%4.0f")size(small) gap(8)) ///
  plabel(2 per, format("%4.0f")size(small)) plabel(3 per, format("%4.0f") size(small)) plabel(4 per, format("%4.0f") size(small) gap(-5))  
  
**VI Dimensions Percentage Share by Sector
  graph pie VI_In_House- VI_Diseases if State==36 [pw= Multiplier /100], xsize(6) by( Rural_Urban, title(Vulnerability Score) ///
  subtitle(Percentage Share of Dimensions by Sector)  legend (row(2) pos(6)))  legend(label(1 "Infrastructure Deficiency") ///
  label(2 "Hygiene risk") label(3 "Unsanitary Micro Environment") label(4 "Disease risk"))   plabel(1 per, format("%4.0f")size(small) gap(8)) ///
  plabel(2 per, format("%4.0f")size(small)) plabel(3 per, format("%4.0f") size(small)) plabel(4 per, format("%4.0f") size(small) gap(-5))  

  
**VI Dimensions Percentage Share by Type of Dwelling Location
  graph pie VI_In_House- VI_Diseases if State==36 [pw= Multiplier /100], xsize(6) by( Dwell_locat_type_recoded, title(Vulnerability Score) ///
  subtitle(Percentage Share of Dimensions by Type of Dwelling Location)  legend (row(2) pos(6)))  legend(label(1 "Infrastructure Deficiency") ///
  label(2 "Hygiene risk") label(3 "Unsanitary Micro Environment") label(4 "Disease risk"))   plabel(1 per, format("%4.0f")size(small) gap(8)) ///
  plabel(2 per, format("%4.0f")size(small)) plabel(3 per, format("%4.0f") size(small)) plabel(4 per, format("%4.0f") size(small) gap(-5))  
   
**VI Dimensions Percentage Share by Tenurial Status of Dwelling
  graph pie VI_In_House- VI_Diseases if State==36 [pw= Multiplier /100], xsize(6) by( Tenur_dwell_stat_recoded, title(Vulnerability Score) ///
  subtitle(Percentage Share of Dimensions by Tenurial Status of Dwelling)  legend (row(2) pos(6)))  legend(label(1 "Infrastructure Deficiency") ///
  label(2 "Hygiene risk") label(3 "Unsanitary Micro Environment") label(4 "Disease risk"))   plabel(1 per, format("%4.0f")size(small) gap(8)) ///
  plabel(2 per, format("%4.0f")size(small)) plabel(3 per, format("%4.0f") size(small)) plabel(4 per, format("%4.0f") size(small) gap(-5))  

***************************************************************************************************************************************************************

**recoding for JMP latrine type**********
recode Latrine_type (1/7=1 "Improved Latrine") (8=2 "Unimproved Latrine") (10=1) (19=2) , gen(JMP_Lat_type)
***************************

******tabs of VI*******
foreach var in VI_lat_access VI_child_lat VI_lat_wat VI_handwash_meal VI_handwash_defec VI_excreta_around_HH VI_diarrhea VI_malaria VI_skin VI_jaundice VI_Stag_wat VI_mosq VI_wast_wat_dispo {
tab `var' lat_access_recoded if State==36 [iw= Multiplier /100] , nof col
}
****************************


****************Extended model Poisson for VI*********************
global Indep_vars Age ib1.Gender_recoded HH_size ib1.Gen_ed_lev_recoded ib1.Land_owned_recoded ib2.Rural_Urban ib9.Sc_grp ib2.Rural_Urban#ib9.Sc_grp ib4.Relgn_recoded ib2.Tenur_dwell_stat_recoded ib2.Dwell_locat_type_recoded ib2.poverty_line House_plinth ib2.poverty_line#ib1.Gender_recoded c.House_plinth#ib2.Rural_Urban c.House_plinth#ib1.Gender_recoded c.House_plinth#ib1.Gen_ed_lev_recoded ib2.Tenur_dwell_stat_recoded#ib2.Rural_Urban ib1.Gender_recoded#ib2.Rural_Urban  ib1.Gen_ed_lev_recoded#ib9.Sc_grp ib1.Land_owned_recoded# ib9.Sc_grp ib1.Land_owned_recoded# ib2.Rural_Urban
poisson VI_Total $Indep_vars if State==36 [iw= Multiplier /100], allbase irr
*******************************************************

**************Simple Model Poisson for VI**************************
global Indep_vars Age ib1.Gender_recoded HH_size ib1.Gen_ed_lev_recoded ib1.Land_owned_recoded ib2.Rural_Urban ib9.Sc_grp  ib4.Relgn_recoded ib2.Tenur_dwell_stat_recoded ib2.Dwell_locat_type_recoded ib2.poverty_line House_plinth
poisson VI_Total $Indep_vars if State==36 [iw= Multiplier /100], allbase irr
******************************************************************



*********************VS Revamp*************************************
gen VI_revamp= ((VI_Total-0)/(14-0))
******************************************************************

**************Simple OLS Model VI_revamp**************************
global Indep_vars Age ib1.Gender_recoded HH_size ib1.Gen_ed_lev_recoded ib1.Land_owned_recoded ib2.Rural_Urban ib9.Sc_grp  ib4.Relgn_recoded ib2.Tenur_dwell_stat_recoded ib2.Dwell_locat_type_recoded ib2.poverty_line House_plinth
reg VI_revamp $Indep_vars if State==36, allbase vce(robust)
outreg2 using "E:\NSSO 76\Vulnerability Index\Vulnerability Index Tabs.rtf", word 
******************************************************************



**********************************CEM for SBM HH*********************************

**merging with Item 15 for bringing in sanitation scheme benefit received by households
merge 1:1 HH_ID using "E:\NSSO 76\Block 1&4(item 15) Merge.dta" , keepusing (Sani_benefit Sani_ben_scheme)
drop _merge

**creating treatment dummy for HH which received SBM benefits
gen SBM_treat= 1 if Sani_ben_scheme==1
replace SBM_treat= 0 if Sani_ben_scheme>1
label variable SBM_treat "Treatment Effect of SBM"

**CEM For SBM HH
cem Gender_recoded Gen_ed_lev_recoded Land_owned_recoded Rural_Urban Sc_grp  Relgn_recoded Tenur_dwell_stat_recoded ///
Dwell_locat_type_recoded poverty_line if State==36, treatment(SBM_treat)

***SBM Causal effect Difference EStimator
global Indep_vars Age ib1.Gender_recoded HH_size ib1.Gen_ed_lev_recoded ib1.Land_owned_recoded ib2.Rural_Urban ib9.Sc_grp  ib4.Relgn_recoded ib2.Tenur_dwell_stat_recoded ib2.Dwell_locat_type_recoded ib2.poverty_line House_plinth
reg VI_revamp SBM_treat $Indep_vars if State==36, allbase 
estimate store BeforeCEM
reg VI_revamp SBM_treat Age HH_size House_plinth if State==36 & cem_matched==1 [iw= cem_weights ], allbase
est store PostCEM
esttab BeforeCEM PostCEM using "E:\NSSO 76\Vulnerability Index\CEM reg.rtf", title("Treatment Effect of SBM on Vulnerability Index") ///
mtitle("Without CEM" "Post CEM") replace label addnotes("Coefficients with value zero represents base level categories") r2(%3.2f) ///
se(%5.2f)

***PSM for SBM HH
*global Indep_vars Age ib1.Gender_recoded HH_size ib1.Gen_ed_lev_recoded ib1.Land_owned_recoded ib2.Rural_Urban ib9.Sc_grp  ib4.Relgn_recoded ib2.Tenur_dwell_stat_recoded ib2.Dwell_locat_type_recoded ib2.poverty_line House_plinth

*psmatch2 SBM_treat Age ib1.Gender_recoded HH_size ib1.Gen_ed_lev_recoded ib1.Land_owned_recoded ib2.Rural_Urban ib9.Sc_grp  ///
*ib4.Relgn_recoded ib2.Tenur_dwell_stat_recoded ib2.Dwell_locat_type_recoded ib2.poverty_line House_plinth if cem_matched==1, outcome(VI_revamp) neighbor(1)
