library(tidyverse)
library(aplore3)
data <- glow_bonemed
head(data)
write.table(data, "glow_bonemed.csv", sep = ",", row.names = FALSE)
str(data)
summary(data)
sum(is.na(data))

d1 <- data %>% select(bonemed | bonemed_fu)
head(d1)


d4 <- data[which(data$bonemed == "No" & data$bonemed_fu == "Yes"),]
nrow(d4)
d5 <- data[which(data$bonetreat == "Yes"),]
d5
nrow(d5)

################################################################################

salarydata <- read.csv("~/Documents/SMU/STAT2/Project 2/adult_data.csv", header = FALSE)
head(salarydata)

salarydata <- salarydata %>% rename(Age=V1, WorkClass=V2, Fnlwgt=V3, Education=V4, 
                                    EducationNum=V5, MaritalStatue=V6, Occupation=V7, 
                                    Relationship=V8, Race=V9, Sex=V10, CapitalGains=V11, 
                                    CapitalLoss=V12, HoursPerWeek=V13, NativeCountry=V14, 
                                    OverUnder50k=V15)

head(salarydata)
write.table(salarydata, "SalaryData.csv", sep = ",", row.names = FALSE)
read.csv("SalaryData.csv")


adultnames <- read.csv("~/Documents/SMU/STAT2/Project 2/adult_names.csv", header = FALSE)
head(adultnames)

adulttest <- read.csv("~/Documents/SMU/STAT2/Project 2/adult_test.csv", header = FALSE)
head(adulttest)
