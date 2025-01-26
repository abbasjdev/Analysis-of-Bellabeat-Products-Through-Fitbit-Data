Case Study Overview
We have been tasked to do the following:

1- Study the Fitbit smart device usage data to discover actionable insights.
2- Implement those insights into one of the Bellabeat products.
3- Utilize our implementation to attain competitive advantage.

The goals of this study is to uncover the following:

1- What are some trends in the Fitbit device usage?
2- How could these trends apply to Bellabeat customers?
-3 How could these trends help influence Bellabeat marketing strategy for one of our products?


Leaf Urban, Our wearable Health Device:
As stated in our third study goal, we aim to discover trends in the Fitbit device usage and apply the insight of those trends to our product to influence market strategy. The product we have primarily chosen is our Flagship Leaf Urban wearable device. The reasons for choosing the Leaf Urban as our product of choice to improve are as follows:

1-Leaf Urban is our highest -elling product, therefore it has the greatest reach in terms of product positioning. Changes in software will provide the most expected impact through Leaf Urban. If hardware changes were to occur, a “Leaf Urban 2.0” will have the most familiarity and will most probably be adopted by our consumer base as opposed to sequential redesigns in our other products.

2-Changes in consumer experience from the changes in software/marketing will be best recorded through the Leaf Urban since it has the most reach. The more data we are able to collect on the performance changes in one of our products, the more consolidated our decision-making will be when implementing changes in our other products.

What is a Fitbit and why it is relevant:
To reach the aforementioned goals, we have set out to conduct an analysis on consumer behavior on the Fitbit wearable device. Fitbits, like the Leaf Urban, are wearable devices that monitors the physiological metrics of the wearer. These metrics include heart rate, activity level, sleep, steps, calories, distance moved, and so forth.

Dataset Used:
Name: Fitbit Fitness Tracker Data: Link: https://www.kaggle.com/arashnic/Fitbit

Quick overview of The Dataset:
The Fitbit dataset contains 18 different subsets of data that contain records from 30 different users. Those records include data on their weight, heart rate, activity level, steps taken, their sleep, and calories burned. We will be using this dataset to derive insights that we can apply to Bellabeat products.

Assumptions on The Dataset:
1-The wearers are using the product throughout the day and at no point remove their Fitbits.

2-The dataset has accurate and precise records of the user activity levels.

3-The dataset observations are representative of all Fitbit users globally.

Cleaning/Organizing the Data:
Before we can get into analyzing the datasets, we will have to first clean and organize the data to make sure it is ready to use. Here is how we approached cleaning and organizing the dataset:

1-Collecting the Data that we need from the Dataset:
For collection and joining purposes, we used BigQuery, a cloud data warehouse by google. First, we uploaded the following datasets contained in the Fitbit data file:

dailyActivity_mergerd.csv as daily_activity                  
dailyCaloires_merged.csv as daily calories
dailyIntensities_merged.csv as daily_intensities
dailySteps_merged.csv as daily_steps
sleepDay_merged-date_fixed.csv as daily_sleep
weightLogInfo_merged -date_fixed.csv as weight_log_info
We focused primarily on the “daily” data to have an aggregate view of how Fitbit users behaved each day on average.

Note 1: Before I was able to upload the sleepDay_merged.csv dataset to BigQuery, I had to format the time to full ISO standard and UTC (2019-12-31 00:00:00) since BigQuery does not accept other formats. To do so, I uploaded the file to google sheets to adjust the formatting. The date and time was initially formatted as such: (MM/DD/YYYY HH:MM:SS AM/PM). The formatted file was saved as sleepDay_merged-date_fixed and was used instead. The same had to be done to weightLogInfo_merged.csv.

Note 2: Some of the datasets that were uploaded were ultimately unused. The reason for this is that the dataset either (1) did not have a sufficient number of observations or (2) weren’t applicable (or I personally couldn’t conceptualize their use) for the analysis.


2-Joining datasets to analyze their relation using SQL on BigQuery:
The first datasets we are looking to join for analysis are the daily_activity and daily_sleep datasets. The purpose of joining these datasets is to see Fitbit uses daily behavior in relation to sleep and waking hours. The requirements of both aspects are critical to heath, and being able to understand where (and where not) these requirements are being met will tell us what market strategy to focus on.

