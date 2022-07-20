library(tidyverse)

################################################################################

# Make data the same for all people
# salarydata <- read.csv("~/Documents/SMU/STAT2/Project 2/adult_data.csv", header = FALSE)
# head(salarydata)

# Make new dataset for all of us to work on
# salarydata <- salarydata %>% rename(Age=V1, WorkClass=V2, Fnlwgt=V3, Education=V4, 
#                                    EducationNum=V5, MaritalStatue=V6, Occupation=V7, 
#                                    Relationship=V8, Race=V9, Sex=V10, CapitalGains=V11, 
#                                    CapitalLoss=V12, HoursPerWeek=V13, NativeCountry=V14, 
#                                    OverUnder50k=V15)
# head(salarydata)
# write.table(salarydata, "SalaryData.csv", sep = ",", row.names = FALSE)

# load in the data
salarydata <- read.csv("SalaryData.csv")
str(salarydata)
summary(salarydata)
sum(is.na(salarydata))
salarydata <- salarydata %>% mutate(across(where(is.character), as.factor))
salarydata$Education <- factor(salarydata$Education, levels = c(" Preschool", " 1st-4th",
                                                                " 5th-6th", " 7th-8th",
                                                                " 9th", " 10th", " 11th", 
                                                                " 12th", " HS-grad", " Prof-school",
                                                                " Some-college"," Assoc-voc", 
                                                                " Assoc-acdm", " Bachelors", " Masters",
                                                                " Doctorate"))

# missing data
salarydata[salarydata == " ?"]

df[df == 11 | df == 33] <- 77

salarydata2 <- salarydata[which(salarydata$NativeCountry == " ?"),]
salarydata <- salarydata[which(salarydata$NativeCountry == " ?"),]
salarydata2$NativeCountry <- "Unknown"

################################################################################

# box plot showing total over and under 50k
ggplot(salarydata, aes(x=OverUnder50k)) +
  geom_bar(fill = "steelblue") +
  ggtitle("Number of Over and Under 50k") +
  theme_classic()

# Age vs HoursPerWeek
ggplot(salarydata, aes(x=Age, y=HoursPerWeek, color = OverUnder50k)) +
  geom_point() +
  ggtitle("Age vs Hours Worked Per Week") +
  theme_classic()

# plot showing multiple continuous variables plotted
data<- salarydata %>% select(Age,HoursPerWeek,EducationNum,CapitalLoss,CapitalGains)
pairs(data)

# Age vs Race
ggplot(salarydata, aes(x=Race, y=Age, fill = OverUnder50k)) +
  geom_boxplot() +
  ggtitle("Race vs Age") +
  theme_classic()

# Age vs Education
ggplot(salarydata, aes(x=Education, y=Age, fill = OverUnder50k)) +
  geom_boxplot() +
  ggtitle("Education vs Age") +
  theme_classic()

