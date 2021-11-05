********Cleaning Primary************

********Section A*******************

import excel "E:\RUST\Mother\Section A.xlsx", sheet("Sheet1") firstrow case(lower)
drop submissiondate start today end deviceid subscriberid simserial phonenumber username email
drop sectionaintroduction
drop as
drop o
drop sectionarespondentplace_of_resi
drop w x y
drop sectionarespondentrespondent_wo ab ac ad
drop ag
drop sectionahh_membersnumber_hh_mem
drop ap aq ar

save "E:\RUST\Section A.dta"

*Renaming Varibles
rename sectionarespondentrespondent_na name
rename sectionarespondentrespondent_ag age
rename sectionarespondentrespondent_ge Gender
rename sectionarespondentrespondent_ma Marital_Stat
rename sectionarespondentresp_highest_ Gen_Ed
rename sectionarespondentrespondent_hi Gen_Ed_Specific
rename sectionarespondentrespondent_em Employed
rename sectionarespondentrespondent_ac Emp_Sector
rename u Emp_Sector_Specific
rename sectionarespondentmode_commutin Commute_Mode
rename sectionarespondentrespondent_mo Monthly_Income
rename sectionarespondentrespondent_re Religion
rename sectionarespondentrespondent_cl Sc_Grp
rename ai Sc_Grp_Specific
rename sectionahh_membershh_member_cou HH_Size
rename sectionaresidencerespondent_res Residence_Stat
rename an Residence_Stat_Specific
rename sectionaresidenceresp_own_secon Second_Residence_Stat
****Check whether its an id
rename setofsectionahh_membershh_mem HH_ID

*Labelling Variables
label variable name "Respondent Name"
label variable age "Respondent Age"
label variable Gender "Respondent Gender"
label variable Marital_Stat "Respondent Marital Status "
label variable Gen_Ed "Respondent Education "
label variable Gen_Ed_Specific "Respondent Education - Others "
label variable Employed "Respondent Employment status "
label variable Emp_Sector "Respondent Employment Sector "
label variable Emp_Sector_Specific "Respondent Employment Sector - others "
label variable Commute_Mode "Respondent travel mode to work "
label variable Monthly_Income "Respondent Monthly Income "
label variable Religion "Respondent Religion "
label variable Sc_Grp "Respondent Social Group "
label variable Sc_Grp_Specific "Respondent Social Group - others "
label variable HH_Size "Respondent HH Size "
label variable Residence_Stat "Respondent Residential Status "
label variable Residence_Stat_Specific "Respondent Residential Status - others "
label variable Second_Residence_Stat "Respondent second Residential Status  "

*Label Defining Variables
label define respondent_gender	1 "Transgender" 2 "Male" 3 "Female" 99 "Other"
label values Gender respondent_gender

label define mode_commuting	1 "On Foot" 2 "Bicycle" 3 "Own motorised vehicle (Moped/Scooter/Motorcycle/ Car/Jeep/Van)" 4 "Company Vehicle" 5 "Public transport (Tempo/Autorickshaw/Taxi/Bus/Train)" ///
6 "Water transport" 99 "Any other" 8 "No travel" 9999 "Not applicable"
label values Commute_Mode mode_commuting

label define marital_status	1 "Single" 2 "Married" 3 "Widowed" 4 "Separated" 5 "Divorced"
label values Marital_Stat marital_status

label define religion	1 "Hinduism" 2 "Islam" 3 "Christianity" 4 "Jainism" 5 "Buddhism" 6 "Atheist" 7 "Agnostic" 99 "Other"
label values Religion religion

label define Gen_Ed	1 "Pre-primary" 2 "1st class" 3 "2nd class" 4 "3rd class" 5 "4th class"	6 "5th class" 7 "6th class"	8 "7th class" 9 "8th class"	10 "9th class" 11 "10th class" ///
12 "11th class" 13 "12th class"	14 "Undergraduate" 15 "Masters level" 16 "Doctorate level" 17 "Illiterate" 99 "Other"
label values Gen_Ed Gen_Ed

label define Sc_Group 1	"General" 2 "OBC" 3 "SC" 4 "ST" 99 "Other"
label values Sc_Grp Sc_Group

label define Emp_Sector 1 "Cultivator (Manager of a farm or Farmer)" 2 "Agricultural labourer" 3 "Artisan" 4 "Building Construction" 5 "Own Private Business (example self-employed street vendor)" 6 "Government job" ///
7 "Academia" 8 "NGO" 9 "House-keeping" 99 "Other" 
label values Emp_Sector  Emp_Sector

label define Residence_Stat 1 "Owner" 2 "Tenant" 99 "Other"
label values Residence_Stat Residence_Stat


save "E:\RUST\Section A.dta", replace

********Section B*******************
import excel "E:\RUST\Mother\Section B.xlsx", sheet("Sheet2") firstrow
drop sectionbnotesociogeo 

*Renamimg Variables
rename sectionbr_residencerespondent_l Length_residence
rename sectionbr_residencerespondent_b Belong_Place
rename D Belong_Place_YesDetail
rename E Belong_Place_NoDetail
rename sectionbr_residencerespondent_r Reason_Living
rename sectionbcommunityrespondent_com Community_Member
rename sectionbcommunitynote_notgpmem Reason_Not_Comm_Mem
rename J Community_Type
rename L Community_Type_Specific
rename sectionbcommunitynote_gpmemgro Group_Act
rename sectionbcommunitynote_gpmemhel info_sani_hygeine
rename O Fin_construct_toilet
rename P Fin_dispo_excreta
rename Q Contact_Govt
rename R Contact_pvt_service_provider

