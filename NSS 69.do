* Merging of Blocks of NSS 69

*merging block 1 and 3.2
use "E:\NSS 69\Block - 1 Identification of sample household - level 1.dta" 
merge 1:1 Key_hhold using"E:\NSS 69\Block - 3 Household characteristics - level 2.dta"


save "E:\NSS 69\Block 1&3.2 Merged.dta"



*merging block 1 and 3.3
use "E:\NSS 69\Block - 1 Identification of sample household - level 1.dta" 
merge 1:1 Key_hhold using"E:\NSS 69\Block - 3  Household characteristics - level 3.dta"


save "E:\NSS 69\Block 1&3.3 Merged.dta"



*merging block 1 and 4
use "E:\NSS 69\Block - 1 Identification of sample household - level 1.dta" 
merge 1:1 Key_hhold using"E:\NSS 69\Block - 4 Particulars of living facilities - drinking water, bathroom, sanitation etc - level 4.dta"


save "E:\NSS 69\Block 1&4 Merged.dta"


*merging block 1 and 5
use "E:\NSS 69\Block - 1 Identification of sample household - level 1.dta" 
merge 1:1 Key_hhold using"E:\NSS 69\Block - 5 housing characteristics and micro environment - level 5.dta"


save "E:\NSS 69\Block 1&5 Merged.dta"



*merging block 1 and 6
use "E:\NSS 69\Block - 1 Identification of sample household - level 1.dta" 
merge 1:1 Key_hhold using"E:\NSS 69\Block - 6 Pariculars of the dwelling - level 6.dta"


save "E:\NSS 69\Block 1&6 Merged.dta"



*merging block 1 and 7
use "E:\NSS 69\Block - 1 Identification of sample household - level 1.dta" 
merge 1:1 Key_hhold using"E:\NSS 69\Block - 7 some general particulars of the households - level 7.dta"


save "E:\NSS 69\Block 1&7 Merged.dta"



*creating Telangana
encode District, gen(District_num)
gen Telg=cond( District_num<11, 26, 0)  if State_code =="28"

*operations on 12/06/2020
*destringing latrine tyep
encode b4_q24, gen (Latrine_type)
*labelling Type of Latrine
label define TypeOfLatrine 1"flush/pour-flush to: piped sewer system" 2"septic tank" 3"pit latrine" 4"elsewhere (open drain,open pit, open field, etc)" 5"ventilated improved pit latrine" ///
6"pit latrine with slab" 7"pit latrine without slab/open pit" 8"composting toilet" 9"others" 10"not used"
label values Latrine_type TypeOfLatrine


*in Block1&3.2
*destringing social group
encode b3_q12 , gen (Sc_grp)

*labelling area type of settlement
rename b3_q15 Dwell_area_type
label define DwellAreaType 1"notified slum" 2"non-notified slum" 3"squatter settlement" 9"other areas"
label values Dwell_area_type DwellAreaType

*in block 1&5
*labelling waste_wat_HH_dispo
encode b5_q9, gen (waste_wat_HH_dispo) 
label define DispoWasteWat 1"safe re-use after treatment" 2"disposed off without treatment to: open low land areas" 3"ponds" 4"nearby river" 5"drainage system" 6"not known" 9"disposed off with or without treatment to other places"
label values waste_wat_HH_dispo DispoWasteWat


*operations on 13/06/2020
*in block 1
* encoding sector
encode Sector, gen(Rural_Urban)
label define Sector 1"Rural" 2"Urban"
label values Rural_Urban Sector

***DONT RUN***
*tabeling HH in Telg districts in 69th round
preserve
drop if State_code!="28"
bysort District_num Rural_Urban : tab Key_hhold if Telg==26
restore

