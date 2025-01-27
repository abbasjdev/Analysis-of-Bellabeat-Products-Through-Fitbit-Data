#The purpose of this script is to turn the findings into a donut chart to gather insight on the typical daily 
#behavior of a Fitbit user

# Loading packages to create donut chart:
library(tidyverse)
library(ggplot2)
library(plotly)
library(IRdisplay)

#Importing dataset that was extracted on SQL:
daily_behavior <- read.csv("Average_Day_and_Night_Activity.csv")
View(daily_behavior)

#Finding the average daily cycle of all Fitbit users.
#Note:We have combined the high activity with the moderate activity for simplification purposes. 
mean_highly = round(mean(((daily_behavior[,2]+daily_behavior[,3])/2)), 1)
mean_lightly = round(mean(daily_behavior[,4]), 1)
mean_sedintary = round(mean(daily_behavior[,5]), 1)
mean_sleep = round(mean(daily_behavior[,6]), 1)

#Making a table from the averages:
#Ideal number derived from sources below
avg_behavior <- data.frame(activity=c("Highly Active", 
                               "Lightly Active", 
                               "Sedentary", 
                               "Asleep"),
                           hours=c(mean_highly,
                               mean_lightly,
                               mean_sedintary,
                               mean_sleep))
  
                      
                        
View(avg_behavior)


#Compute percentage
avg_behavior$fraction = avg_behavior$hours / sum(avg_behavior$hours)
  
# Compute the cumulative percentages (top of each rectangle)
avg_behavior$ymax = cumsum(avg_behavior$fraction)

# Compute the bottom of each rectangle
avg_behavior$ymin = c(0, head(avg_behavior$ymax, n=-1))

# Compute label position
avg_behavior$labelPosition <- (avg_behavior$ymax + avg_behavior$ymin + .09) / 2

# Compute a good label
avg_behavior$label <- paste0(avg_behavior$activity, "\n Hours: ", avg_behavior$hours)

#Making the Plot
ggplot(avg_behavior, aes(ymax=ymax, ymin=ymin, xmax=4, xmin=3, fill=activity)) +
  geom_rect() +
  coord_polar(theta="y", start=0, direction = -1) + 
  geom_text( x=4.3, aes(y=labelPosition, label=label), size=4.6, color="black") + # x here controls label position (inner / outer)
  scale_fill_brewer(palette=3) +
  scale_color_brewer(palette=3) +
  xlim(c(1.5, 4)) +
  theme_void() +
  labs(title=expression(underline("Average Activity Throughout The Day")), 
       subtitle = " The average number of hours spent at each activity level across more than \n 12,000 observatations between 23 Fitbit Users : \n") +
  theme(plot.title = element_text(face="bold"))




#The purpose of this script is to highlight the difference between actual Fitbit user 
#behavior and the ideal/recommended behavior.
#This will allow us to gather insights on consumer behavior and product development.
#To do so, we will primarily be using a bar chart as they better illustrate differences
#in data:




# Loading packages to create donut chart:
library(tidyverse)
library(ggplot2)
library(plotly)
library(IRdisplay)


#Importing dataset that was extracted on SQL:
daily_behavior <- read.csv("Average_Day_and_Night_Activity.csv")
View(daily_behavior)

#Finding the average daily cycle of all Fitbit users.
mean_very_fairly = round(mean(((daily_behavior[,2]+daily_behavior[,3])/2)), 1)
mean_lightly = round(mean(daily_behavior[,4]), 1)
mean_sedintary = round(mean(daily_behavior[,5]), 1)
mean_sleep = round(mean(daily_behavior[,6]), 1)

#Making a table from the averages:
#Ideal number derived from sources below
Actual_or_Ideal_avg_behavior <- data.frame(activity=rep(c("High Activity",
                                                          "High(Ideal)",
                                                          "Light Activity",
                                                          "Light(Ideal)",
                                                          "Sedentary",
                                                          "Sedentary(Ideal)",
                                                          "Asleep",
                                                          "Asleep(Ideal)")),
                                           hours=c(mean_very_fairly,
                                                   1.88,
                                                   mean_lightly,
                                                   24-(1.88 + 10 + 8),
                                                   mean_sedintary,
                                                   10,
                                                   mean_sleep,
                                                   8),
                                           AVI=c(
                                             "Actual",
                                             "Ideal",
                                             "Actual",
                                             "Ideal",
                                             "Actual",
                                             "Ideal",
                                             "Actual",
                                             "Ideal"))

Legend <- c("Actual",
            "Ideal",
            "Actual",
            "Ideal",
            "Actual",
            "Ideal",
            "Actual",
            "Ideal")

ggplot(Actual_or_Ideal_avg_behavior, aes(fill=Legend , y=hours, x=activity)) + 
  geom_bar(position="dodge", stat="identity") +
  theme_bw() +
  scale_y_continuous(breaks=c(2,4,6,8,10,12,14)) +
  labs(title = "Actual vs Ideal Activity",
       subtitle="A simple bar chart comparining the actual levels of \n sleep (red)  to the ideal level of sleep (green):",
       x = "Activity Levels", y = "Hours") + 
  theme(plot.title=element_text(face="bold"))