*Labelling Variables
label variable Contact_pvt_service_provider "Group Helps to Contact Pvt Service Provider"
label variable Contact_Govt "Group Helps to contact Govt"
label variable Fin_dispo_excreta "Group Helps to Finance Excreta Disposal"
label variable Fin_construct_toilet "Group Helps to Finance Construction of Toilet"
label variable info_sani_hygeine "Group Provides Info on Sanitation and Hygeine"
label variable info_sani_hygeine "Group Provides Info on Sanitation and Hygiene"
label variable Group_Act "Group Activity"
label variable Community_Type_Specific "Other Specific Community Type"
label variable Community_Type "Respondent Community Type"
label variable Reason_Not_Comm_Mem "Reason for not being a community member"
label variable Community_Member "Respondent Community member or not"
label variable Reason_Living_Specific ""
label variable Reason_Living_Specific "Specific other reason for living in current residence"
label variable Reason_Living "Respondent's reason for living at current residence"
label variable Length_residence "Length of residence at current place by respondent"
label variable Belong_Place "Does respondent consider current residence as belonging place"
label variable Belong_Place_YesDetail "Detail if Yes for belonging place "
label variable Belong_Place_NoDetail "Details if No for belonging place"

*Label Defining Variables 
label define Length_residence 1 "Less than a 6 months" 2 "6 months-1 year" 3 "About 2 -3 years"  4 "About 4-6 years" 5 "About 7-9 years" 6  "10 – 15 years" 7 "15 – 25 years" 8 "25 years or more"
label values Length_residence Length_residence

label define Reason_Living 1 "Born here" 2 "Work here" 3 "Family, Marriage" 4 "Economic reasons (for example, people cannot afford to live elsewhere)" 5 "Religious reasons" 6 "Political reasons" 7 "Education reasons" ///
8 "No specific reason" 99 "Other"
label values Reason_Living Reason_Living
		
label define Reason_Not_Comm_Mem 1 "Just moved to area" 2 "Don’t want to" 3 "Not interested" 4 "Not eligible" 5 "Do not fit in/excluded" 6 "No community groups in the area." 7 "Don’t know of any groups in the area"
label values Reason_Not_Comm_Mem Reason_Not_Comm_Mem

label define Community_Type 1 "Women’s group (like Dwacra)" 2 "Caste-based livelihood group" 3 "Public worker employment group (lobbying union)" 4 "Farmers group" 99 "Other"
label values Community_Type Community_Type
***Ask cyril to check this
label define Group_Act 1 "Sanitation/Hygiene" 2 "Health initiatives" 3 "Microfinance" 4 "Livelihood skills " 5 "Other government-led initiatives/projects" 6 "Lobbying/union activities" 7 "Livelihood promotion, etc. marketing"
label values Group_Act Group_Act





save "E:\RUST\Section B.dta", replace
***********************************

*************Section C***(SBM)*************
drop sectioncnotesbm
 
*Renaming Variables 
rename sectioncsbmk_purpose_sbm Purpose_SBM
rename sectioncrespondent_benefit_from_ Subsidy_toilet_construct
rename D Edu_sani_hygiene
rename E Community_toilet_access
rename F Public_toilet_access
rename G Solid_waste_dispo
rename H Safe_access_toilets
rename I Privacy_toilet_use
rename J Improved_health
rename sectioncperception_of_sbmsbm_fi Fin_toilet_construct_inHH
rename sectioncperception_of_sbmsbm_pr Provision_pub_toilet
rename sectioncperception_of_sbmsbm_re Reduce_open_defec
rename sectioncperception_of_sbmsbm_be Better_toilet_women
rename sectioncperception_of_sbmsbm_di Treat_dispo_Hum_waste
rename P Treat_dispo_solid_waste

*Labelling Variables
label variable Treat_dispo_solid_waste "Satisfied with SBM: Treat and dispose solid waste"
label variable Treat_dispo_Hum_waste "Satisfied with SBM: Treat and dispose human waste"
label variable Better_toilet_women "Satisfied with SBM: Better toilet facility for women"
label variable Reduce_open_defec "Satisfied with SBM: Reduce open defecation"
label variable Provision_pub_toilet "Satisfied with SBM: Provision for more public toilets"
label variable Fin_toilet_construct_inHH "Satisfied with SBM: Finance constrcution of toilets within HH"
label variable Improved_health "Benefit from SBM: Improved Health "
label variable Privacy_toilet_use "Benefit from SBM: Improved Health "
label variable Safe_access_toilets "Benefit from SBM: Safer access to toilets"
label variable Solid_waste_dispo "Benefit from SBM: Better solid waste disposal"
label variable Public_toilet_access "Benefit from SBM: Better public toilet access"
label variable Community_toilet_access "Benefit from SBM: Better community toilet access"
label variable Edu_sani_hygiene "Benefit from SBM: Improved edu on sanitation and hygiene"
label variable Subsidy_toilet_construct "Benefit from SBM: Govt subsidy to bulid toilet"
label variable Purpose_SBM "Purpose of SBM"

*Label Defining Values
label define Purpose_SBM  1 "To supply electrical energy" 2 "To improve sanitation and solid waste management" 3 "To supply clean water" 4 "To provide telecommunication" 5 "To improve education" 0 "Don't Know"
label values Purpose_SBM Purpose_SBM

label define SBM_Satisfication 1 "Very Unsatisfied" 2 "Unsatisfied" 3 "Satisfied" 4 "Very Unsatisfied"
label values Fin_toilet_construct_inHH Provision_pub_toilet Reduce_open_defec Better_toilet_women Treat_dispo_Hum_waste Treat_dispo_solid_waste SBM_Satisfication 


save "E:\RUST\Section C.dta", replace
*****************************************

***************Section D*****************
import excel "E:\RUST\Mother\Section D.xlsx", sheet("D") firstrow
drop sectiondnotewater

*Renaming Variables
rename sectiondhh_water_usagedifferent Wat_Drink_Wash_source
rename sectiondhh_water_usagenumber_di Wat_supply_no
rename sectiondhh_water_usagewatersour Wat_source
rename sectiondhh_water_usagewater_col Wat_Collect_HH_Member
rename G Wat_Collect_Mem_Type
rename H Wat_Collect_Time
rename Wat_Collect_Time Wat_Collect_Freq
rename Wat_Collect_Freq Wat_Collect_time_taken
rename I Wat_Collect_time_taken_mins
rename J Wat_Collect_Day_time
rename K Wat_collect_time_reason
rename sectiondhh_water_usagequality_o Wat_qual_vary
*add rename for M N O P
rename Q Wat_Purification
rename R Wat_pur_process
rename S Wat_pur_expense
rename T Improv_Wat_service_exp_expect
rename U Obs_Eutro_Watbody

