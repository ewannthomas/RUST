****************Margins*******************************
*Margins based commands
margins Gender_recoded , at( House_plinth=(1(2)10)) predict(outcome(Common_Latrine))
margins Gender_recoded , at( House_plinth=(1(2)10)) predict(outcome(No_Latrine))


*Lat access 1
margins Gender_recoded , at( House_plinth=(0(1)10))
margins Relgn_recoded , at( House_plinth=(0(1)10))
margins Gender_recoded
margins Relgn_recoded
margins Gen_ed_lev_recoded , at( House_plinth=(0(2)10))
margins Gen_ed_lev_recoded
margins Land_owned_recoded
margins Land_owned_recoded , at( House_plinth=(0(2)10))
margins Tenur_dwell_stat_recoded , at( House_plinth=(0(2)10))
margins Tenur_dwell_stat_recoded
margins Dwell_locat_type_recoded
margins poverty_line
margins Sc_grp
margins Rural_Urban
margins Dwell_locat_type_recoded , at( House_plinth=(0(2)10))
margins poverty_line , at( House_plinth=(0(2)10))
margins Sc_grp , at( House_plinth=(0(2)10))
margins Rural_Urban , at( House_plinth=(0(2)10))
margins, at( Age =(1(20)105))
margins, at( HH_size =(1(5)40))
margins, at( House_plinth=(0(2)10))
*Lat access 2
margins Gender_recoded , predict(outcome(Common_Latrine))
margins Relgn_recoded , predict(outcome(Common_Latrine))
margins Gen_ed_lev_recoded , predict(outcome(Common_Latrine))
margins Land_owned_recoded , predict(outcome(Common_Latrine))
margins Tenur_dwell_stat_recoded , predict(outcome(Common_Latrine))
margins Dwell_locat_type_recoded , predict(outcome(Common_Latrine))
margins poverty_line , predict(outcome(Common_Latrine))
margins Sc_grp , predict(outcome(Common_Latrine))
margins Rural_Urban , predict(outcome(Common_Latrine))
margins Gender_recoded , at( House_plinth=(0(2)10)) predict(outcome(Common_Latrine))
margins Gen_ed_lev_recoded , at( House_plinth=(0(2)10)) predict(outcome(Common_Latrine))
margins Land_owned_recoded , at( House_plinth=(0(2)10)) predict(outcome(Common_Latrine))
margins Tenur_dwell_stat_recoded , at( House_plinth=(0(2)10)) predict(outcome(Common_Latrine))
margins Dwell_locat_type_recoded , at( House_plinth=(0(2)10)) predict(outcome(Common_Latrine))
margins poverty_line , at( House_plinth=(0(2)10)) predict(outcome(Common_Latrine))
margins Sc_grp , at( House_plinth=(0(2)10)) predict(outcome(Common_Latrine))
margins Rural_Urban , at( House_plinth=(0(2)10)) predict(outcome(Common_Latrine))
margins Relgn_recoded , at( House_plinth=(0(2)10)) predict(outcome(Common_Latrine))
margins, at( Age =(1(20)105)) predict(outcome(Common_Latrine))
margins, at( HH_size =(1(5)40)) predict(outcome(Common_Latrine))
margins, at( House_plinth=(0(2)10)) predict(outcome(Common_Latrine))
*Lat access 3
margins Gender_recoded , predict(outcome(No_Latrine))
margins Relgn_recoded , predict(outcome(No_Latrine))
margins Gen_ed_lev_recoded , predict(outcome(No_Latrine))
margins Land_owned_recoded , predict(outcome(No_Latrine))
margins Tenur_dwell_stat_recoded , predict(outcome(No_Latrine))
margins Dwell_locat_type_recoded , predict(outcome(No_Latrine))
margins poverty_line , predict(outcome(No_Latrine))
margins Sc_grp , predict(outcome(No_Latrine))
margins Rural_Urban , predict(outcome(No_Latrine))
margins Gender_recoded , at( House_plinth=(0(2)10)) predict(outcome(No_Latrine))
margins Relgn_recoded , at( House_plinth=(0(2)10)) predict(outcome(No_Latrine))
margins Gen_ed_lev_recoded , at( House_plinth=(0(2)10)) predict(outcome(No_Latrine))
margins Land_owned_recoded , at( House_plinth=(0(2)10)) predict(outcome(No_Latrine))
margins Tenur_dwell_stat_recoded , at( House_plinth=(0(2)10)) predict(outcome(No_Latrine))
margins Dwell_locat_type_recoded , at( House_plinth=(0(2)10)) predict(outcome(No_Latrine))
margins poverty_line , at( House_plinth=(0(2)10)) predict(outcome(No_Latrine))
margins Sc_grp , at( House_plinth=(0(2)10)) predict(outcome(No_Latrine))
margins Rural_Urban , at( House_plinth=(0(2)10)) predict(outcome(No_Latrine))
margins, at( Age =(1(20)105)) predict(outcome(No_Latrine))
margins, at( HH_size =(1(5)40)) predict(outcome(No_Latrine))
margins, at( House_plinth=(0(2)10)) predict(outcome(No_Latrine))
*HH_Garb 1
margins Gender_recoded
margins Relgn_recoded
margins Gen_ed_lev_recoded
margins Land_owned_recoded
margins Tenur_dwell_stat_recoded
margins Dwell_locat_type_recoded
margins poverty_line
margins Sc_grp
margins Rural_Urban
margins Gender_recoded , at( House_plinth=(0(2)10))
margins Relgn_recoded , at( House_plinth=(0(2)10))
margins Gen_ed_lev_recoded , at( House_plinth=(0(2)10))
margins Land_owned_recoded , at( House_plinth=(0(2)10))
margins Tenur_dwell_stat_recoded , at( House_plinth=(0(2)10))
margins Dwell_locat_type_recoded , at( House_plinth=(0(2)10))
margins poverty_line , at( House_plinth=(0(2)10))
margins Sc_grp , at( House_plinth=(0(2)10))
margins Rural_Urban , at( House_plinth=(0(2)10))
margins, at( Age =(1(20)105)) 
margins, at( HH_size =(1(5)40)) 
margins, at( House_plinth=(0(2)10))
marginsplot


