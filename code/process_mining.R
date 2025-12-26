# packages 
library(tidyverse)
library(lubridate)
# data link: https://www.kaggle.com/datasets/carlosalvite/car-insurance-claims-event-log-for-process-mining
# EDA ---------------------
df <- Insurance_claims_event_log
table(df$activity_name)
df %>% summarise(count = n_distinct(claimant_name))
df %>% count(agent_name) %>% arrange(desc(n))
df %>% group_by(car_make, car_year) %>% 
  summarise(highest_calim = max(claim_amount))

# plot by policy
palette <- c("#005b96", "#008080", "#004c4c") 

ggplot(df, aes(timestamp)) + 
  geom_histogram(aes(fill = type_of_policy)) + 
  scale_fill_manual(values = palette) +
  theme(panel.background = element_rect(color = 'black', fill = 'white'),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank()) +
  scale_y_continuous(labels = dollar) + 
  xlab('') + ylab('') + guides(fill = guide_legend('Type of Policy'))