*Labelling Variables
label variable Obs_Eutro_Watbody "Eutrophication observed in nearby water bodies"
label variable Improv_Wat_service_exp_expect "Expected expense for improved water service"
label variable Improv_Wat_service_exp_expect "Expected expense for improved water service per month"
label variable Wat_pur_expense "Monthly water purification expense"
label variable Wat_pur_process "Water purification process"
*add label for M N O P
label variable Wat_Purification "Water purified or not"
label variable Wat_qual_vary "Water quality vary over the year?"
label variable Wat_collect_time_reason "Reason for collecting water at this time of day"
label variable Wat_Collect_Day_time "Time of day for collecting water"
label variable Wat_Collect_time_taken_mins "Time taken to collect water in mins"
label variable Wat_Collect_time_taken "Time taken to collect water"
label variable Wat_Collect_Mem_Type "HH member who collects water"
label variable Wat_Collect_HH_Member "Who collects water"
label variable Wat_Collect_HH_Member "Water collected by HH member or not?"
label variable Wat_Drink_Wash_source "Different source for Drink n wash"
label variable Wat_supply_no "No of source of water supply"
label variable Wat_source "Physical source type of water "

*Labrel Defining Variables

label define Wat_source 11 "Piped into dwelling " 12 "Piped into compound, yard or plot" 13 "Piped to neighbour" 14 "Public tap/standpipe" 21 "Tube Well, Borehole" ///
31 "Protected well"	32 "Unprotected well " 41 "Protected spring" 42 "Unprotected spring" 51 "Rainwater collection" 61 "Tanker-truck" 62 "Cart with small tank/drum" ///
72 "Water kiosk" 81 "Surface water (river, stream, dam, lake, pond, canal, irrigation channel)" 91 "Bottled water" 92 "Sachet water" 99 "Other (specify)" 
label values Wat_source Wat_source

label define Wat_Collect_Mem_Type 1 "source myself(or a member of the HH)" 2 "via a friend" 3 "via a relation outside my HH" 4 "via a seller" 5 "via a utility" 0 "Not applicable" ///
9999 "Don’t Know"
label values Wat_Collect_Mem_Type Wat_Collect_Mem_Type

label define Wat_Collect_time_taken 99 "Don’t Know" 9999 "specify (in mins)"
label values Wat_Collect_time_taken Wat_Collect_time_taken 
	
label define Wat_Collect_Day_time 1 "Before 04h00 but after Midnight" 2	"04h00 - 05h00" 3 "05h00 - 06h00" 4 "06h00 - 07h00" 5 "07h00 - 08h00" 6 "08h00 - 09h00" 7 "09h00 - 10h00" ///
8 "11h00 - 12h00" 9 "12h00 - 13h00" 10 "13h00 - 14h00" 11 "14h00 -15h00" 12 "15h00 - 16h00"	13 "17h00 - 18h00" 14 "18h00 - 17h00" 15 "17h00 - 18h00" 16 "18h00 - 19h00"	17 "19h00 - 20h00" ///
18 "20h00 -21h00" 19 "21h00 - 22h00" 20 "22h00 - 23h00"	21 "23h00 - Midnight"
label values Wat_Collect_Day_time Wat_Collect_Day_time

label define Wat_collect_time_reason 1 "Water supplied at these times" 2 "Fear of running out of water"	3 "Not free to go at other times due to other commitments" 4 "Safety reasons" ///
5 "Comfortable hours less heat"	6 "Socialisation with other people in the community" 7 "No specific reasons"
label values Wat_collect_time_reason Wat_collect_time_reason

label define Obs_Eutro_Watbody 1 "Once - twice a year" 2 "three - five times a year" 3 "more than five times a year" 4 "sometimes" 5 "rarely" 6 "never"
label values Obs_Eutro_Watbody Obs_Eutro_Watbody

 
***********dont run for now*******
*encoding water puri procees to label values
encode Wat_pur_process, gen ( Wat_puri_process )

label define Wat_pur_process 1 "boil" 2 "use alum" 3 "add bleach/chlorine tablets"	4 "strain through a cloth" 5 "use water filter"	6 "use electric purifier" 7 "let it stand and settle"
label values Wat_pur_process Wat_puri_process

save "E:\RUST\Section D.dta", replace
***************************************


***************Section E1*****************
import excel "E:\RUST\Mother\Section E1.xlsx", sheet("E1") firstrow
drop E F G H

*Renaming Variables
rename sectioneintro_sectioneplace_toi Defec_place
rename B Defec_place_specific
rename sectioneintro_sectionetype_toil Toilet_type
rename D Toilet_type_specific
rename sectioneintro_sectionefrequency Toilet_use_freq_per_day
rename sectioneintro_sectionehh_toilet Toilet_inHH
rename K Reason_NO_inHH
rename L Toilet_inHH_type
rename M Toilet_inHH_type_specific
rename N Toilet_inHH_access_since
rename O Toilet_inHH_built
rename P HH_mem_built_Toilet_inHH
rename Q Info_source
rename R Info_source_specific
rename S Info_mechan
rename T Info_mechan_other
rename U Total_cost_source
rename V Total_cost
rename W Cost_Income
rename X Personal_savings
rename Y Relatives
rename Z Friends
rename AA Govt_subsidy
rename AB Community_mem_money
rename AC Govt_loan_community
rename AD Cost_other
rename AE Toilet_inHH_ever_emptied
rename AF Empty_last_time
rename AG Last_empty_dispo
rename AH Empty_last_who
rename AI Empty_last_cost
rename AJ Probs_defec_facility
rename AK Probs_defec_facility_specific
rename AL days_lost_NO_toilet_last_month

