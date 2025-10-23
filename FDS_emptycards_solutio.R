# Creating dataset
Emp_ID <- c("E1", "E2", "E3", "E4", "E5", "E6", "E7", "E8")
Name <- c("X", "Y", "Z", "X", "Y", "Z", "X", "Y")
Age <- c(34, 29, 40, 30, 35, 27, 41, 30)
Dept <- c("HR", "IT", "Finance", "Marketing", "HR", "IT", "Finance", "Marketing")
Salary <- c(50000, 60000, 70000, 80000, 50000, 65000, 45000, 60000)
Gender <- c("Male", "Female", "Male", "Female", "Male", "Female", "Male", "Female")
Experience <- c(5, 3, 10, 4, 2, 7, 9, 6)
# Extract Salary as vector
salary_vec <- Salary

# Calculate average salary
avg_salary <- mean(salary_vec)

avg_salary
# Age vector
age_vec <- Age

# Minimum and Maximum Age
min_age <- min(age_vec)
max_age <- max(age_vec)

min_age
max_age
# Creating a list for a single employee
employee1 <- list(Name="X", Department="HR", Age=34, Salary=50000)

# Display each element
employee1$Name
employee1$Department
employee1$Age
employee1$Salary
# Mean and Standard Deviation
mean_age <- mean(Age)
sd_age <- sd(Age)

mean_salary <- mean(Salary)
sd_salary <- sd(Salary)

# Correlation between Age and Salary
cor_age_salary <- cor(Age, Salary)

mean_age
sd_age
mean_salary
sd_salary
cor_age_salary








# Box plot
boxplot(mpg ~ cyl, data = mtcars,
        main = "Comparison of MPG across Cylinder Types",
        xlab = "Number of Cylinders",
        ylab = "Miles per Gallon (mpg)",
        col = c("lightblue", "lightgreen", "lightpink"))
# Histogram
hist(mtcars$wt,
     main = "Distribution of Car Weights",
     xlab = "Weight (1000 lbs)",
     ylab = "Frequency",
     col = "lightcoral",
     breaks = 8)  # Custom number of bins