*****************************************************************************
*Operations on 19/06/2020
*Creating Mlogit data set
use "E:\NSS 69\Block 1&3.2 Merged.dta"
merge 1:1 Key_hhold using "E:\NSS 69\Block 1&3.3 Merged.dta"
drop _merge
merge 1:1 Key_hhold using "E:\NSS 69\Block 1&4 Merged.dta"
drop _merge
merge 1:1 Key_hhold using "E:\NSS 69\Block 1&5 Merged.dta"
drop _merge
drop b1_q16 b1_q17 b1_q18 b1_q19 b3_q16 b3_q25_4 b3_q25_3 b3_q25_2 b3_q25_1 b4_q3_1 b4_q3_10 b4_q3_11 b4_q3_12 b4_q3_2 b4_q3_3 b4_q3_4 b4_q3_5 b4_q3_6 b4_q3_7 b4_q3_8 b4_q3_9 b4_q6 b4_q7 b4_q8
drop Gender_HH_head
drop b5_q15 b5_q14 b5_q13_2 b4_q13_1 b5_q10 b5_q9 b5_q8 b5_q7 b5_q6 b5_q5 b5_q4 b5_q3 b5_q2 b4_q32 b4_q31 b4_q30_4 b4_q30_3 b4_q30_2 b4_q30_1 b4_q29 b4_q28 b4_q27 b4_q26_4 b4_q26_3 b4_q26_2 b4_q26_1 b4_q22 b4_q20 b4_q19_2 b4_q19_1 b4_q18 b4_q17 b4_q16 b4_q14 b4_q13 b4_q12 b4_q11 b4_q10 b4_q9 b4_q5 b4_q2 b3_q24 b3_q23 b3_q21 b3_q20 b3_q19 b3_q18 b3_q17
drop Centre_Round FSU_Serial_No Round Sch_no Sample Sector State_region District Stratum Sub_Stratum_No Sub_Round Sub_Sample FOD_Sub_region Hg_sb_no Stage2Stratum Hhold_No Level
save "E:\NSS 69\Mlogit.dta"

rename Key_hhold KEY
rename b3_q11 Religion
rename b3_q22 MHCE
rename b3_q4 Gender_HH_head
rename b5_q1 HH_Plinth
encode b4_q4, gen(Dwat_Access)
rename b3_q12 Sc_Grp
encode Sector, gen (Rural_Urban)
encode b3_q4, gen (Gender_HH_Head)
encode b4_q23, gen (Latrine_Access)
encode b4_q13_1, gen (Exis_anim_shed_poult_farm)
encode b5_q11, gen( HH_Garb_Dispo)
encode Religion, gen(Relgn)
drop Religion
rename Land_possessed Land_owned
rename Dwell_area_type Dwell_locat_type
*creation of Highest education level in HH
encode b3_q6, gen(Edu_high_male)
encode b3_q7, gen(Edu_high_female)
egen HH_Edu_High= rowmax( Edu_high_male Edu_high_female )

label drop b4_q29
label drop b3_q5
label drop b3_q16
label drop b3_q14
label drop b3_q13

*Labelling Variables
label define Age_HH_Head 1 "Below 18 years" 2 "Above 18 years"
label values Age_HH_Head Age_HH_Head

label define Rural_Urban 1"Rural" 2"Urban"
label values Rural_Urban Rural_Urban

label define Gender_HH_Head 1 "male" 2 "female" 3 "third gender"
label values Gender_HH_Head Gender_HH_Head

label define Relgn 1"Hinduism" 2"Islam" 3"Christianity"  4"Sikhism" 5"Jainism" 6"Buddhism" 7"Zoroastrianism" 9"others"
label values Relgn Relgn
label define Relgn 8"Others", add

label define SocialGroup 1"scheduled tribe" 2"scheduled caste" 3"other backward class" 4"others"
label values Sc_grp SocialGroup

label define LandOwned 1"less than 0.005 hectare" 2"0.005 - 0.02 hectare" 3"0.02 - 0.21 hectare" 4"0.21 - 0.41 hectare" 5"0.41 - 1.01 hectare" 6"1.01 – 2.01 hectare" ///
7"2.01 – 3.01 hectare" 8"3.01 - 4.01 hectare" 10"4.01 - 6.01 hectare" 11"6.01 - 8.01 hectare" 12"greater than or equal to 8.01 hectare" 99"does not possess any land"
label values Land_owned LandOwned

label define TenurialStat 1"owned: freehold" 2"owned: leasehold" 3"hired: employer quarter" 4"hired dwelling unit with written contract" 5"hired dwelling unit without written contract" 6"no dwelling" 9"others"
label values Tenur_dwell_stat TenurialStat