*Labelling Variables
label variable days_lost_NO_toilet_last_month "Days lost last month from school/work due to no toilet there"
label variable Probs_defec_facility_specific "Other problems with defecation facility"
label variable Probs_defec_facility "Problems with defecation facility"
label variable Empty_last_cost "Cost of emptying toilet last time"
label variable Empty_last_who "who emptied toilet last time"
label variable Last_empty_dispo "Contents of last emptying disposal place"
label variable Empty_last_time "when was toilet last emptied?"
label variable Toilet_inHH_ever_emptied "Toilet ever been emptied"
label variable Cost_other "Other sources "
label variable Govt_loan_community "Govt loan from within community"
label variable Community_mem_money "Money collected by members of community"
label variable Govt_subsidy "Govt Subsidy"
label variable Friends "From friends"
label variable Relatives "From relatives"
label variable Personal_savings "From personal savings"
label variable Cost_Income "From income"
label variable Total_cost "Total cost of toilet in Rs."
label variable Total_cost_source "Total cost of toilet and source"
label variable Info_mechan_other "Other info mechanism"
label variable Info_mechan "Mechanism of receiving Info "
label variable  "Info source of help to bulid toilet"
label variable _specific "Other info source"
label variable HH_mem_built_Toilet_inHH "Did any HH member arranged toilet constrcution"
label variable Toilet_inHH_built "Toilet built since"
label variable Toilet_inHH_access_since "Acces to in HH toilet since"
label variable Toilet_inHH_type_specific "In HH toilet type - Other"
label variable Toilet_inHH_type "Type of In HH toilet"
label variable Reason_NO_inHH "Reason for NO in HH toilet"
label variable Toilet_inHH "do you have toilet in HH"
label variable Toilet_use_freq_per_day "Frequency of toilet use per day"
label variable Toilet_type_specific "Toilet type - other"
label variable Toilet_type "Type of toilet used"
label variable Defec_place_specific "Defecation place - other"
label variable Defec_place "Defecation Place"


*Label defining variables
label define Defec_place 1 "Household toilet" 2 "Community toilet" 3 "Public toilet" 4 "Open defecation" 99 "Other please specify (for e.g. indoors without toilet system)"
label values Defec_place Defec_place

label define Toilet_type 11 "Flush to piped sewer system" 12 "Flush to septic tank" 13 "Flush to pit latrine" 14 "Flush to open drain" 18 "Flush to Don't Know where" 22 "Pit latrine with slab" ///
23 "Pit latrine without slab/ Open pit" 31 "Composting toilet" 32 "Twin pit with slab" 33 "Twin pit without slab" 41 "Bucket" 51 "Hanging toilet/ hanging latrine" 95 "No facility / Bush / Field" ///
99 "Other (specify)"
label values Toilet_type Toilet_type

label values Toilet_inHH_type Toilet_type

label define Info_source 0 "NA" 1 "Family" 2 "Friends" 3 "Neighbours" 4 "Community Groups" 5 "Sarpanch" 6 "Field Assistant" 7 "Ward Committee Member" 8 "Local political representative" 9 "GHMC" ///
10 "CDMA"  11 "HMDA" 12 "HMWSSB" 99 "Other"
label values Info_source Info_source
		
label define Total_cost_source 1 "Total cost" 9999 "Don't Know"
label values Total_cost_source Total_cost_source


label define Toilet_inHH_ever_emptied 1 "Yes" 0 "No" 9999 "Don’t Know"
label values Toilet_inHH_ever_emptied Toilet_inHH_ever_emptied

label define Last_empty_dispo 1 "Removed using a truck/ tanker" 2 "Removed using a non-motorized vehicle" 3 "Buried in a covered pit" 4 "An uncovered pit, open pit, open ground, water body" 99 "Other (specify)" 9999 "Don't Know"
label values Last_empty_dispo Last_empty_dispo		


* MULTIPLE CODES in one line
label define Reason_NO_inHH	1 "Lack of income" 2 "Lack of access to finance" 3 "Lack of space at home" 4 "Lack of permanent residence" 5 "Prefer to go to community/ public toilets" 6 "Prefer to go for open defecation" ///
7 "Lack of recognition from the government"	99 "Other"
label values Reason_NO_inHH Reason_NO_inHH

label define Info_mechan 0 "NA" 1 "Word of mouth" 2 "Newspaper" 3 "Leaflet" 4 "Street advertisement" 5 "Text message" 6 "Internet" 7 "Social Media" 8 "Television" 9 "Radio" 99 "Other"
label values Info_mechan Info_mechan

label define Probs_defec_facility 0 "No specific problem" 1 "Lack of Hygiene" 2 "Water not available for self-cleaning" 3 "Flies/ Mosquitoes" 4 "Structure does not ensure privacy" 5 "Unsafe"  6 "Flooding in rainy seasons" ///
7 "Pit filled up" 8 "Difficulties for younger children to use" 9 "Difficulties for women to use during menstrual periods" 10 "Difficulties for women to use during pregnancy" 11 "Difficulties for elder people to use"
label values Probs_defec_facility Probs_defec_facility

**notes on E1:
**Empty_last_time 
*Last_empty_dispo 
*Empty_last_who 
*Empty_last_cost :;;;   all are empty

save "E:\RUST\Section E1.dta", replace
***************************************


***************Section E2*****************
import excel "E:\RUST\Mother\Section E2.xlsx", sheet("E2") firstrow
drop sectionesectione_2notewastewate
drop G F E D
drop J K L M

*Renaming Variables
rename sectionesectione_2greywatergre Grey_wat_dispo
rename C Grey_wat_dispo_specific
rename sectionesectione_2blackwaterbl Black_wat_dispo
rename I Black_wat_dispo_specific
rename sectionesectione_2treatmentk_w Waste_wat_treat
rename O Waste_wat_treat_YES

*Labelling Variables
label variable Grey_wat_dispo "Grey Water disposal location"
label variable Grey_wat_dispo_specific "Grey water disposal location other"
label variable Black_wat_dispo "Black water disposal location"
label variable Black_wat_dispo_specific "Black water disposal location - other"
label variable Waste_wat_treat "Aware whether waste water is treated before disposal or not"
label variable Waste_wat_treat_YES "If aware, where?"

