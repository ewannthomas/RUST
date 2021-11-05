
****************Rurality Paper*************

**Merging Files
  use "E:\RUST Primary\Section E4.dta" 
  merge 1:1 KEY using "E:\RUST Primary\Section F.dta"
  drop _merge

**Dropping Contact variables
  drop Hum_excre_contact - Piped_wat_contact_specific
 
**Encoding Sector Strings 
  encode Sector, gen(sector)
  drop Sector
**Recoding sector for replacing UR as PU
  recode sector (1=1 "Peri Urban") (2=2 "Rural") (3=3 "Urban") (4=1), gen(Sector)
  label variable Sector "Sector" 
  drop sector
  
  
  
  
  
  
  foreach var in Waste_wat_treat_prior_dispo Hum_excre_recycled_fertilizer Fertil_safe_cultiv_use Hum_excre_recycled_Biogas Eat_hum_fertil_food Hum_excre_respo solid_waste_respo Grey_wat_respo Black_wat_respo {
  tab2 `var' Sector, chi r col
  }
  
   foreach var in Waste_wat_treat_prior_dispo Hum_excre_recycled_fertilizer Fertil_safe_cultiv_use Hum_excre_recycled_Biogas Eat_hum_fertil_food Hum_excre_respo solid_waste_respo Grey_wat_respo Black_wat_respo {
  tabodds `var' Sector,
  }

  
  
  
  
  
**Merging for indep vars
  merge 1:1 KEY using "E:\RUST Primary\Vulnerability Score.dta", keepusing(age HH_Size Gen_Ed_recode)
  drop _merge  
  
  
  global IndepVars age ib3.Gender ib2.Sector ib1.Sc_Grp ib3.Religion HH_Size ib1.Residence_Stat ib0.Gen_Ed_recode Total_HH_Income  

  
***Omodel for Brant test (DONT RUN)
foreach var in Gender Religion Sc_Grp Sector Gen_Ed_recode Residence_Stat {
tab `var', gen (`var')
}


**Omodel (ALONE)
  global IndepVars age HH_Size Gender2 Religion2 Religion3 Sc_Grp2 Sc_Grp3 Sc_Grp4 Sc_Grp5 Sector2 Sector3 Gen_Ed_recode2 Gen_Ed_recode3 Gen_Ed_recode4 Residence_Stat2 Residence_Stat3  
 
  foreach var in Waste_wat_treat_prior_dispo Hum_excre_recycled_fertilizer Fertil_safe_cultiv_use Hum_excre_recycled_Biogas Eat_hum_fertil_food Hum_excre_respo solid_waste_respo Grey_wat_respo Black_wat_respo {
  omodel logit `var' $IndepVars
} 
