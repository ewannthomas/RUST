
library(tidyverse)
library(haven)
library(scales)
library(ggrepel)


nss_76<-read_dta("MLogit.dta") #reading in the dta file




# Cum Freq ----------------------------------------------------------------


nss_76 %>% filter(State==36) %>% mutate(
  vaga=case_when(
    VI_In_House>0 ~ 1,
    VI_Behave>0 && VI_In_House>=1 ~ 2,
            TRUE ~ NA_real_)) %>% select(VI_Behave, VI_In_House, VI_Micro, VI_Diseases, VI_Total, vaga) %>%  head(25)

  count(vaga)
  VI_Behave>0 & 

  VI_Behave>0 & VI_In_House>0 & VI_Micro>0 ~ 3,
  VI_Behave>0 & VI_In_House>0 & VI_Micro>0 & VI_Diseases>0 ~ 4,
  
  
  
cum<-nss_76 %>% filter(State==36) %>% group_by(VI_revamp) %>% count(VI_revamp) 

nss_76 %>% arrange(HH_ID)

ggplot(data=cum, aes(x= VI_revamp, y=n))+
         stat_ecdf(geom = "step") +
  xlab("Vulnerability Index")+
  ylab("Cumulative Frequency")+
  theme_gray()+
  geom_vline(xintercept=0.5, color="red")
  
nss_76<- structure(list(VI_Behave = structure(c(0, 2, 0, 0, 0, 0, 0, 0, 
                                       1, 0, 0, 0, 0, 1, 0, 0, 2, 1, 2, 0, 1, 1, 1, 2, 2), format.stata = "%9.0g"), 
               VI_In_House = structure(c(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
                                         0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1), format.stata = "%9.0g"), 
               VI_Micro = structure(c(3, 4, 2, 1, 3, 3, 4, 4, 3, 1, 2, 1, 
                                      1, 1, 4, 3, 3, 3, 3, 3, 3, 3, 3, 3, 2), format.stata = "%9.0g"), 
               VI_Diseases = structure(c(0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 
                                         0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0), format.stata = "%9.0g"), 
               VI_Total = structure(c(3, 6, 2, 1, 4, 3, 4, 4, 4, 1, 2, 1, 
                                      1, 2, 4, 3, 5, 4, 5, 3, 4, 4, 5, 5, 5), format.stata = "%9.0g")), row.names = c(NA, 
                                                                                                                      -25L), class = c("tbl_df", "tbl", "data.frame"))






nss_76<-nss_76 %>% mutate(
  vaga=case_when(
    VI_Behave>0 & VI_In_House>0 & VI_Micro>0 & VI_Diseases>0 ~ 4,
    VI_Behave>0 & VI_In_House>0 & VI_Micro>0 ~ 3,
    VI_Behave>0 & VI_In_House>0 ~ 2,
    VI_In_House>0 ~ 1,
    TRUE ~ NA_real_))
  

nss_76 %>% filter(State==36) %>% select(VI_Behave, VI_In_House, VI_Micro, VI_Diseases, VI_Total, vaga) %>% count(vaga)




# Stacked Bar  ------------------------------------------------------------
nss_76<-nss_76 %>% mutate(Sc_grp = as_factor(Sc_grp),
                  Gender_recoded = as_factor(Gender_recoded),
                  Gen_ed_lev_recoded = as_factor(Gen_ed_lev_recoded),
                  Rural_Urban = as_factor(Rural_Urban),
                  poverty_line = as_factor(poverty_line))

SC<-nss_76 %>% filter(State==36) %>% group_by(Sc_grp) %>% 
  summarize_at(vars(VI_Diseases,VI_Behave,VI_In_House,VI_Micro), list(sum=sum)) %>%  
  pivot_longer(starts_with("VI"), names_to = "VI", values_to = "value") %>% rename(demo=Sc_grp)

PL<-nss_76 %>% filter(State==36) %>% group_by(poverty_line) %>% 
  summarize_at(vars(VI_Diseases,VI_Behave,VI_In_House,VI_Micro), list(sum=sum)) %>%  
  pivot_longer(starts_with("VI"), names_to = "VI", values_to = "value") %>% rename(demo=poverty_line)