*Label defining Variables
label define Grey_wat_dispo 1 "goes into built drain" 2 "goes into sewerage system" 3 "goes into open drain" 4 "Reused (watering plants)" 99 "Other"
label values Grey_wat_dispo Grey_wat_dispo

label define Black_wat_dispo 1 "goes into built drain" 2 "goes into sewerage system" 3 "goes into open drain" 4 "in septic tank" 99 "Other"
label values Black_wat_dispo Black_wat_dispo


save "E:\RUST\Section E2.dta", replace
***************************************


***************Section E3*****************
import excel "E:\RUST\Mother\Section E3.xlsx", sheet("E3") firstrow
drop sectionesectione_3noteswmd D E F G sectionesectione_3mixedwastemi J K L sectionesectione_3mixedwastewa N O P
drop SETOFsectionesectione_3segwas

*Renaming Variables
rename sectionesectione_3disposalwast Waste_segreg_dispo
rename sectionesectione_3mixedwastemw Mixed_waste_dispo_place
rename sectionesectione_3mixedwasteqt Daily_HH_waste_qty
rename sectionesectione_3segwastesegw Seg_waste_type
rename disposalperioddifficult_disposal Dispo_difficult_period
rename disposalperioddifficulties_encou Waste_dispo_difficulties
rename wastemanagwaste_manag_satis Waste_mgt_sys_satis
rename wastemanagwaste_wtp Waste_mgt_serv_fee_expect

*Labelling Variables
label variable Waste_mgt_serv_fee_expect "Expected fee willing to pay for better waste mgt service (Rs)"
label variable Waste_mgt_sys_satis "Satisfied with current waste mgt system"
label variable Waste_dispo_difficulties "Difficulties encountered while waste disposal"
label variable Dispo_difficult_period "Period during which its difficult to dispose waste"
label variable Seg_waste_type "Type of segregated waste"
label variable Daily_HH_waste_qty "Daily quantity of waste generated in HH"
label variable Mixed_waste_dispo_place "Mixed waste disposal location"
label variable Waste_segreg_dispo "whether waste segregated before disposal"

*Label Defining Variables 
label define Mixed_waste_dispo_place 1 "HH bin"	2 "Community bin" 3 "Open drain" 4 "In nearby dumping ground" 5 "Burn Outdoors" 6 "Recycling" 99 "Other"
label values Mixed_waste_dispo_place Mixed_waste_dispo_place

label define Seg_waste_type 1 "wet" 2 "dry"
label values Seg_waste_type Seg_waste_type	

label define Waste_mgt_sys_satis 1 "Strongly Agree" 2 "Agree" 3 "Disagree" 4 "Strongly Disagree"
label values Waste_mgt_sys_satis Waste_mgt_sys_satis

* MULTIPLE CODES in one line
label define Dispo_difficult_period 0 "no specific period" 1 "May-Sept (Summer, Moonsoon)" 2 "Oct-November (Autumn)" 3 "Jan-Feb (Winter)" 4 "March-April (Spring)"
label values Dispo_difficult_period Dispo_difficult_period

save "E:\RUST\Section E3.dta", replace
***************************************


***************Section E4*****************
import excel "E:\RUST\Mother\Section E4.xlsx", sheet("E4") firstrow
drop sectione_4humanexcreta_recyhuma

*Renaming Variables
rename sectione_4humanexcreta_recyp_wa Waste_wat_treat_prior_dispo
rename sectione_4humanexcreta_recyp_ex Hum_excre_recycled_fertilizer
rename sectione_4humanexcreta_recyp_us Fertil_safe_cultiv_use
rename E Hum_excre_recycled_Biogas
rename sectione_4humanexcreta_recyp_co Eat_hum_fertil_food

*Labelling Variables
label variable Eat_hum_fertil_food "Eat food grown of fertilizer made of human excreta"
label variable Hum_excre_recycled_Biogas "Human excreta should be recycled into biogas"
label variable Fertil_safe_cultiv_use "If fertilizer of hum excre were safe, i would use it in farming"
label variable Hum_excre_recycled_fertilizer "Human excreta should be recycled into fertilizer"
label variable Waste_wat_treat_prior_dispo "waste  water should be treated before disposed into nature"

*Label Defining Variables
label define Agreement 1 "Strongly Agree" 2 "Agree" 3 "Disagree" 4 "Strongly Disagree"
label values Eat_hum_fertil_food Hum_excre_recycled_Biogas Fertil_safe_cultiv_use Hum_excre_recycled_fertilizer Waste_wat_treat_prior_dispo Agreement


save "E:\RUST\Section E4.dta", replace
***************************************


***************Section E5*****************
import excel "E:\RUST\Mother\Section E5.xlsx", sheet("E5") firstrow

*Renaming Variables
rename sectione_5mhm_facilitymhm_facil Mhm_facility_privacy
rename sectione_5mhm_facilitymhm_diffe Diff_toilet_while_Periods
rename sectione_5mhm_facilitynote_mhm_ Reason_diff_toilet
rename D Reason_diff_toilet_specific
rename sectione_5mhmmaterialmhm_materi Materials_used
rename F Materials_used_specific
rename sectione_5mhmmaterialnote_mhm_m Material_disposal
rename H Material_disposal_specific

*Labelling Variables
label variable Material_disposal "Mhm Material disposal "
label variable Material_disposal_specific "Mhm Material disposal -  other"
label variable Materials_used_specific "Mhm Material used- other"
label variable Materials_used "Mhm Material used"
label variable Reason_diff_toilet_specific "Reason for using different toilet while in periods - Other"
label variable Reason_diff_toilet "Reason for using different toilet while in periods"
label variable Diff_toilet_while_Periods "Use different toilets while in periods?"
label variable Mhm_facility_privacy "During last time, was it possible to wash and change in privacy?"