label define DwellLocateType 1"notified slum" 2"non-notified slum" 3"squatter settlement" 9"other areas"
label values Dwell_locat_type DwellLocateType

label define Dwat_Access 1"exclusive use of household" 2"common use of households in the building" 3"neighbour’s source" ///
4"community use: public source restricted to particular community" 5"community use: public source unrestricted" 6"community use: private source restricted to particular community" ///
7"community use:  private source unrestricted" 9"others"
label values Dwat_Access Dwat_Access
label define Dwat_Access 8"others", add

label define HH_Garb_Dispo 1"bio-gas plant or manure pit" 2"household’s individual dumping spot(s)" 3"community dumping spot (vat, container, etc.)" 4"common place other than community dumping spot (open area/street/open drain)" 9"others" 5"not known"
label values HH_Garb_Dispo HH_Garb_Dispo

***************************************************************************************************************************************************************
*creation of Highest education level in HH
encode b3_q6, gen(Edu_high_male)
encode b3_q7, gen(Edu_high_female)
egen HH_Edu_High= rowmax( Edu_high_male Edu_high_female )

*creating deflated MPCE
gen MPCE= MHCE/ HH_size

*creating Poverty line as per rangarajan
*Rural BP =972
*urban BP=1407
gen poverty_line=1 if MPCE<=972 & Rural_Urban==1 & Telg==26
replace poverty_line=1 if MPCE<=1407 & Rural_Urban==2 & Telg==26
replace poverty_line=2 if MPCE>972 & Rural_Urban==1 & Telg==26
replace poverty_line=2 if MPCE>1407 & Rural_Urban==2 & Telg==26

*labelling Poverty Line
label define Poverty_Line 1"Below Poverty" 2"Above Poverty"
label values poverty_line Poverty_Line

***************************************************************************************************************************************************************
*recoding Latrine Access for Logistic
 recode Latrine_Access (1=1 "exclusive use of household") (2/4=2 "Common Latrine") (5=3 "No Latrine") (6=2), gen (lat_access_recoded)
  
*recoding Gender
 recode Gender_HH_Head (1=1 "Male") (2/3=2 "Female"), gen (Gender_HH_Head_recoded)
  
*recoding Land Owned as per NSS 70 report
recode Land_owned (1=1 "Landless") (2/5=2 "Marginal") (6=3 "Small") (7/12=4 "Large") (99=1) (else=0 "Everything else"), gen (Land_owned_recoded)

*recoding HH garbage disposal location
recode HH_Garb_Dispo (1/2=1 "Exclusive HH Spot") (3/9=2 "Common Spot")  (else=0 "Everything Else"), gen (HH_Garb_Dispo_recoded)

*recoding Dwat P Source Access
recode Dwat_Access (1=1 "Exclusive HH Use") (2/7=2 "Common Use") (8=3 "Others") (else=0 "Everything else"), gen (Dwat_Access_recoded)
 
 *recoding Dwelling status
 recode Dwell_locat_type (1/3=1 "Slum") (9=2 "Other Areas") (else=0 "Everything Else"), gen(Dwell_locat_type_recoded)
 
 *recoding Religion
 recode Relgn (1=1 "Hinduism") (2=2 "Islam") (3=3 "Christianity") (4/9=4 "Others") (else=0 "Everything else"), gen (Relgn_recoded)
 
 *recoding Tenurial Status
 recode Tenur_dwell_stat (1/2=1 "Owned") (3/9=2 "Hired") (else=0 "Everything else"), gen(Tenur_dwell_stat_recoded)

****************************************************************************************************************************************************************

*MLogit ******* Dont Run*********
mlogit lat_access_recoded Age ib(2).Gender_HH_Head HH_size ib(12).Land_possessed ib(3).Exis_anim_shed_poult_farm ib(1).Rural_Urban ib(9).Sc_grp ib(6).Tenur_dwell_stat ib(9).Dwell_area_type if Telg==26 [iw= Combined_Weight ], base(3) rrr