*HH_Garb 2
margins Gender_recoded,predict(outcome(Common_Spot))
margins Relgn_recoded, predict(outcome(Common_Spot))
margins Gen_ed_lev_recoded, predict(outcome(Common_Spot))
margins Land_owned_recoded, predict(outcome(Common_Spot))
margins Tenur_dwell_stat_recoded, predict(outcome(Common_Spot))
margins Dwell_locat_type_recoded, predict(outcome(Common_Spot))
margins poverty_line, predict(outcome(Common_Spot))
margins Sc_grp, predict(outcome(Common_Spot))
margins Rural_Urban, predict(outcome(Common_Spot))
margins Gender_recoded , at( House_plinth=(0(2)10)) predict(outcome(Common_Spot))
margins Relgn_recoded , at( House_plinth=(0(2)10)) predict(outcome(Common_Spot))
margins Gen_ed_lev_recoded , at( House_plinth=(0(2)10))predict(outcome(Common_Spot))
margins Land_owned_recoded , at( House_plinth=(0(2)10)) predict(outcome(Common_Spot))
margins Tenur_dwell_stat_recoded , at( House_plinth=(0(2)10)) predict(outcome(Common_Spot))
margins Dwell_locat_type_recoded , at( House_plinth=(0(2)10)) predict(outcome(Common_Spot))
margins poverty_line , at( House_plinth=(0(2)10))predict(outcome(Common_Spot))
margins Sc_grp , at( House_plinth=(0(2)10))predict(outcome(Common_Spot))
margins Rural_Urban , at( House_plinth=(0(2)10)) predict(outcome(Common_Spot))
margins, at( Age =(1(20)105)) predict(outcome(Common_Spot))
margins, at( HH_size =(1(5)40)) predict(outcome(Common_Spot)) 
margins, at( House_plinth=(0(2)10))predict(outcome(Common_Spot))

marginsplot