*Label Definig Variables
label define Materials_used 1 "washable cloth pads"  2 "disposable cloth pad, fabric" 3 "tampon" 4 "menstrual cup" 99 "Other"
label values Materials_used Materials_used

label define Material_disposal 1 "In HH bin" 2 "In community dustbin" 3 "In open drain" 4 "In nature" 5 "Burn in open" 99 "Other"
label values Material_disposal Material_disposal

* MULTIPLE CODES in one line
label define Reason_diff_toilet 1 "social pressure" 2 "For more privacy" 3 "easier water access" 4 "Comfort" 5 "Hygiene" 6 "Soap access" 99 "Other reason"
label values Reason_diff_toilet Reason_diff_toilet
		
**notes on E: all are empty
**Material_disposal, Material_disposal_specific

save "E:\RUST\Section E5.dta", replace
***************************************



***************Section F*****************
import excel "E:\RUST\Mother\Section F.xlsx", sheet("F") firstrow

*Renaming Variables
rename sectionfresponsibilityresponsib Hum_excre_respo
rename B solid_waste_respo
rename C Grey_wat_respo
rename D Black_wat_respo
rename sectionfresponsibilityassistanc Hum_excre_contact
rename F Hum_excre_contact_specific
rename G Solid_waste_contact
rename H Solid_waste_contact_specific
rename I Toilet_mainten_contact
rename J Toilet_mainten_contact_specific
rename K Piped_wat_contact
rename L Piped_wat_contact_specific

*Labelling Variables
label variable Hum_excre_respo "Responsibility with Human excreta"
label variable solid_waste_respo "Responsibility with Solid waste"
label variable Grey_wat_respo "Responsibility with Grey water"
label variable Black_wat_respo "Responsibilty with Black water "
label variable Hum_excre_contact "Human Excreta issue contact "
label variable Hum_excre_contact_specific "Human Excreta - other issue contact "
label variable Solid_waste_contact "Solid waste issue contact "
label variable Solid_waste_contact_specific "Solid waste- other issue contact "
label variable Toilet_mainten_contact "Toilet Maintenance issue contact "
label variable Toilet_mainten_contact_specific "Toilet Maintenance - other issue contact "
label variable Piped_wat_contact "Piped water issue contact "
label variable Piped_wat_contact_specific "Piped water - other issue contact"

*Label Defining Variables
label define Responsibility	1	"no reponsibility" 2 "partial responsibility" 3	"full responsibility"
label values Hum_excre_respo solid_waste_respo Grey_wat_respo Black_wat_respo Responsibility

* MULTIPLE CODES in one line		 
label define Contact 1 "Friends" 2 "Family" 3 "Neighbours" 4 "Community Groups" 5 "Sarpanch" 6 "Field Assistant" 7 "Ward Committee Member" 8 "Local political representative" 9 "GHMC" ///
10 "CDMA" 11 "HMDA" 12 "HMWSSB" 99 "Other"
label values Hum_excre_contact Solid_waste_contact Toilet_mainten_contact Piped_wat_contact Contact

save "E:\RUST\Section F.dta", replace
***************************************


***************Section G*****************
import excel "E:\RUST\Mother\Section G.xlsx", sheet("G") firstrow
drop sectionggenerated_note_name_395
drop SETOFsectionghealth_costillneS

*Renamimg Variables
rename sectiongillnessillness_hhmember Illness_HHmem_last_yr
rename sectiongillnessnoteillness_caus Reason_of_illness
rename D Reason_of_illness_specific
rename E Illness_treatment
rename sectiongdrvisittimetaken_tovisi Time_visit_Dr
rename sectiongdrvisitreason_notvistdr Reason_Not_visit_Dr
rename sectiongdeathhhmember_death HHmem_death_sani_illnes
rename sectionghealth_costrecent_illne HHmem_ill
rename sectionghealth_costnotename_ill Illness_name
rename K Illness_name_specific
rename L HHmem_under5_ill_num
rename M Above5_under18_ill_num
rename N Above18_ill_num
rename O Consult_expense
rename P Medicine_expense
rename Q Diagnostic_expense
rename R Transport_expense
rename S Work_days_lost
rename T Wages_lost
rename sectionghealth_costillness_last HHmem_illness_lastyr
rename V Name_illness_lastyr
rename W Name_illness_lastyr_specific
rename X HHmem_ill_num
rename Y HHmem_ill_Gender
rename AA Consult_expense_lastyr
rename AB Medicine_expense_lastyr
rename AC Diagnostic_expense_lastyr
rename AD Transport_expense_lastyr
rename AE Work_days_lost_lastyr
rename AF Wages_lost_lastyr

*Labelling Variables
label variable Illness_HHmem_last_yr "Did any HH member suffer any major illness Last year?"
label variable Reason_of_illness "Reason behind the illness"
label variable Reason_of_illness_specific "Reason behind the illness - other"
label variable Illness_treatment "Treatment for the illness taken"
label variable Time_visit_Dr "Time taken (in hrs.) to go see Dr. and return home"
label variable Reason_Not_visit_Dr "Reason for not visiting Dr."
label variable HHmem_death_sani_illnes "in last 5 yrs, has ny hh member dies of sanitation related illness"
label variable HHmem_ill "in last 30 days, has any hh member suffered any major illness"
label variable Illness_name "Name of Illness"
label variable Illness_name_specific "Name of Illness - other"
label variable HHmem_under5_ill_num "How many members under 5 of the family suffered from this illness?"
label variable Above5_under18_ill_num "No. of HH member above 5 and under 18 ill"
label variable Above18_ill_num "No. of HH member above 18 ill"
label variable Consult_expense "Consultation expenses in Rs. (illness in last 30 days)"
label variable Medicine_expense "Medicine expenses in Rs. (illness in last 30 days)"
label variable Diagnostic_expense "Diagnostic expenses in Rs. (illness in last 30 days)"
label variable Transport_expense "Transport expenses in Rs. (illness in last 30 days)"
label variable Work_days_lost "Works days lost due to illness in last 30 days"
label variable Wages_lost "Wages lost due to illness in last 30 days"
label variable HHmem_illness_lastyr "In the last year, has any member of your HH suffered from any major illness"
label variable Name_illness_lastyr "Name of Illness"
label variable Name_illness_lastyr_specific "Name of Illness - other"
label variable HHmem_ill_num "How many members of HH suffered from this illness?"
label variable HHmem_ill_Gender "Sick HH member - Gender"
label variable Consult_expense_lastyr "Consultation expenses in Rs. (illness last yr)"
label variable Medicine_expense_lastyr "Medicine expenses in Rs. (illness last yr)"
label variable Diagnostic_expense_lastyr "Diagnostic expenses in Rs. (illness last yr)"
label variable Transport_expense_lastyr "Transport expenses in Rs. (illness last yr)"
label variable Work_days_lost_lastyr "Works days lost due to illness last yr"
label variable Wages_lost_lastyr "Wages lost due to illness last yr"