2-Joining datasets to analyze their relation using SQL on BigQuery:
The first datasets we are looking to join for analysis are the daily_activity and daily_sleep datasets. The purpose of joining these datasets is to see Fitbit uses daily behavior in relation to sleep and waking hours. The requirements of both aspects are critical to heath, and being able to understand where (and where not) these requirements are being met will tell us what market strategy to focus on.

Now that we have an idea of what the typical date of each Fitbit user is, we have to ask ourselves a delving question: “Is the typical daily routine of a Fitbit user optimal? If not, what are ways we can assist them in improving their daily routine.”

To answer this question, we will need to know what is considered “ideal” in the first place. To find out what is considered ideal, we have sourced various articles to find the answer (see references below). The Ideal numbers are the following:

Sleep: 7-9 hours (or 8) as an average.
Medium to high activity should be around 1.88 hours
Sedentary activity should be 10 hours at a maximum.
We had to calculate the light activity since the data did not provide a consistent metric, we calculated the ideal light activity as such: 24 hours - (ideal sleep + ideal high activity + ideal Sedentary activity) = 4.12


Insights:
1- The average Fitbit wearer is not getting enough sleep:
The recommended amount of sleep for a healthy adult is 7-9 hours a night (Sleep Foundation).
The average Fitbit user is getting just below the minimum amount.
The users sampled in the dataset will need to improve the amount of hours slept.
2 - The average Fitbit wearer is sedentary for too long, which will counteract the positive effects of exercise:
The maximum amount a time a person should stay sedentary is 10 hours a day (JAMA Cardiology, 2016)
The average Fitbit user is spending 3.6 more hours than the maximum limit and will have an increased probability of long- term health implications.
Fitbit Users should spend less time sedentary and more time active.
3- Most importantly, Fitbit users are not active enough.
The most significant observation is the actual high level activity (or lack thereof) being recorded.
The daily high activity levels are practically non-existent when the Fitbit users should be active around two hours a day.
This discrepancy is an opportunity for us to create value for Bellabeat customers.
Recommendations:
1- Create a dedicated content for sleep improvement based on user data:
Although the Flagship Leaf Urban does track sleep in a very detailed way, it does not provide content to users to aid the sleeping process.
Tips and tricks based on other user records, such as activity levels, stress, and weight, can be used as aspects to improve open since these areas are heavily correlated with sleep.
By making it apparent that these areas impact sleep, Bellabeat users will have a better understanding on how to improve their sleep.
2- Provide exercise content and benefits data to increase high daily activity:
By increasing their daily high activity levels to two hours, users will be able to reach their daily activity requirements and reduce their excess sedentary levels.
Providing at-home exercise programs (with a monthly subscription) will give users the tools to explore more high level activities. -Adopt such content to a course-like structure with fitness instructors can be an approach to sharing/teaching exercises. Adding features such as “Daily Exercises” and “Exercise Challenges” can encourage Bellabeat users to be more active. Further study will be needed to see the receptiveness/effectiveness of such product expansions. (survey data for receptiveness and A/B group testing for effectiveness).
Sources:
Credit to https://www.r-graph-gallery.com/128-ring-or-donut-plot.html for plot syntax

Optimal medium to high activity source: https://www.mayoclinic.org/healthy-lifestyle/fitness/expert-answers/exercise/faq-20057916#:~:text=For%20most%20healthy%20adults%2C%20the,of%20moderate%20and%20vigorous%20activity

Optimal sleep source https://www.sleepfoundation.org/how-sleep-works/how-much-sleep-do-we-really-need#:~:text=National%20Sleep%20Foundation%20guidelines1,to%208%20hours%20per%20night

Maximum Sedentary Time: Ambarish Pandey et al. Continuous Dose-Response Association Between Sedentary Time and Risk for Cardiovascular Disease, JAMA Cardiology (2016). DOI: 10.1001/jamacardio.2016.1567

Creator Notes:
Thank you so much for reading my notebook on the Fitbit dataset and how it can be used to improve Bellabeat data.

Be sure to leave an like on Linkedin if you liked this notebook. If you have recommendations or comments, be sure to write them in the comments section. I would be more than happy to receive any constructive feedback.





