*Extracting NSSO 76 

*L01
infix str Centr_Round 1-3 ///
str FSU 4-8 ///
str Round 9-10 ///
str Schedule 11-13 ///
str Sample 14-14 ///
str Sector 15-15 ///
str NSS_Region 16-18 ///
str District 19-20 ///
str Stratum 21-22 ///
str Sub_stratum 23-24 ///
str Sub_Round 25-25 ///
str FOD_Sub_Reg 26-29 ///
str Scnd_stg_strtm 30-30 ///
str Sample_HH_no 31-32 ///
Level 33-34 ///
Filler 35-39 ///
Sl_No_Informant 40-41 ///
Response_Code 42-42 ///
Survey_Code 43-43 ///
Reason_for_subs 44-44 ///
Blank 45-126 ///
NSC 127-129 ///
Multiplier 130-139 ///
using "E:\NSSO 76\Mother\Text Data\L01.txt"

save "E:\NSSO 76\L 01 Block 01.dta"

*L02
infix str Common_ID 1-32 ///
Level 33-34 ///
Filler 35-37 ///
Per_Srl_No 38-39 ///
Relate_Head 40-40 ///
Gender 41-41 ///
Age 42-44 ///
Marital_status 45-45 ///
Gen_ed_lev 46-47 ///
Usual_P_act_stat 48-49 ///
indus_cde 50-51 ///
occup_cde 52-53 ///
use_latrine 54-54 ///
type_latrine 55-56 ///
latrine_only_HH 57-57 ///
reason_No_latrine 58-58 ///
Blank 59-126 ///
NSC 127-129 ///
Multiplier 130-139 ///
using "E:\NSSO 76\Text Data\L02.txt"

save "E:\NSSO 76\L 02 Block 03"

*L03
infix str Common_ID 1-32 ///
Level 33-34 ///
Filler 35-39 ///
HH_size 40-41 ///
Relgn 42-42 ///
Sc_grp 43-43 ///
Land_owned 44-45 ///
MHCE_purch_A 46-55 ///
MHCE_home_grwn_stck_B 56-65 ///
MHCE_wage_C 66-75 ///
YHCE_durab 76-85 ///
MHCE 86-95 ///
Tenur_dwell_stat 96-96 ///
Dwell_locat_type 97-97 ///
New_house_pur 98-98 ///
New_house_exp 99-108 ///
Source_fin_1 109-110 ///
Source_fin_2 111-112 ///
Source_fin_3 113-114 ///
Source_fin_4 115-116 ///
Dist_work_M 117-117 ///
Dist_work_F 118-118 ///
Dist_work_TransG 119-119 ///
Blank 120-126 ///
NSC 127-129 ///
Multiplier 130-139 ///
using "E:\NSSO 76\Text Data\L03.txt"

save "E:\NSSO 76\L 03 Block 04.dta"


*L04
infix str Common_ID 1-32 ///
Level 33-34 ///
Filler 35-39 ///
Dwat_benefit 40-40 ///
Dwat_ben_last3_years 41-41 ///
Dwat_ben_scheme 42-42 ///
Sani_benefit 43-43 ///
Sani_ben_last3_years 44-44 ///
Sani_ben_scheme 45-45 ///
House_benefit 46-46 ///
House_ben_last3_years 47-47 ///
House_ben_scheme 48-48 ///
Electri_benefit 49-49 ///
Electri_ben_last3_years 50-50 ///
Electri_ben_scheme 51-51 ///
LPG_benefit 52-52 ///
LPG_ben_last3_years 53-53 ///
LPG_ben_scheme 54-54 ///
Blank 55-126 ///
NSC 127-129 ///
Multiplier 130-139 ///
using "E:\NSSO 76\Text Data\L04.txt"

save "E:\NSSO 76\L 04 Block 04 (item 15).dta"


*L05
infix str Common_ID 1-32 ///
Level 33-34 ///
Filler 35-39 ///
Dwat_P_source 40-41 ///
Dwat_suff_1yr 42-42 ///
Dwat_insuff_Jan 43-43 ///
Dwat_insuff_Feb 44-44 ///
Dwat_insuff_Mar 45-45 ///
Dwat_insuff_Apr 46-46 ///
Dwat_insuff_May 47-47 ///
Dwat_insuff_June 48-48 ///
Dwat_insuff_July 49-49 ///
Dwat_insuff_Aug 50-50 ///
Dwat_insuff_Sep 51-51 ///
Dwat_insuff_Oct 52-52 ///
Dwat_insuff_Nov 53-53 ///
Dwat_insuff_Dec 54-54 ///
Dwat_P_source_access 55-55 ///
Dwat_P_source_Dist 56-56 ///
Dwat_per_fetch 57-57 ///
Dwat_fetch_time 58-60 ///
Dwat_fetch_wait_time 61-63 ///
Dwat_fetch_trips 64-65 ///
Stag_wat_Dwat_source 66-66 ///
Dwat_S_source 67-68 ///
Dwat_treat_method 69-69 ///
Dwat_contnr_matril 70-70 ///
Dwat_store_time 71-71 ///
Dwat_store_coverd 72-72 ///
Dwat_contnr_take_out 73-73 ///
Wat_P_source 74-75 ///
Wat_suff_1yr 76-76 ///
Wat_supply_freq 77-77 ///
Wat_supply_meter 78-78 ///
Wat_monthly_charge_info 79-79 ///
Wat_monthly_charge_paid_Rs 80-89 ///
BathR_access 90-91 ///
BathR_type 92-92 ///
BathR_dist 93-93 ///
Latrine_access  94-94 ///
Latrine_type 95-96 ///
BathR_Latrine_inHH 97-97 ///
excre_empty 98-98 ///
who_empty_excre 99-99 ///
excre_dispo_locat 100-100 ///
excre_dispo_charge_Rs 101-108 ///
excre_empty_freq 109-109 ///
Child_less_3yr_excre_dispo 110-110 ///
Latrine_wat_avail 111-111 ///
HandW_bef_meal 112-112 ///
HandW_aft_defec 113-113 ///
Blank 114-126 ///
NSC 127-129 ///
Multiplier 130-139 ///
using "E:\NSSO 76\Text Data\L05.txt"