*Label Defining Variables
label define Reason_of_illness 1 "Poor quality of water" 2 "Poor sanitation" 3 "Poor hygienic condition" 4 "Filthy environment" 5 "Intoxication" 99 "Other"
label values Reason_of_illness Reason_of_illness

label define Illness_treatment 1 "Public" 2 "Private: Registered" 3 "Private: Unregistered" 4 "Self-medication/ medicines from medical store" 5 "no visit to doctor" 6 "not treated"
label values Illness_treatment Illness_treatment

label define Reason_Not_visit_Dr 1 "Insufficient income" 2 "Far from hospital" 3 "can be treated by home remedies" 4 "not satisfied from treatment received" 99 "other"
label values Reason_Not_visit_Dr Reason_Not_visit_Dr

label define Illness_name 1 "Dengue" 2 "Malaria" 99 "Other"
label values Illness_name Name_illness_lastyr Illness_name


save "E:\RUST\Section G.dta", replace
***************************************


***************Section H1*****************

import excel "E:\RUST\Mother\Section H1.xlsx", sheet("H1") firstrow
drop sectionhnoteess sectionhsectionh1note_riceqty_ D E F H I J K

*Renaming Variables
rename sectionhsectionh1note_ricerice Rice_consumed_last_week
rename G HH_rice_source
rename L Rice_bought_last_week
rename M Rice_buy_cost
rename N Rice_received_last_week
rename O Excess_rice_prodn_lastyr
rename P Excess_rice_months
rename Q Rice_scarcity_lastyr
rename R Rice_scarcity_months

*Labelling Variables
label variable Rice_consumed_last_week "Was rice consumed in HH last week?"
label variable HH_rice_source "Source of Rice"
label variable Rice_bought_last_week "Qty of rice bought last week"
label variable Rice_buy_cost "Cost of buying rice last week"
label variable Rice_received_last_week "Qty of rice received last week"
label variable Excess_rice_prodn_lastyr "Was there excess prodn of rice last year?"
label variable Excess_rice_months "Months of excess prdn"
label variable Rice_scarcity_lastyr "Was there scarcity of rice last year?"
label variable Rice_scarcity_months "Months of scarcity"

*Label Defining Variables
label define HH_rice_source	1 "Purchased" 2 "Given" 3 "Produced"
label values HH_rice_source	HH_rice_source	

* MULTIPLE CODES in one line
label define Months 1 "January" 2 "February" 3 "March" 4 "April" 5 "May" 6 "June" 7 "July" 8 "August" 9 "September" 10 "October" 11 "November" 12 "December"
label values Rice_scarcity_months Excess_rice_months Months

save "E:\RUST\Section H1.dta", replace
***************************************


***************Section H2*****************
import excel "E:\RUST\Mother\Section H2.xlsx", sheet("Hwg") firstrow clear
drop C D E F H I J K T U V W Y Z AA AB

*Renaming Variables
rename sectionhsectionh1sectionhwgwil WG_used
rename sectionhsectionh1sectionhwgfue FW_used_last_week
rename G FW_source
rename L FW_bought_last_week
rename M FW_buy_cost
rename N FW_received_last_week
rename O Excess_FW_prdn_lastyr
rename P Excess_FW_months
rename Q Scarcity_FW_lastyr
rename R Scarcity_FW_months
rename sectionhsectionh1sectionhwgcha Char_used_last_week
rename X Char_source
rename AC Char_bought_last_week
rename AD Char_buy_cost
rename AE Char_received_last_week
rename AF Excess_Char_prdn_lastyr
rename AG Excess_Char_months
rename AH Scarcity_Char_lastyr
rename AI Scarcity_Char_months

*Labelling Variables
label variable WG_used "Wild goods used last week by HH"
label variable FW_used_last_week "Fire wood used last week by HH"
label variable FW_source "Fire wood source"
label variable FW_bought_last_week "Qty of fire wood bought last week"
label variable FW_buy_cost "Cost of fire wood bought"
label variable FW_received_last_week "Qty of fire wood received by HH last week"
label variable Excess_FW_prdn_lastyr "Was there any excess prdn of fire wood last year?"
label variable Excess_FW_months "Months of excess prdn"
label variable Scarcity_FW_lastyr "Was there any scarcity of fire wood last year?"
label variable Scarcity_FW_months "Months of fire wood scarcity"
label variable Char_used_last_week "Charcoal used last week by HH"
label variable Char_source "Charcoal source"
label variable Char_bought_last_week "Qty of Charcoal bought last week"
label variable Char_buy_cost "Cost of Charcoal bought"
label variable Char_received_last_week "Qty of Charcoal received by HH last week"
label variable Excess_Char_prdn_lastyr "Was there any excess prdn of Charcoal last year?"
label variable Excess_Char_months "Months of excess Charcoal prdn"
label variable Scarcity_Char_lastyr "Was there any scarcity of Charcoal last year?"
label variable Scarcity_Char_months "Months of Charcoal scarcity"

*Label Defining Variables
label define WG_Source	1 "Purchased" 2 "Given" 3 "Produced"
label values FW_source Char_source WG_Source

