# Step 1: Create simple dataset
students <- data.frame(
  ID = 1:10,
  Name = c("Ali", "Sara", "Usman", "Hina", "Adeel", "Zara", "Bilal", "Noor", "Hamza", "Iqra"),
  Age = c(20, 22, 21, 19, 23, 22, 20, 21, 24, 20),
  Device = c("Mobile", "Laptop", "Tablet", "Mobile", "Laptop", "Mobile", "Tablet", "Laptop", "Mobile", "Tablet"),
  Hours = c(5, 7, 4, 6, NA, 3, 8, 2, NA, 5)
)

# Step 2: Show the dataset
print("Original Data:")
print(students)

# Step 3: Handle missing values (NA)
students$Hours[is.na(students$Hours)] <- mean(students$Hours, na.rm = TRUE)

# Step 4: Add new column – total weekly hours
students$Weekly_Hours <- students$Hours * 7

# Step 5: Change device names to uppercase
students$Device <- toupper(students$Device)

# Step 6: Final cleaned data
print("Cleaned & Transformed Data:")
print(students)
# 🔹 Step 6: Univariate Analysis
# -----------------------------

# A) Numerical variable analysis (Hours)
cat("\nSummary of 'Hours':\n")
summary(students$Hours)

# Histogram for Hours
hist(students$Hours,
     main = "Distribution of Daily Tech Usage (Hours)",
     xlab = "Hours per Day",
     col = "lightblue",
     border = "black")

# B) Categorical variable analysis (Device)
cat("\nFrequency of Device Types:\n")
table(students$Device)

# Barplot for Devices
barplot(table(students$Device),
        main = "Device Usage by Students",
        col = "lightgreen",
        xlab = "Device Type",
        ylab = "Count")
# 🔹 Step 2: Bivariate Analysis
# -----------------------------

# A) Numeric vs Numeric → Scatter Plot (Hours vs Age)
plot(students$Age, students$Hours,
     main = "Bivariate Analysis: Age vs Daily Tech Hours",
     xlab = "Age",
     ylab = "Hours per Day",
     col = "blue",
     pch = 19)

# Correlation between Age and Hours
correlation <- cor(students$Age, students$Hours)
cat("\nCorrelation between Age and Hours:", correlation, "\n")

# B) Numeric vs Categorical → Boxplot (Device vs Hours)
boxplot(Hours ~ Device, data = students,
        main = "Bivariate Analysis: Device vs Hours",
        xlab = "Device Type",
        ylab = "Hours per Day",
        col = "lightpink",
        border = "black")
# 🔹 Step 2: Multivariate Analysis
# ---------------------------------------

# A) Correlation matrix for numeric variables
num_data <- students[, c("Age", "Hours", "Weekly_Hours")]
cor_matrix <- cor(num_data)
cat("\nCorrelation Matrix:\n")
print(cor_matrix)


# C) Multivariate visualization using colors (Age vs Hours, colored by Device)
plot(students$Age, students$Hours,
     main = "Multivariate Analysis: Age vs Hours (Colored by Device)",
     xlab = "Age",
     ylab = "Daily Tech Hours",
     col = as.factor(students$Device),
     pch = 19)
legend("topright", legend = unique(students$Device),
       col = 1:length(unique(students$Device)), pch = 19)