mlogit lat_access_recoded Age ib(2).Gender_HH_Head HH_size ib(12).Land_possessed ib(3).Exis_anim_shed_poult_farm ib(1).Rural_Urban ib(9).Sc_grp ib(6).Tenur_dwell_stat ib(9).Dwell_area_type [iw= Combined_Weight ], base(3) rrr
******************************************************************************************

*Mlogit 2nd Run
global Indep_vars ib1.Age_HH_Head ib1.Gender_HH_Head_recoded HH_size ib1.Land_owned_recoded ib2.Rural_Urban ib3.Sc_grp ib2.Rural_Urban#ib3.Sc_grp ib3.Relgn_recoded ib2.Tenur_dwell_stat_recoded ib2.Dwell_locat_type_recoded ib2.poverty_line ib2.poverty_line#ib1.Gender_HH_Head_recoded HH_Plinth c.HH_Plinth#ib2.Rural_Urban c.HH_Plinth#ib1.Gender_HH_Head_recoded ib2.Tenur_dwell_stat_recoded#ib2.Rural_Urban ib1.Gender_HH_Head_recoded#ib2.Rural_Urban ib1.Land_owned_recoded#ib2.Rural_Urban
mlogit lat_access_recoded $Indep_vars if Telg==26 [iw= Combined_Weight ], base(2) rrr allbase

global Indep_vars ib1.Age_HH_Head ib1.Gender_HH_Head_recoded HH_size ib1.Land_owned_recoded ib2.Rural_Urban ib3.Sc_grp ib2.Rural_Urban#ib3.Sc_grp ib1.Relgn_recoded ib2.Tenur_dwell_stat_recoded ib2.Dwell_locat_type_recoded ib1.poverty_line ib1.poverty_line#ib1.Gender_HH_Head_recoded HH_Plinth c.HH_Plinth#ib2.Rural_Urban c.HH_Plinth#ib1.Gender_HH_Head_recoded ib2.Tenur_dwell_stat_recoded#ib2.Rural_Urban ib1.Gender_HH_Head_recoded#ib2.Rural_Urban ib1.Land_owned_recoded#ib3.Sc_grp ib1.Land_owned_recoded#ib2.Rural_Urban
mlogit HH_Garb_Dispo_recoded $Indep_vars if Telg==26 [iw= Combined_Weight ], base(2) rrr allbase

global Indep_vars ib1.Age_HH_Head ib1.Gender_HH_Head_recoded HH_size ib1.Land_owned_recoded ib2.Rural_Urban ib3.Sc_grp ib2.Rural_Urban#ib3.Sc_grp ib2.Tenur_dwell_stat_recoded ib2.Dwell_locat_type_recoded ib2.poverty_line ib2.poverty_line#ib1.Gender_HH_Head_recoded HH_Plinth c.HH_Plinth#ib2.Rural_Urban c.HH_Plinth#ib1.Gender_HH_Head_recoded ib2.Tenur_dwell_stat_recoded#ib2.Rural_Urban ib1.Gender_HH_Head_recoded#ib2.Rural_Urban ib1.Land_owned_recoded# ib3.Sc_grp ib1.Land_owned_recoded#ib2.Rural_Urban
mlogit Dwat_Access_recoded $Indep_vars if Telg==26 [iw= Combined_Weight ], base(3) rrr allbase


*Margins and Postestimation
margins Gender_HH_Head_recoded , at( HH_Plinth =(1(2)10))
margins Gender_HH_Head_recoded , at( HH_Plinth =(1(2)10)) predict(outcome(Common_Use))

