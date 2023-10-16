# Load the datset
library(readxl)

# Load the two sheets into data frames
setwd("C:/Users/73995/OneDrive/桌面")
sheet1 <- read_excel("nfl_elo_latest.xlsx", sheet = 1)
sheet2 <- read_excel("nfl_elo_latest.xlsx", sheet = 2)

# Combine datasets
combined_data <- rbind(sheet1,sheet2)

# Convert the numeric date to a date object
library(dplyr)

combined_data$date <- format(as.Date(combined_data$date, origin = "1899-12-30"), "%m/%d/%y")

# Data clean the season column
library(dplyr)
combined_data <- combined_data %>%
  mutate(
    season = ifelse(grepl("^\\d{4}$", season), season, "2020")
  )

# Create a histogram for elo2_pre
library(ggplot2)
hist_plot <- ggplot(combined_data, aes(x = elo2_pre)) +
  geom_histogram(binwidth = 40, fill = "blue", color = "black") +
  labs(title = "Histogram of elo2_pre")
print(hist_plot)

# Create a boxplot for qbelo1_pre
library(ggplot2)
boxplot <- ggplot(combined_data, aes(y = qbelo1_pre)) +
  geom_boxplot(fill = "red", color = "black") +
  labs(title = "Boxplot of qbelo1_pre")
print(boxplot)
