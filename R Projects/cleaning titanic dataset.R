install.packages("tidyverse")
install.packages("dplyr")

titanic_data <- read.csv("Titanic-Dataset.csv")
View(titanic_data)

# run summary stats on dataframe
summary(titanic_data)

# look at structure of dataframe
str(titanic_data)

# Looking at the Column Names
names(titanic_data)

# Changing the Column Names to Lowercase
names(titanic_data) <- tolower(names(titanic_data))

# Fill missings values for Age with the median
titanic_data <- titanic_data %>% mutate(age = ifelse(is.na(age), median(age, na.rm = TRUE), age))

# Remove rows with missing Embarked Values
titanic_data <- titanic_data %>% filter(!is.na(embarked))

# Drop the Cabin Column
titanic_data <- titanic_data %>% select(-cabin)

# Convert relevant columns to appropriate data types
titanic_data <- titanic_data %>% mutate(survived = as.factor(survived), pclass = as.factor(pclass), sex = as.factor(sex), embarked = as.factor(embarked)) 

# Save my cleaned data to a new file
write.csv(titanic_data, "cleaned_titanic_data.csv", row.names = FALSE)