*Margins and Post Estimation
*Lat 1
margins Gender_HH_Head_recoded
margins Relgn_recoded
margins Land_owned_recoded
margins Tenur_dwell_stat_recoded
margins Dwell_locat_type_recoded
margins poverty_line
margins Sc_grp
margins Rural_Urban
margins Gender_HH_Head_recoded , at( HH_Plinth =(0(2)10))
margins Relgn_recoded , at( HH_Plinth =(0(2)10))
margins Land_owned_recoded , at( HH_Plinth =(0(2)10))
margins Tenur_dwell_stat_recoded , at( HH_Plinth =(0(2)10))
margins Dwell_locat_type_recoded , at( HH_Plinth =(0(2)10))
margins poverty_line , at( HH_Plinth =(0(2)10))
margins Sc_grp , at( HH_Plinth =(0(2)10))
margins Rural_Urban , at( HH_Plinth =(0(2)10))
margins , at( HH_Plinth =(0(2)10))
margins Age_HH_Head , at( HH_Plinth =(0(2)10))
margins Age_HH_Head
margins , at( HH_size =(1(5)40))
*Lat 2
margins Gender_HH_Head_recoded, predict(outcome(Common_Latrine))
margins Relgn_recoded, predict(outcome(Common_Latrine))
margins Land_owned_recoded, predict(outcome(Common_Latrine))
margins Tenur_dwell_stat_recoded, predict(outcome(Common_Latrine))
margins Dwell_locat_type_recoded, predict(outcome(Common_Latrine))
margins poverty_line, predict(outcome(Common_Latrine))
margins Sc_grp, predict(outcome(Common_Latrine))
margins Rural_Urban, predict(outcome(Common_Latrine))
margins Gender_HH_Head_recoded , at( HH_Plinth =(0(2)10))predict(outcome(Common_Latrine))
margins Relgn_recoded , at( HH_Plinth =(0(2)10))predict(outcome(Common_Latrine))
margins Land_owned_recoded , at( HH_Plinth =(0(2)10))predict(outcome(Common_Latrine))
margins Tenur_dwell_stat_recoded , at( HH_Plinth =(0(2)10))predict(outcome(Common_Latrine))
margins Dwell_locat_type_recoded , at( HH_Plinth =(0(2)10))predict(outcome(Common_Latrine))
margins poverty_line , at( HH_Plinth =(0(2)10))predict(outcome(Common_Latrine))
margins Sc_grp , at( HH_Plinth =(0(2)10))predict(outcome(Common_Latrine))
margins Rural_Urban , at( HH_Plinth =(0(2)10))predict(outcome(Common_Latrine))
margins , at( HH_Plinth =(0(2)10))predict(outcome(Common_Latrine))
margins Age_HH_Head , at( HH_Plinth =(0(2)10))predict(outcome(Common_Latrine))
margins Age_HH_Head predict(outcome(Common_Latrine))
margins , at( HH_size =(1(5)40)) predict(outcome(Common_Latrine))
*Lat 3
margins Gender_HH_Head_recoded , predict(outcome(No_Latrine))
margins Relgn_recoded , predict(outcome(No_Latrine))
margins Land_owned_recoded , predict(outcome(No_Latrine))
margins Tenur_dwell_stat_recoded , predict(outcome(No_Latrine))
margins Dwell_locat_type_recoded , predict(outcome(No_Latrine))
margins poverty_line , predict(outcome(No_Latrine))
margins Sc_grp , predict(outcome(No_Latrine))
margins Rural_Urban , predict(outcome(No_Latrine))
margins Age_HH_Head , predict(outcome(No_Latrine))
margins Gender_HH_Head_recoded , at( HH_Plinth =(0(2)10)) predict(outcome(No_Latrine))
margins Relgn_recoded , at( HH_Plinth =(0(2)10)) predict(outcome(No_Latrine))
margins Land_owned_recoded , at( HH_Plinth =(0(2)10))predict(outcome(No_Latrine))
margins Tenur_dwell_stat_recoded , at( HH_Plinth =(0(2)10))predict(outcome(No_Latrine))
margins Dwell_locat_type_recoded , at( HH_Plinth =(0(2)10))predict(outcome(No_Latrine))
margins poverty_line , at( HH_Plinth =(0(2)10))predict(outcome(No_Latrine))
margins Sc_grp , at( HH_Plinth =(0(2)10))predict(outcome(No_Latrine))
margins Rural_Urban , at( HH_Plinth =(0(2)10))predict(outcome(No_Latrine))
margins , at( HH_Plinth =(0(2)10))predict(outcome(No_Latrine))
margins Age_HH_Head , at( HH_Plinth =(0(2)10))predict(outcome(No_Latrine))
margins , at( HH_size =(1(5)40))predict(outcome(No_Latrine))


