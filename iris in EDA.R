library(ggplot2)
library(corrplot)


# 📝 Basic information
print("=== Basic Structure ===")
str(iris)

print("=== Summary Statistics ===")
summary(iris)

print("=== Dimensions and Column Names ===")
print(dim(iris))
print(names(iris))

# 🔍 Check for Missing Values
print("=== Missing Values ===")
print(colSums(is.na(iris)))

# 📈 Descriptive Statistics
print("=== Descriptive Statistics for Sepal.Length ===")
print(paste("Mean:", mean(iris$Sepal.Length)))
print(paste("Median:", median(iris$Sepal.Length)))
print(paste("Standard Deviation:", sd(iris$Sepal.Length)))

# 📊 Univariate Analysis
hist(iris$Sepal.Length,
     main = "Distribution of Sepal Length",
     xlab = "Sepal Length (cm)",
     col = "skyblue",
     border = "white")

boxplot(iris$Sepal.Length,
        main = "Boxplot of Sepal Length",
        col = "lightgreen")

# 🔄 Bivariate Analysis
plot(iris$Sepal.Length, iris$Petal.Length,
     main = "Sepal Length vs Petal Length",
     xlab = "Sepal Length (cm)",
     ylab = "Petal Length (cm)",
     col = "purple",
     pch = 19)

# 🔗 Correlation Analysis
print("=== Correlation Matrix ===")
corr_matrix <- cor(iris[, 1:4])
print(corr_matrix)
corrplot(corr_matrix, method = "color", title = "Correlation Heatmap", mar = c(0,0,1,0))

# 📊 Group-wise Summary (Mean by Species)
print("=== Mean Sepal Length by Species ===")
print(aggregate(Sepal.Length ~ Species, data = iris, FUN = mean))

# 🔍 Pairwise Relationships
pairs(iris[, 1:4], col = iris$Species,
      main = "Pairwise Relationships (Colored by Species)")

# ⚠️ Outlier Detection
print("=== Outliers in Sepal Length ===")
print(boxplot.stats(iris$Sepal.Length)$out)

# ✅ Summary Insights
cat("
Summary Insights:
-----------------
✔ No missing values found.
✔ Setosa species have smaller petals and sepals.
✔ Virginica species have longer petals and sepals.
✔ Strong positive correlation between Petal.Length and Petal.Width.
✔ Dataset is clean and balanced for ML use.
")