save "E:\NSSO 76\L 05 Block 05.dta"


*L06
infix str Common_ID 1-32 ///
Level 33-34 ///
Filler 35-39 ///
House_plinth 40-41 ///
House_floor_no 42-43 ///
House_use 44-44 ///
Built_since 45-46 ///
Start_yr 47-50 ///
Complet_yr 51-54 ///
Struc_conditn 55-55 ///
HH_dom_use_electri 56-56 ///
Electri_wire_type 57-57 ///
HH_drain_type 58-58 ///
HH_waste_wat_dispo 59-59 ///
HH_garb_dispo_place 60-60 ///
HH_garb_agency_collect 61-61 ///
Garb_collect_freq 62-62 ///
Flood_prev_5yrs 63-63 ///
HH_road_opens 64-64 ///
HH_stagWat_prob_inOraround 65-65 ///
Human_faece_visib_inOraround_HH 66-66 ///
Exis_anim_shed_poult_farm 67-67 ///
Anim_poult_excre_dispo 68-68 ///
HH_face_flymosqui_prob_1yr 69-69 ///
Fly_mosq_solv_Loc_SteGovt_1yr 70-70 ///
Fly_mosq_solv_HH_365d 71-71 ///
diarea_dysntry_cholera 72-72 ///
Malria_dengy_chikgnya_enceflits 73-73 ///
Skin_diseases 74-74 ///
Jaundice 75-75 ///
Other_diseases 76-76 ///
Blank 77-126 ///
NSC 127-129 ///
Multiplier 130-139 ///
using "E:\NSSO 76\Text Data\L06.txt"

save "E:\NSSO 76\L 06 Block 06.dta"


*L07
infix str Common_ID 1-32 ///
Level 33-34 ///
Filler 35-39 ///
Dwell_type 40-40 ///
Live_room_no 41-42 ///
Other_room_no 43-44 ///
Live_room_flr_area 45-49 ///
Other_room_flr_area 50-54 ///
covrd_veran_flr_area 55-59 ///
uncovrd_veran_flr_area 60-64 ///
Tot_flr_area 65-69 ///
ventil_dwell 70-70 ///
Tot_no_maried_coupl_HH 71-73 ///
no_maried_coupl_seprt_room 74-76 ///
Kitchen_type 77-77 ///
Fuel_type_cook 78-79 ///
Floor_type 80-80 ///
Wall_type 81-81 ///
Roof_type 82-82 ///
Monthly_rent_Rs 83-92 ///
Blank 93-126 ///
NSC 127-129 ///
Multiplier 130-139 ///
using "E:\NSSO 76\Text Data\L07.txt"

save "E:\NSSO 76\L 07 Block 07.dta"


*L08
infix str Common_ID 1-32 ///
Level 33-34 ///
Filler 35-39 ///
Stay_duratn_HH_prsnt_area 40-41 ///
Prev_HH_locatn 42-42 ///
Prev_struc_type 43-43 ///
Reason_move_new_locatn 44-44 ///
no_membs_move_in_HH_last_365d 45-47 ///
no_membs_move_out_HH_last_365d 48-50 ///
HH_head_docs_resid_stat 51-51 ///
HH_receive_bene_slum_resid 52-52 ///
HH_attempt_move_out_slum 53-53 ///
Main_reason 54-54 ///
Blank 55-126 ///
NSC 127-129 ///
Multiplier 130-139 ///
using "E:\NSSO 76\Text Data\L08.txt"

save "E:\NSSO 76\L 08 Block 08.dta"


*L09
infix str Common_ID 1-32 ///
Level 33-34 ///
Filler 35-39 ///
Employee_code_FI_JSO 40-43 ///
Employee_code_FO_SSO 44-47 ///
Employee_code_FI_JSO_1b 48-51 ///
Date_of_Survey 52-57 ///
Date_of_Despatch 58-63 ///
Time_canvass 64-66 ///
Remarks_block_9_10 67-67 ///
Remarks_block_9_11 68-68 ///
Remarks_elsewhere 69-69 ///
Remarks_elsewhere_Sch 70-70 ///
No_Investigators_team 71-71 ///
Blank 72-126 ///
NSC 127-129 ///
Multiplier 130-139 ///
using "E:\NSSO 76\Text Data\L09.txt"

save "E:\NSSO 76\L 09 Block 02.dta"
