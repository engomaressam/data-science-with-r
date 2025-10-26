Try again
You earned 11 points, but you need to earn at least 15 / 20 points to pass. Review your feedback below, improve your submission, and resubmit when you're ready.
AI Grading
Your assignment has been graded by AI. View your scores below.

course.05.module.05
Submitted on October 23, 2025
Shareable Link
Prompt
Task 1: Get a COVID-19 pandemic Wiki page using HTTP request (2 pts)

Submit a screenshot contains the task code cells and the HTTP response from the Wiki URL 

task1_web_scraping.png

task1_web_scraping.png
Web scraping COVID-19 data from Wikipedia using R

Rubric
Review the screenshot of Task 1. The code cell and output should meet the following criteria: 

    1. Completed `get_wiki_covid19_page` function to get the http response from target URL 

    2. Called `get_wiki_covid19_page` function and returned a http response with a correct COVID-19 html page in the response 

TIP: If the screenshot appears small and is hard to read try zooming in by pressing "Ctrl" and "+" keys together (Mac: "Command" and "+"), or Right-click on the image and "View Image" (Firefox) or "Open Image in new Tab" (Chrome).

2 points
Correct. The learner completed `get_wiki_covid19_page` function and called the function and print the http response 

1 point
Partially correct. The learner written an incomplete `get_wiki_covid19_page` function that cannot get the correct COVID-19 html page 

0 points
Incorrect. The learner did not complete `get_wiki_covid19_page` function 

Prompt
Task 2: Extract COVID-19 testing data table from the wiki HTML page (2 pts) 

Submit a screenshot contains the task code cells and converted data frame 

task2_preprocessing.png

task2_preprocessing.png
Data cleaning and preprocessing for 172 countries

Rubric
Review the screenshot of Task 2. The code cell and output should meet the following criteria: 

1. Read the root html node from the COVID-19 html page in the previous step 

2. Read the correct html table node from the root html node 

3. Convert the html table node into a COVID-19 data frame

2 points
Correct. The learner was able to read the html table in the COVID-19 page and convert it into a datable 

1 point
Partially correct. The learner was able to read the html table node but not able to convert it into a data frame 

0 points
Incorrect. The learner was NOT able to read the html table in the COVID-19 page and convert it into a datable

Prompt
Task 3: Pre-process and export the COVID-19 data frame (2 pts) 

Submit a screenshot contains the task code cells and the preprocessed data frame 

task3_subsetting.png

task3_subsetting.png
Filtering complete data records, removing NA values

Rubric
Review the screenshot of Task 3. The code cell and output should meet the following criteria:  

1. Printed the summary of the COVID-19 data frame 

2. Called the prepared `preprocess_covid_data_frame` function to pre-process the data frame and print summary again 

3. Write the processed COVID-19 data frame into a csv file

Note that the actual values shown on the submitted screenshot may be different from your code execution because the Wiki page may be updated with new data. 

2 points
Correct. The learner was able to summarize, preprocess, and export the data frame ((i.e., the csv file exists))