*Dwat 1
margins Gender_recoded
margins Relgn_recoded
margins Gen_ed_lev_recoded
margins Land_owned_recoded
margins Tenur_dwell_stat_recoded
margins Dwell_locat_type_recoded
margins poverty_line
margins Sc_grp
margins Rural_Urban
margins Gender_recoded , at( House_plinth=(0(2)10))
margins Gender_recoded , at( House_plinth=(0(2)10))
margins Relgn_recoded , at( House_plinth=(0(2)10))
margins Gen_ed_lev_recoded , at( House_plinth=(0(2)10))
margins Land_owned_recoded , at( House_plinth=(0(2)10))
margins Tenur_dwell_stat_recoded , at( House_plinth=(0(2)10))
margins Dwell_locat_type_recoded , at( House_plinth=(0(2)10))
margins poverty_line , at( House_plinth=(0(2)10))
margins Sc_grp , at( House_plinth=(0(2)10))
margins, at( House_plinth=(0(2)10))
margins, at( HH_size =(1(5)40))
margins, at( Age =(1(20)105))
*Dwat 2
margins Gender_recoded, predict(outcome(Common_Use))
margins Relgn_recoded, predict(outcome(Common_Use))
margins Gen_ed_lev_recoded, predict(outcome(Common_Use))
margins Land_owned_recoded, predict(outcome(Common_Use))
margins Tenur_dwell_stat_recoded, predict(outcome(Common_Use))
margins Dwell_locat_type_recoded , predict(outcome(Common_Use))
margins poverty_line , predict(outcome(Common_Use))
margins Sc_grp , predict(outcome(Common_Use))
margins Rural_Urban , predict(outcome(Common_Use))
margins Sc_grp , predict(outcome(Common_Use))
margins Rural_Urban , predict(outcome(Common_Use))
margins Gender_recoded, at( House_plinth=(0(2)10)) predict(outcome(Common_Use))
margins Relgn_recoded , at( House_plinth=(0(2)10)) predict(outcome(Common_Use))
margins Gen_ed_lev_recoded , at( House_plinth=(0(2)10)) predict(outcome(Common_Use))
margins Land_owned_recoded , at( House_plinth=(0(2)10)) predict(outcome(Common_Use))
margins Tenur_dwell_stat_recoded , at( House_plinth=(0(2)10)) predict(outcome(Common_Use))
margins Dwell_locat_type_recoded , at( House_plinth=(0(2)10)) predict(outcome(Common_Use))
margins poverty_line , at( House_plinth=(0(2)10)) predict(outcome(Common_Use))
margins Sc_grp , at( House_plinth=(0(2)10)) predict(outcome(Common_Use))
margins Rural_Urban , at( House_plinth=(0(2)10)) predict(outcome(Common_Use))
margins, at( House_plinth=(0(2)10)) predict(outcome(Common_Use))
margins, at( HH_size =(1(5)40)) predict(outcome(Common_Use))
margins, at( Age =(1(20)105)) predict(outcome(Common_Use))
*Dwat 3
margins Gender_recoded , predict(outcome(Others))
margins Relgn_recoded , predict(outcome(Others))
margins Gen_ed_lev_recoded , predict(outcome(Others))
margins Land_owned_recoded , predict(outcome(Others))
margins Tenur_dwell_stat_recoded , predict(outcome(Others))
margins Dwell_locat_type_recoded , predict(outcome(Others))
margins poverty_line , predict(outcome(Others))
margins Sc_grp , predict(outcome(Others))
margins Rural_Urban , predict(outcome(Others))
margins Gender_recoded ,at( House_plinth=(0(2)10)) predict(outcome(Others))
margins Gen_ed_lev_recoded ,at( House_plinth=(0(2)10)) predict(outcome(Others))
margins Relgn_recoded ,at( House_plinth=(0(2)10)) predict(outcome(Others))
margins Land_owned_recoded ,at( House_plinth=(0(2)10)) predict(outcome(Others))
margins Tenur_dwell_stat_recoded ,at( House_plinth=(0(2)10)) predict(outcome(Others))
margins Dwell_locat_type_recoded ,at( House_plinth=(0(2)10)) predict(outcome(Others))
margins poverty_line ,at( House_plinth=(0(2)10)) predict(outcome(Others))
margins Sc_grp ,at( House_plinth=(0(2)10)) predict(outcome(Others))
margins Rural_Urban ,at( House_plinth=(0(2)10)) predict(outcome(Others))
margins, at( House_plinth=(0(2)10)) predict(outcome(Others))
margins, at( HH_size =(1(5)40)) predict(outcome(Others))
margins, at( Age =(1(20)105)) predict(outcome(Others))

