Capstone Overview
In this capstone course you will apply various Data Science skills and techniques that you have learned as part of the previous courses.

You will assume the role of a Data Scientist who has recently joined an AI-powered weather data analytic company and be presented with a challenge that requires data collection, analysis, basic hypothesis testing, visualization, modelling, and dashboard to be performed on real-world datasets.

You will undertake the tasks of

Collecting and understanding data from multiple sources
Performing data wrangling and preparation with regular expressions and Tidyverse
Performing exploratory data analysis with SQL and visualization using Tidyverse and ggplot2
Performing modelling the data with linear regressions using Tidymodels
Building an interactive dashboard using R Shiny
The project will culminate with a presentation of your data analysis report, with an executive summary for the various stakeholders in the organization. You will be assessed on both your work for the various stages in the data analysis process, as well as the final deliverable.

This project is a great opportunity to showcase your Data Science skills, and demonstrate your proficiency to potential employers.

Project Scenario
Imagine that you have just been hired by an AI-powered weather data analytics company as a data scientist.

Your first project is to analyze how weather would affect bike-sharing demand in urban areas. To complete this project, you need to first collect and process related weather and bike-sharing demand data from various sources, perform exploratory data analysis on the data, and build predictive models to predict bike-sharing demand. You will combine your results and connect them to a live dashboard displaying an interactive map and associated visualization of the current weather and the estimated bike demand.

The last assignment is creating an insightful and informative slideshow and presenting it to your peers.

Understanding the source data
Here we introduce the data sources you will be utilizing in your capstone project.
Details on how to connect and/or download will be provided in the next section of this module.

Seoul Bike Sharing Demand Data Set
image

Rental bikes are available in many cities around the globe. It is important for each of these cities to provide a reliable supply of rental bikes to optimize availablity and accessibility to the public at all times. Also important is minimizing the cost of these programs, in part by minimizing the number of bikes supplied in order to meet the demand. Thus, to help optimize the supply it would be helpful to be able to predict the number of bikes required each hour of the day, based on currrent conditions such as the weather.The Seoul Bike Sharing Demand Data Set was designed for this purpose. It contains weather information (Temperature, Humidity, Windspeed, Visibility, Dewpoint, Solar radiation, Snowfall, Rainfall), and the number of bikes rented per hour and date.

You will use this dataset to build a linear regression model of the number of bikes rented each hour, based on the weather.

Attribute Information

Date : year-month-day
Rented Bike count - Count of bikes rented at each hour
Hour - Hour of he day Temperature-Temperature in Celsius
Humidity - unit is %
Windspeed - unit is m/s
Visibility - unit 10m
Dew point temperature - Celsius
Solar radiation - MJ/m2
Rainfall - mm Snowfall - cm
Seasons - Winter, Spring, Summer, Autumn
Holiday - Holiday/No holiday
Functional Day - NoFunc (Non Functional Hours), Fun(Functional hours)
Relevant Paper and Citation Request:

Sathishkumar V E, Jangwoo Park, and Yongyun Cho.
Using data mining techniques for bike sharing demand prediction in metropolitan city. Computer Communications, Vol.153, pp.353-366, March, 2020
Sathishkumar V E and Yongyun Cho.
A rule-based model for Seoul Bike sharing demand prediction using weather data European Journal of Remote Sensing, pp. 1-18, Feb, 2020
Open Weather API Data
image

The Open Weather API allows users to access current and forecasted weather data for any location including over 200,000 cities. OpenWeather collects and processes weather data from different sources such as global and local weather models, satellites, radars and a vast network of weather stations. You can access the data you will need for the project for free by registering for a Free Subscription. We will provide you with all of the details you need to sign up and to gain access to the data using HTTP request with R. The data you will be connecting to provides the weather forecast for every 3 hours over the next 5 days.

Global Bike Sharing Systems Dataset
The Global Bike Sharing Cities Dataset is an HTML table on the Wikipedia page
List of bicycle-sharing systems: https://en.wikipedia.org/wiki/List_of_bicycle-sharing_systems.

It lists active bicycle-sharing systems around the world. Most systems listed allow users to pick up and drop off bicycles at any of the automated stations within the network.

World Cities Data
The World Cities Data contains information such as name, latitude, and longitude, about major cities around the world.

R-Studio on SN Labs
For this project, you will use R-Studio on SN Labs as your main development environment. This lab environment does not require any installation and convenient to use.

Optionally you may use IBM Watson Studio. You will need to create an trial IBM Cloud account, create an IBM Watson Studio service, and then create a project in R-Studio IDE in Watson Studio. While creating an IBM Cloud account, you must ensure that you enter feature code provided within the course to activate the IBM trial account.

Obtain an IBM Cloud feature code

Steps to create an IBM Cloud Account

As another alternative, you may use Posit Cloud (earlier R-Studio Cloud). If you have not signed up for Posit Cloud Account earlier, sign up for a new basic account. Click here for instructions to setting up account on Posit Cloud.

Please note that the each cloud based service will have limitations on number of compute hours or number of days within which you will have to complete your assignment. So choose the one that works best for you based on your needs and resources.

Next Steps
Now you should have a basic understanding about this capstone project.

In the next step of your project, you will start with collecting and connecting to these data sources.