*HH_Garb 1
margins Gender_HH_Head_recoded
margins Relgn_recoded
margins Land_owned_recoded
margins Tenur_dwell_stat_recoded
margins Dwell_locat_type_recoded
margins poverty_line
margins Sc_grp
margins Rural_Urban
margins Gender_HH_Head_recoded , at( HH_Plinth =(0(2)10))
margins Relgn_recoded , at( HH_Plinth =(0(2)10))
margins Land_owned_recoded , at( HH_Plinth =(0(2)10))
margins Tenur_dwell_stat_recoded , at( HH_Plinth =(0(2)10))
margins Dwell_locat_type_recoded , at( HH_Plinth =(0(2)10))
margins poverty_line , at( HH_Plinth =(0(2)10))
margins Sc_grp , at( HH_Plinth =(0(2)10))
margins Rural_Urban , at( HH_Plinth =(0(2)10))
margins , at( HH_Plinth =(0(2)10))
margins Age_HH_Head , at( HH_Plinth =(0(2)10))
margins Age_HH_Head
margins , at( HH_size =(1(5)40))
*HH_Garb 2
margins Gender_HH_Head_recoded,predict(outcome(Common_Spot))
margins Relgn_recoded, predict(outcome(Common_Spot))
margins Land_owned_recoded, predict(outcome(Common_Spot))
margins Tenur_dwell_stat_recoded, predict(outcome(Common_Spot))
margins Dwell_locat_type_recoded, predict(outcome(Common_Spot))
margins poverty_line, predict(outcome(Common_Spot))
margins Sc_grp, predict(outcome(Common_Spot))
margins Rural_Urban, predict(outcome(Common_Spot))
margins Gender_HH_Head_recoded , at( HH_Plinth =(0(2)10)) predict(outcome(Common_Spot))
margins Relgn_recoded , at( HH_Plinth =(0(2)10))predict(outcome(Common_Spot))
margins Land_owned_recoded , at( HH_Plinth =(0(2)10))predict(outcome(Common_Spot))
margins Tenur_dwell_stat_recoded , at( HH_Plinth =(0(2)10))predict(outcome(Common_Spot))
margins Dwell_locat_type_recoded , at( HH_Plinth =(0(2)10))predict(outcome(Common_Spot))
margins poverty_line , at( HH_Plinth =(0(2)10))predict(outcome(Common_Spot))
margins Sc_grp , at( HH_Plinth =(0(2)10))predict(outcome(Common_Spot))
margins Rural_Urban , at( HH_Plinth =(0(2)10))predict(outcome(Common_Spot))
margins , at( HH_Plinth =(0(2)10))predict(outcome(Common_Spot))
margins Age_HH_Head , at( HH_Plinth =(0(2)10))predict(outcome(Common_Spot))
margins Age_HH_Head, predict(outcome(Common_Spot))
margins , at( HH_size =(1(5)40))predict(outcome(Common_Spot))
*Dwat 1
margins Gender_HH_Head_recoded
margins Land_owned_recoded
margins Tenur_dwell_stat_recoded
margins Dwell_locat_type_recoded
margins poverty_line
margins Sc_grp
margins Rural_Urban
margins Gender_HH_Head_recoded , at( HH_Plinth =(0(2)10))
margins Land_owned_recoded , at( HH_Plinth =(0(2)10))
margins Tenur_dwell_stat_recoded , at( HH_Plinth =(0(2)10))
margins Dwell_locat_type_recoded , at( HH_Plinth =(0(2)10))
margins poverty_line , at( HH_Plinth =(0(2)10))
margins Sc_grp , at( HH_Plinth =(0(2)10))
margins Rural_Urban , at( HH_Plinth =(0(2)10))
margins , at( HH_Plinth =(0(2)10))
margins Age_HH_Head , at( HH_Plinth =(0(2)10))
margins Age_HH_Head
margins , at( HH_size =(1(5)40))

marginsplot

