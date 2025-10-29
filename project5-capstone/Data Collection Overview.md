Bike-sharing Demand and Weather Data Collection
To be able to analyze and predict bike-sharing demands for a city, you will need to collect relevant data from various sources including global bike sharing systems on public web pages, weather data via OpenWeather APIs, and aggregated tabular data from cloud storage, etc., as shown below:

image

You will be guided through the data collection process while you complete the following instructional labs:

Lab: Web scrape a Global Bike-Sharing Systems Wiki Page (Estimated time: 20 mins)

TASK: Extract bike sharing system data from a Wiki page and convert the data to a data frame
Lab: OpenWeather APIs Calls (Estimated time: 40 mins)

Reading: OpenWeather API Setup
Coding Practice: Get the current weather data for a city using OpenWeather API
TASK: Get 5-day weather forecast for a list of cities using OpenWeather API
TASK: Download datasets in csv files from cloud storage
After the data collection process is completed, you should be able to get the following raw data all stored in csv file format:

raw_bike_sharing_systems.csv: A list active bike-sharing systems across the world
raw_cities_weather_forecast.csv: 5-day weather forecast for a list of cities from OpenWeather API
raw_worldcities.csv: A list of major cities’ info (such as name, latitude and longitude) across the world
raw_seoul_bike_sharing.csv: Contains weather information (Temperature, Humidity, Windspeed, Visibility, Dewpoint, Solar radiation, Snowfall, Rainfall), the number of bikes rented per hour, and date information, from Seoul bike-sharing systems.