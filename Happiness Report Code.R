# Final Project Code
## Katie Loveland -- Section 3

library(tidyverse)
# Time Use Survey

# Read in csv file
TimeUse <- read.csv("https://perso.telecom-paristech.fr/eagan/class/igr204/data/TimeUse.csv",)%>%
  arrange(GEO.ACL00) %>%
  rename(Country = GEO.ACL00)
 
#Tidy Text Above -> Arrange columns, and rename country column                  

view(TimeUse)

# Kaggle Happiness Rank

# Read in 5 CSVs
Happy2015 <- read.csv("2015.csv")
Happy2016 <- read.csv("2016.csv")
Happy2017 <- read.csv("2017.csv")
Happy2018 <- read.csv("2018.csv")
Happy2019 <- read.csv("2019.csv")

view(Happy2015)

# Read in World Happiness Report
library(readxl)
WorldChange <- read_excel("WorldHappinessReport.xls") %>%
  rename(Country = "Country name")
view(WorldChange)

# Combinging Data through a full join
Compare2015 <- Happy2015 %>%
  full_join(TimeUse, by = c("Country")) 

view(Compare2015)

# Filtering desired data
Compare2015_2 <- select(Compare2015, Country, SEX, "Happiness.Rank","Employment..related.activities.and.travel.as.part.of.during.main.and.second.job",  "Leisure..social.and.associative.life")

view(Compare2015_2)
# Arrange descending by Leisure time
Compare2015_3 <- arrange(Compare2015_2, desc(Leisure..social.and.associative.life))
view(Compare2015_3)

# Now Join to compare change overtime with score.
Compare_World <- Compare2015_3 %>%
  full_join(WorldChange, by = c("Country"))

view(Compare_World)

Compare_World2 <- select(Compare_World, Country, SEX, "Happiness.Rank","Employment..related.activities.and.travel.as.part.of.during.main.and.second.job",  "Leisure..social.and.associative.life", "Changes in ladder scores", "Standard error of changes in ladder scores")
View(Compare_World2)

write.csv(Compare_World2, "C:\\Desktop\\Code.csv")
     