*Dwat 2
margins Gender_HH_Head_recoded, predict(outcome(Common_Use))
margins Land_owned_recoded, predict(outcome(Common_Use))
margins Tenur_dwell_stat_recoded, predict(outcome(Common_Use))
margins Dwell_locat_type_recoded, predict(outcome(Common_Use))
margins poverty_line, predict(outcome(Common_Use))
margins Sc_grp, predict(outcome(Common_Use))
margins Rural_Urban, predict(outcome(Common_Use))
margins Gender_HH_Head_recoded , at( HH_Plinth =(0(2)10)) predict(outcome(Common_Use))
margins Land_owned_recoded , at( HH_Plinth =(0(2)10))predict(outcome(Common_Use))
margins Tenur_dwell_stat_recoded , at( HH_Plinth =(0(2)10))predict(outcome(Common_Use))
margins Dwell_locat_type_recoded , at( HH_Plinth =(0(2)10))predict(outcome(Common_Use))
margins poverty_line , at( HH_Plinth =(0(2)10))predict(outcome(Common_Use))
margins Sc_grp , at( HH_Plinth =(0(2)10))predict(outcome(Common_Use))
margins Rural_Urban , at( HH_Plinth =(0(2)10))predict(outcome(Common_Use))
margins , at( HH_Plinth =(0(2)10))predict(outcome(Common_Use))
margins Age_HH_Head , at( HH_Plinth =(0(2)10))predict(outcome(Common_Use))
margins Age_HH_Head, predict(outcome(Common_Use))
margins , at( HH_size =(1(5)40))predict(outcome(Common_Use))

marginsplot

*Dwat 3
margins Gender_HH_Head_recoded, predict(outcome(Others))
margins Land_owned_recoded, predict(outcome(Others))
margins Tenur_dwell_stat_recoded, predict(outcome(Others))
margins Dwell_locat_type_recoded, predict(outcome(Others))
margins poverty_line, predict(outcome(Others))
margins Sc_grp, predict(outcome(Others))
margins Rural_Urban, predict(outcome(Others))
margins Gender_HH_Head_recoded , at( HH_Plinth =(0(2)10)) predict(outcome(Others))
margins Land_owned_recoded , at( HH_Plinth =(0(2)10))predict(outcome(Others))
margins Tenur_dwell_stat_recoded , at( HH_Plinth =(0(2)10))predict(outcome(Others))
margins Dwell_locat_type_recoded , at( HH_Plinth =(0(2)10))predict(outcome(Others))
margins poverty_line , at( HH_Plinth =(0(2)10))predict(outcome(Others))
margins Sc_grp , at( HH_Plinth =(0(2)10))predict(outcome(Others))
margins Rural_Urban , at( HH_Plinth =(0(2)10))predict(outcome(Others))
margins , at( HH_Plinth =(0(2)10))predict(outcome(Others))
margins Age_HH_Head , at( HH_Plinth =(0(2)10))predict(outcome(Others))
margins Age_HH_Head, predict(outcome(Others))
margins , at( HH_size =(1(5)40))predict(outcome(Others))

marginsplot



***Correlation between House Plinth, YHCE, Deflated MHCE & MPCE, Durable Goods Expenditure***
 spearman HH_Plinth Sc_grp Land_owned  MHCE MPCE Rural_Urban poverty_line  if Telg==26, stats(rho p) star(0.01) pw
 ktau HH_Plinth Sc_grp Land_owned  MHCE MPCE Rural_Urban poverty_line if Telg==26, stats(taub p) star(0.01) pw

******************merging FSU*******************
merge 1:1 KEY using "E:\NSS 69\Block - 1 Identification of sample household - level 1.dta", keepusing( FSU_Serial_No )
drop _merge
encode FSU_Serial_No, gen(FSU)
drop FSU_Serial_No
***************************************************

***************District regions**************
gen dist_region=1 if Telg==26 & District_num==1
replace dist_region=1 if Telg==26 & District_num==2
replace dist_region=1 if Telg==26 & District_num==3
replace dist_region=2 if Telg==26 & District_num==4
replace dist_region=2 if Telg==26 & District_num==5
replace dist_region=2 if Telg==26 & District_num==6
replace dist_region=3 if Telg==26 & District_num==7
replace dist_region=3 if Telg==26 & District_num==8
replace dist_region=4 if Telg==26 & District_num==9
replace dist_region=4 if Telg==26 & District_num==10
******************************************************
