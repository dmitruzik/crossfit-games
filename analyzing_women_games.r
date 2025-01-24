library(ggplot2)
library(dplyr)
library(readxl)

file_path <- "data/CrossFit_Games_Athletes_Women_2019.xlsx"

data <- read_excel(file_path, skip = 9)

head(data)


colnames(data)

athletes_per_country <- data %>%
    count(country, sort = TRUE)


print(athletes_per_country)


plot1 <- ggplot(athletes_per_country, aes(x = reorder(country, n), y = n)) +
    geom_bar(stat = "identity", fill = "skyblue") +
    coord_flip() +
    labs(
        title = "Number of Athletes by Country",
        x = "Country",
        y = "Number of Athletes"
    ) +
    theme_minimal()

print(plot1)
Sys.sleep(2)

average_age <- mean(data$age, na.rm = TRUE)


print(paste("Average Age:", round(average_age, 2)))


plot2 <- ggplot() +
    geom_bar(aes(x = "Average Age", y = average_age), stat = "identity", fill = "salmon") +
    labs(
        title = "Average Age of Athletes",
        x = "",
        y = "Age"
    ) +
    theme_minimal()


print(plot2)
Sys.sleep(2)

average_score <- mean(data$overallscore, na.rm = TRUE)

print(paste("Average Score:", round(average_score, 2)))

plot3 <- ggplot() +
    geom_bar(aes(x = "Average Score", y = average_score), stat = "identity", fill = "lightgreen") +
    labs(
        title = "Average Overall Score of Athletes",
        x = "",
        y = "Score"
    ) +
    theme_minimal()


print(plot3)


data <- data %>%
    filter(!grepl("-", division))
