# 🚢 Exploratory Data Analysis (EDA) on Titanic Dataset (Clean Version)

# 🧩 Load Libraries
library(titanic)
library(corrplot)
library(ggplot2)
library(dplyr)

# 📂 Load Dataset
data("titanic_train")
head(titanic_train)

# 📝 Basic Info
str(titanic_train)
summary(titanic_train)
dim(titanic_train)
names(titanic_train)

# 🔍 Missing Values
colSums(is.na(titanic_train))

# 💡 Handle Missing Data
titanic_clean <- titanic_train
titanic_clean$Age[is.na(titanic_clean$Age)] <- mean(titanic_clean$Age, na.rm = TRUE)
titanic_clean$Embarked[is.na(titanic_clean$Embarked)] <- names(sort(table(titanic_clean$Embarked), decreasing = TRUE))[1]
titanic_clean <- titanic_clean %>% select(-Cabin)

# ✅ Recheck Missing Values
colSums(is.na(titanic_clean))

# 📈 Descriptive Stats
mean(titanic_clean$Age)
median(titanic_clean$Age)
sd(titanic_clean$Age)

# 📊 Univariate Plots
hist(titanic_clean$Age, main = "Age Distribution", xlab = "Age", col = "skyblue", border = "white")
boxplot(titanic_clean$Fare, main = "Boxplot of Passenger Fare", col = "lightgreen")

# 🔄 Bivariate Plots
ggplot(titanic_clean, aes(x = Sex, fill = factor(Survived))) +
  geom_bar(position = "dodge") +
  labs(title = "Survival by Gender", x = "Gender", fill = "Survived")

ggplot(titanic_clean, aes(x = Pclass, fill = factor(Survived))) +
  geom_bar(position = "dodge") +
  labs(title = "Survival by Passenger Class", x = "Class", fill = "Survived")

# 🔗 Correlation Analysis
numeric_cols <- titanic_clean %>% select_if(is.numeric)
corr_matrix <- cor(numeric_cols)
corrplot(corr_matrix, method = "color", title = "Correlation Heatmap", mar = c(0,0,1,0))

# 📊 Group Summary
aggregate(Age ~ Pclass, data = titanic_clean, FUN = mean)

# ⚠️ Outliers
boxplot.stats(titanic_clean$Fare)$out


