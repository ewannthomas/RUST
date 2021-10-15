
*MLogit 4th Run
global Indep_vars Age ib1.Gender_recoded HH_size ib1.Gen_ed_lev_recoded ib1.Land_owned_recoded ib2.Rural_Urban ib2.Rural_Urban#ib3.Sc_grp ib4.Relgn_recoded ib2.Tenur_dwell_stat_recoded ib1.Dwell_locat_type_recoded ib2.poverty_line House_plinth ib2.poverty_line#ib1.Gender_recoded c.House_plinth#ib2.Rural_Urban c.House_plinth#ib1.Gender_recoded c.House_plinth#ib1.Gen_ed_lev_recoded ib2.Tenur_dwell_stat_recoded#ib2.Rural_Urban ib1.Gender_recoded#ib2.Rural_Urban
mlogit lat_access_recoded $Indep_vars if State==36 [iw= Multiplier /100], base(2) rrr allbase

global Indep_vars Age ib1.Gender_recoded HH_size ib1.Gen_ed_lev_recoded ib1.Land_owned_recoded ib2.Rural_Urban ib3.Sc_grp ib2.Rural_Urban#ib3.Sc_grp ib4.Relgn_recoded ib2.Tenur_dwell_stat_recoded ib2.Dwell_locat_type_recoded ib2.poverty_line House_plinth ib2.poverty_line#ib1.Gender_recoded c.House_plinth#ib2.Rural_Urban c.House_plinth#ib1.Gender_recoded c.House_plinth#ib1.Gen_ed_lev_recoded ib2.Tenur_dwell_stat_recoded#ib2.Rural_Urban ib1.Gender_recoded#ib2.Rural_Urban  ib1.Gen_ed_lev_recoded#ib3.Sc_grp ib1.Land_owned_recoded# ib3.Sc_grp ib1.Land_owned_recoded# ib2.Rural_Urban
mlogit HH_garb_dispo_place_recoded $Indep_vars if State==36 [iw= Multiplier /100], base(2) rrr allbase

global Indep_vars Age ib1.Gender_recoded HH_size ib1.Gen_ed_lev_recoded ib1.Land_owned_recoded ib2.Rural_Urban ib3.Sc_grp ib2.Rural_Urban#ib3.Sc_grp ib4.Relgn_recoded ib2.Tenur_dwell_stat_recoded ib2.Dwell_locat_type_recoded ib2.poverty_line House_plinth ib2.poverty_line#ib1.Gender_recoded c.House_plinth#ib2.Rural_Urban c.House_plinth#ib1.Gender_recoded c.House_plinth#ib1.Gen_ed_lev_recoded ib2.Tenur_dwell_stat_recoded#ib2.Rural_Urban ib1.Gender_recoded#ib2.Rural_Urban  ib1.Gen_ed_lev_recoded#ib3.Sc_grp ib1.Land_owned_recoded# ib2.Rural_Urban
mlogit Dwat_access_recoded $Indep_vars if State==36 [iw= Multiplier /100], base(3) rrr allbase

***********************************

*******ACCESS TO LATRINE***********
estimate store Mlogit
quietly margins, dydx(Tenur_dwell_stat_recoded Dwell_locat_type_recoded Relgn_recoded poverty_line Land_owned_recoded Gender_recoded Gen_ed_lev_recoded Sc_grp) predict(outcome(No_Latrine)) post
estimate store No_Latrine
estimate restore Mlogit
quietly margins, dydx(Tenur_dwell_stat_recoded Dwell_locat_type_recoded Relgn_recoded poverty_line Land_owned_recoded Gender_recoded Gen_ed_lev_recoded Sc_grp) predict(outcome(Common_Latrine)) post
estimate store Common_Latrine
estimate restore Mlogit
quietly margins, dydx(Tenur_dwell_stat_recoded Dwell_locat_type_recoded Relgn_recoded poverty_line Land_owned_recoded Gender_recoded Gen_ed_lev_recoded Sc_grp) predict(outcome(exclusive_use_of_household)) post
estimate store Excluive_HH_Latrine




*Single plot
coefplot Excluive_HH_Latrine Common_Latrine No_Latrine , xline(0) title(Marginal Effects) xtitle(Marginal Values) ytitle(Covariates)
*Seperate Plots
coefplot Excluive_HH_Latrine || Common_Latrine || No_Latrine , xline(0) title(Marginal Effects) xtitle(Marginal Values) ytitle(Covariates)