1 point
Partially correct. The learner was either failed to summarize/preprocess or export the data frame (i.e., the csv file doesn't exist)

0 points
Incorrect. The learner was NOT able to summarize, preprocess, and export the data frame (i.e., the csv file doesn't exist)

Prompt
Task 4: Get a subset of the COVID-19 data frame (2 pts) 

Submit a screenshot contains the task code cell and the subset of data frame

task4_global_stats.png

task4_global_stats.png
Global COVID-19 statistics: cases, deaths, population totals

Rubric
Review the screenshot of Task 4. The code cell and output should meet the following criteria: 

1. Read the data frame from the exported csv file 

2. Sliced the data frame to get 5th to 10th rows with `country` and `confirmed` columns selected 

Note that the actual values shown on the submitted screenshot may be different from your code execution because the Wiki page may be updated with new data. 

2 points
Correct. The learner was able to read the data frame back from csv and get the target subset. 

1 point
Partially correct. The learner was either failed to read the data frame from csv or  get the target subset. 

0 points
Incorrect. The learner was NOT able to read the data frame back from csv and get the target subset.

Prompt
Task 5: Calculate worldwide COVID-19 testing positive ratio (2 pts)  

Submit a screenshot contains the task code cell and the confirmation ratio 

task5_ratio_calculation.png

task5_ratio_calculation.png
Calculating confirmed-to-population ratios as percentages

Rubric
Review the screenshot of Task 5. The code cell and output should meet the following criteria:  

1. Calculated sums of all confirmed cases and tested cases worldwide 

2. Divided the confirmed cases sum by tested cases sum to get the confirmation ratio 

Note that the actual values shown on the submitted screenshot maybe different from your code execution because the Wiki page maybe updated with new data. 

2 points
Correct. The learner was able to calculate the confirmation ratio worldwide. 

1 point
Partially correct. The learner was either failed to calculate the sums or calculate the confirmation ratio.

0 points
Incorrect. The learner was NOT able to calculate the sums and confirmation ratio.

Prompt
Task 6: Get a sorted name list of countries that reported their testing data (2 pts)  

Submit a screenshot with the code cell and the sorted country names.

task6_sorting.png

task6_sorting.png
Countries ranked by total confirmed cases (descending)

Rubric
Review the screenshot of Task 6. The code cell and output should meet the following criteria: 

   1.  Get the country name column and check if the values are in character.

   2. Sort the country names 

Note that the actual values shown on the submitted screenshot maybe different from your code execution because the Wiki page maybe updated with new data. 

2 points
Correct. The learner was able to get all country names and sort them.

1 point
Partially correct. The learner was either failed to get the country names or sort them.

0 points
Incorrect. The learner was NOT able to get all country names and sort them.

Prompt
Task 7: Identify countries names with a specific pattern (2 pts)  

Submit a screenshot contains the task code cell and country names starting with `United` 

task7_pattern_matching.png

task7_pattern_matching.png
Finding countries with "United" in their names

Rubric
Review the screenshot of Task 7. The code cell and output should meet the following criteria: 

   1.  Use a regular expression to find matches in the country name column with `United.+` 

   2.  Print the filtered data frame containing the matched country names 

Note that the actual values shown on the submitted screenshot may be different from your code execution because the Wiki page may be updated with new data. 

2 points
Correct. The  learner was able to identify country names with pattern 'United.+' and print them.

1 point
Partially correct. The learner has either failed to identify country names with pattern 'United.+' or failed to print them.

0 points
Incorrect. The learner was NOT able to get all country names and print them.

Prompt
Task 8: Pick two countries you are interested in, and then review their testing data (2 pts)  

Submit a screenshot with the task code cell and the `country`, `confirmed`, and `confirmed.population.ratio` columns of the two selected countries.

task8_country_comparison.png

task8_country_comparison.png
Brazil vs Russia: cases, deaths, population comparison

Rubric
Review the screenshot of Task 8. The code cell and output should meet the following criteria: 

   1. Selected two countries by their names from the data frame 

   2. Selected three target columns (`country`, `confirmed`, and `confirmed.population.ratio`) 

Note that the actual values shown on the submitted screenshot maybe different from your code execution because the Wiki page maybe updated with new data. 

2 points
Correct. The learner was able to select two rows by country names and the three target columns.

1 point
Partially correct. The learner was either failed to select the two country rows or get the three target columns.

0 points
Incorrect. The learner was NOT able to select two rows by country names and the three target columns.

Prompt
Task 9: Compare which one of the selected countries has a larger ratio of confirmed cases to population (2 pts)  

Submit a screenshot contains the task code cell and the country name with larger confirmed-to-population ratio.

task9_ratio_comparison.png

task9_ratio_comparison.png
US vs Germany infection rate comparison

Rubric
Review the screenshot of Task 9. The code cell and output should meet the following criteria: 

   1. Used IF statement to compare the confirmed-to-population ratio 

   2. Printed the country name with larger confirmed-to-population ratio 

Note that the actual values shown on the submitted screenshot may be different from your code execution because the Wiki page may be updated with new data.

2 points
Correct. The learner was able to compare the confirmed-to-population ratio and print the country name with a larger ratio.

1 point
Partially correct. The learner was either failed to compare the confirmed-to-population ratio or print the country name with a larger ratio.

0 points
Incorrect. The learner was NOT able to compare the confirmed-to-population ratio and print the country name with a larger ratio.

Prompt
Task 10: Filter countries with confirmed-to-population ratio rate less than a threshold (2 pts)  

Submit a screenshot contains the task code cell and the countries with confirmed-to-population ratio less than 1%.

task10_threshold_filtering.png

task10_threshold_filtering.png
Countries with infection rates below 1% threshold

Rubric
Review the screenshot of Task 9. The code cell and output should meet the following criteria: 

1. Selected the countries with confirmed-to-population rate less than 1% 

Note that the actual values shown on the submitted screenshot may be different from your code execution because the Wiki page may be updated with new data. 

2 points
Correct. The learner was able to select the countries with confirmed-to-population ratio less than 1%.

1 point
Partially correct. The learner was either failed to filter the countries or used an incorrect threshold when filtering.

0 points
Incorrect. The learner was NOT able to select the countries with confirmed-to-population ratio less than 1%. 