Edu<-nss_76 %>% filter(State==36) %>% group_by(Gen_ed_lev_recoded) %>% 
  summarize_at(vars(VI_Diseases,VI_Behave,VI_In_House,VI_Micro), list(sum=sum)) %>%  
  pivot_longer(starts_with("VI"), names_to = "VI", values_to = "value") %>% rename(demo=Gen_ed_lev_recoded)

Sector<-nss_76 %>% filter(State==36) %>% group_by(Rural_Urban) %>% 
  summarize_at(vars(VI_Diseases,VI_Behave,VI_In_House,VI_Micro), list(sum=sum)) %>%  
  pivot_longer(starts_with("VI"), names_to = "VI", values_to = "value") %>% rename(demo=Rural_Urban)

tot<-bind_rows(SC, PL, Edu, Sector) %>% 
  mutate(VI= as_factor(VI)) %>% group_by(demo) %>% 
  mutate(per = value/ sum(value))


tot %>%
  ggplot(aes(x=demo))+
  geom_bar(aes(y= per, fill=fct_reorder(VI, per, .desc=T)), position="stack", stat="identity") +
  scale_y_continuous(labels = percent)+
  xlab("Percentage Share of Dimensions") +
  ylab("Demographic Features") +
  scale_fill_discrete(name=NULL, labels= c("Unsanitary Micro Environment", "Hygiene Risk", "Infrastructure Deficiency", "Disease Risk"))+
  ggtitle("Percentage Share of ESVI Dimensions by Demographic Features")+
  theme(legend.position = "bottom",
        plot.title = element_text(hjust = 0.5, size = 20),
        axis.text.x.bottom = element_text(size = 20, angle = 10),
        axis.title.x.bottom = element_text(size = 25),
        axis.title.y.left = element_text(size=25),
        axis.text.y.left = element_text(size = 16),
        legend.text = element_text(size = 16, hjust = 0),
        legend.title = element_text(size = 16))

       

  paste0((round(tot$per,2))*100,"%")

# Mean VI by SC and Gender ------------------------------------------------
nss_76<-nss_76 %>% mutate(Sc_grp = as_factor(Sc_grp),
                          Gender_recoded = as_factor(Gender_recoded),
                          Gen_ed_lev_recoded = as_factor(Gen_ed_lev_recoded),
                          Rural_Urban = as_factor(Rural_Urban),
                          poverty_line = as_factor(poverty_line))


Mean<-nss_76 %>% filter(State==36) %>%  
  mutate(Wt=Multiplier/100) %>% 
  group_by(Sc_grp, Gender_recoded) %>%
  summarise(Sc_grp_n = n(),
         Sc_grp_mean = weighted.mean(VI_revamp, Wt),
         Sc_grp_sd = sd(VI_revamp)) %>% ungroup() %>%  
  mutate(SE = Sc_grp_sd / sqrt(Sc_grp_n),
         t = qt((1-0.05)/2 +.5, Sc_grp_n-1),
         CI = t*SE)

ggplot(Mean,aes(x=Sc_grp, y=Sc_grp_mean, fill=Gender_recoded)) +
  geom_bar(stat="Identity", position = position_dodge(width = 0.9), alpha=5) +
  geom_errorbar(aes(ymin=(Sc_grp_mean - CI), ymax=(Sc_grp_mean + CI)), position=position_dodge(width = 0.9), alpha=5, width=0.4, color="red") +
  geom_text(aes(y=Sc_grp_mean), label= round(Mean$Sc_grp_mean, 2), color= "black", size =5, alpha = 25, vjust=10, hjust=0.5, stat = "identity", position = position_dodge(width = 1))+
  scale_fill_manual(values = c("olivedrab2", "steelblue")) +
  ylab("Mean ESVI") + xlab("Social Group") + ggtitle("Mean of Environmental Sanitation Vulnerability Index", subtitle = "With 95 Percent Confidence Intervals") +
  labs(fill="Gender of HH Head") +
  theme(plot.title = element_text(hjust = 0.5, size = 30),
        plot.subtitle = element_text(hjust = 0.5,size = 28),
        axis.text.x.bottom = element_text(size = 23),
        axis.title.x.bottom = element_text(size = 25),
        axis.title.y.left = element_text(size=25),
        axis.text.y.left = element_text(size = 16),
        legend.text = element_text(size = 18),
        legend.title = element_text(size = 16))


ggsave("./Vulnerability Index/Mean VI by sc gender", plot=Boom, device = "tiff")
  