label define WG_used 1 "Fuel wood" 2 "Charcoal" 0 "None"
label values WG_used WG_used

* MULTIPLE CODES in one line
label define Months 1 "January" 2 "February" 3 "March" 4 "April" 5 "May" 6 "June" 7 "July" 8 "August" 9 "September" 10 "October" 11 "November" 12 "December"
label values Scarcity_Char_months Excess_Char_months Scarcity_FW_months Excess_FW_months Months


save "E:\RUST\Section H2.dta", replace
***************************************

***************Section H3*****************
import excel "E:\RUST\Mother\Section H3.xlsx", sheet("H3") firstrow
drop B C D E H I J K

*Renaming Variables
rename sectionhsectionh1sectionh3_sedi Sedimen_impact
rename F Sedimen_impact_level
rename G Erosion_impact
rename L Erosion_impact_level

*Labelling Variables 
label variable Erosion_impact "Does erosion impact HH?"
label variable Sedimen_impact "Does sedimentation impact HH?"
label variable Sedimen_impact_level "Impact Level"
label variable Erosion_impact_level "Impact Level"

*Label Defining Variables
label define Impact_level 1 "Strongly negative" 2 "Negative" 3 "Positive" 4 "Strongly positive"
label values Sedimen_impact_level Erosion_impact_level Impact_level


save "E:\RUST\Section H3.dta", replace
***************************************


***************Section H4*****************
import excel "E:\RUST\Mother\Section H4.xlsx", sheet("H4") firstrow
drop B C D E I J K L

*Renamimg Variables
rename sectionhsectionh1sectionh4_haza Flood_lastyr
rename F Flood_loss
rename G Flood_loss_cost
rename H Flood_protect
rename M Flood_protect_cost

*Labelling Variables
label variable Flood_protect "Any flood protection in the area?"
label variable Flood_protect_cost "Cost of flood protection or drought mitigation structure"
label variable Flood_loss_cost "Cost of loss in Flood"
label variable Flood_loss "Loss in Flood"
label variable Flood_lastyr "Occurence of Flood last year"

*Label Defining Variables
label define Flood_loss 1 "Crops" 2 "Livestock" 3 "Equipment/ buildings/contents of buildings" 4 "People’s lives" 99 "Other"
label values Flood_loss Flood_loss 

save "E:\RUST\Section H4.dta", replace
***************************************


***************Section H5*****************
import excel "E:\RUST\Mother\Section H5.xlsx", sheet("H5") firstrow
drop sectionhsectionh1sectionh5recr B C D E

*Renaming Variables
rename F Recreation_hrs
rename G Recreation_expense

*Labelling Variables
label variable Recreation_hrs "Hours of recreation"
label variable Recreation_expense "Expenses for recreation"

save "E:\RUST\Section H5.dta", replace
***************************************



***************Section H6*****************
import excel "E:\RUST\Mother\Section H6.xlsx", sheet("H6") firstrow
drop sectionhsectionh1sectionh6aest B C D E

*Renamimg Variables
rename F Visit_appreciate_beauty
rename G Hrs_spent
rename H Visit_expense

*Labelling Variables
label variable Visit_appreciate_beauty "Do you visit these places to appreciate its beauty?"
label variable Hrs_spent "time spent at the location"
label variable Visit_expense "Money spent at the location"

save "E:\RUST\Section H6.dta", replace
***************************************



***************Section H7*****************
import excel "E:\RUST\Mother\Section H7.xlsx", sheet("H7") firstrow
drop sectionhsectionh1sectionh7spir B C D E

*Renamimg Variables
rename F Visit_to_benefit
rename G Hrs_spent
rename H Visit_expense

*Labelling Variables
label variable Visit_to_benefit "Do you have to visit these places to receive benefits?"
label variable Hrs_spent "time spent at the location"
label variable Visit_expense "Money spent at the location"


save "E:\RUST\Section H7.dta", replace
***************************************


***************Section H8*****************
import excel "E:\RUST\Mother\Section H8.xlsx", sheet("H8") firstrow
drop C D E F H I J K

*Renaming Variables
rename sectionhsectionh1sectionh8fish Fish_consumed_last_week
rename B Qty_fish_used
rename sectionhsectionh1sectionh8sour Fish_source
rename L Fish_bought_last_week
rename M Fish_bought_cost
rename N Fish_received
rename O Fish_excess_months
rename P Fish_scarce_months

*Labelling Variables
label variable Fish_consumed_last_week "Did the HH use fish last week?"
label variable Qty_fish_used "Qty of fish used"
label variable Fish_source "source of procuring fish"
label variable Fish_bought_last_week "Qty of fish bought last week (in kgs.)"
label variable Fish_bought_cost "Cost of buying fish"
label variable Fish_received "Qty of fish received last week (in kgs.)"
label variable Fish_excess_months "Months in which excess fish was available"
label variable Fish_scarce_months "Months in which fish was scarce"

*Label Defining Variables
label define Fish_source 1 "the source is myself (or a member of the HH)" 2 "via a friend" 3 "via a relation outside my HH" 4 "via a seller"
label values Fish_source Fish_source

* MULTIPLE CODES in one line
label define Months 1 "January" 2 "February" 3 "March" 4 "April" 5 "May" 6 "June" 7 "July" 8 "August" 9 "September" 10 "October" 11 "November" 12 "December"
label values Fish_excess_months Fish_scarce_months Months


save "E:\RUST\Section H8.dta", replace
***************************************


***************Section Z*****************
import excel "E:\RUST\Mother\Section Z.xlsx", sheet("Finale") firstrow
drop finalesurvey_locationLatitude finalesurvey_locationLongitude finalesurvey_locationAltitude finalesurvey_locationAccuracy metainstanceID FormalInformal Formalmainly Informalmainly finalerespondent_card_number finalerespondent_card_number_cle
drop finalegenerated_note_name_603
drop P

label variable Sector "PU+U+R"
rename TotalHHIncomewithNA0 Total_HH_Income



save "E:\RUST\Section Z.dta", replace
***************************************
