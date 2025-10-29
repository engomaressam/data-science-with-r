How to start using professional collections
Home
API
How to start using professional collections
Best way to start calling OpenWeather APIs
How to call OpenWeather APIs with a freemium plan
How to call OpenWeather APIs with a paid plan
API key is everything you need to call for weather data
Example of using API key in API call
API care recommendations
When you exceed the API call limit
Best way to start and continue calling OpenWeather APIs
OpenWeather offers a set of widely recognised and reliable APIs. Powered by advanced machine learning, our platform provides weather information essential for decision-making at any location worldwide. To start using our APIs, please sign up here.

Why our Free Weather API is so good yet free

How to call OpenWeather APIs with a freemium plan
The API key is all you need to call any of our weather APIs. Once you sign up using your email, the API key (APPID) will be sent to you in a confirmation email. Your API keys can always be found on your account page, where you can also generate additional API keys if needed. Check our documentation page to find all technical information for each product. Documentation is an essential guide with actual examples and comprehensive description of API calls, responses and parameters.

How to call OpenWeather APIs with a paid plan
In case your weather data requirements go beyond our Free plan, you may consider signing up for our paid subscription plans. The subscription plans differ in the APIs products range, level of service provided, the overall amount of calls per minute and other features.

API key is everything you need to call for weather data
Please, use your API key in every API call you make. Our platform only processes the API requests with an API key included. The API keys linked to your account are used to take count of the calls you make to OpenWeather platform.

Example on how to make an API call using your API key
API call

http://api.openweathermap.org/data/2.5/forecast?id=524901&appid={API key}

Parameters
appid	required	Your unique API key (you can always find it on your account page under the "API key" tab)
Example of API call

b1b15e88fa797225412429c1c50c122a1">api.openweathermap.org/data/2.5/forecast?id&appid={API key}

API care recommendations
Like any other tool, the API requires some attention. To let it serve you properly, we suggest that you carefully read these instructions and care recommendations.

First, we recommend making API calls no more than once in 10 minutes for each location, whether you call it by city name, geographical coordinates or by zip code. The update frequency of the OpenWeather model is not higher than once in 10 minutes.

Second, the only endpoint for making free API calls is api.openweathermap.org. Please, don’t use the server’s IP address. The endpoint for paid subscription plans is different and it can be found in the confirmation email we send you once your subscription is activated

Third, to get a precise geocoding searching result would rather call API by geographical coordinates. You can always call the OpenWeather APIs using the city name or zip/post code. In case you need to get geographical coordinates by name of your location please use our Geocoding API.

We support over 200,000 cities worldwide and our data is available for any coordinates around the globe. However, we don't recommend using large locations or countries as it will not be weather data for a large location (aggregated data or averages), but weather data for a central point of the territory.

Finally, please mind that all our tariff plans have caps on the quantity of calls made to API and it varies depending on the subscription type. In case you don’t obtain an API response due to hitting the limit of calls, we would ask you to repeat your request in 10 minutes. On this occasion, we also recommend to keep the API request unamended, since it would help our internal caching service to process your request timely.

When you exceed the API call limit
We take a count of calls made with all API keys assigned to your account. To avoid service interruptions for your users, we won’t immediately suspend your API key if you exceed the call limit. An automatic notification will be sent to your email, suggesting to switch to a paid subscription plan which would meet your requirements. In case we don’t hear back from you, your API key will be suspended. You will still be able to resume your subscription by contacting our customer support team.

Response from API when your account is suspended

                     
{ "cod": 429,
"message": "Your account is temporary blocked due to exceeding of requests limitation of your subscription type. 
Please choose the proper subscription http://openweathermap.org/price"
}
                     
                  

If you do not find a reply to your questions on this page, please, look at our comprehensive FAQ or contact our customer support team.

Product concept
Get essential weather data, short-term and long-term forecasts and aggregated weather data is easy with our OpenWeather One Call API 3.0. This product designed to ensure easy migration from the Dark Sky API.

One Call API 3.0 contains 5 endpoints and provides access to various data:

Current weather and forecasts:
minute forecast for 1 hour
hourly forecast for 48 hours
daily forecast for 8 days
and government weather alerts
Weather data for any timestamp for 46+ years historical archive and 4 days ahead forecast
Daily aggregation of weather data for 46+ years archive and 1.5 years ahead forecast
Weather overview with a human-readable weather summary for today and tomorrow's forecast, utilizing OpenWeather AI technologies
AI Weather Assistant for retrieving weather data and weather-related advice in a human-readable and friendly format.
One Call API 3.0 is based on the proprietary OpenWeather Model and is updated every 10 minutes. Thus, in order to receive the most accurate and up-to-date weather data, we recommend you request One Call API 3.0 every 10 minutes.

Please note, that One Call API 3.0 is included in the "One Call by Call" subscription only. This separate subscription includes 1,000 calls/day for free and allows you to pay only for the number of API calls made to this product. Please note, that you do not need to subscribe to any other OpenWeather subscription plans to get access to the One Call API 3.0. Please find more details on the pricing page and FAQ or ask Ulla, OpenWeather AI assistant.

How to start
Sign up to OpenWeather service in case you haven't got your OpenWeather API key yet.
Follow the pricing page to learn details about the price.
One Call API 3.0 is included in the separate subscription only and allows you to pay only for the number of API calls made to this product. Please find more details on the pricing page.

Once you subscribe to One call API 3.0, 2000 API calls per day to this product are set up by default. If you want to change this limit, please go to the "Billing plans" tab in your Personal account to update standard settings. You can find more information on the FAQ or ask Ulla, OpenWeather AI assistant.
Select the desired type of data (Current and forecasts weather data, Weather data for timestamp, Daily aggregation, Weather overview, AI Weather Assistant) and make an API call according to relevant tech documentation section, remembering to add your key to each call.
Current and forecasts weather data
To get access to current weather, minute forecast for 1 hour, hourly forecast for 48 hours, daily forecast for 8 days and government weather alerts, please use this section of the documentation.

If you are interested in other functionality on One Call API 3.0, please check Product concept to follow the right section.

How to make an API call
API call

https://api.openweathermap.org/data/3.0/onecall?lat={lat}&lon={lon}&exclude={part}&appid={API key}

Parameters
lat	required	Latitude, decimal (-90; 90). If you need the geocoder to automatic convert city names and zip-codes to geo coordinates and the other way around, please use our Geocoding API
lon	required	Longitude, decimal (-180; 180). If you need the geocoder to automatic convert city names and zip-codes to geo coordinates and the other way around, please use our Geocoding API
appid	required	Your unique API key (you can always find it on your account page under the "API key" tab)
exclude	optional	By using this parameter you can exclude some parts of the weather data from the API response. It should be a comma-delimited list (without spaces).
Available values:

current
minutely
hourly
daily
alerts
units	optional	Units of measurement. standard, metric and imperial units are available. If you do not use the units parameter, standard units will be applied by default. Learn more
lang	optional	You can use the lang parameter to get the output in your language. Learn more
Example of API call

Before making an API call, please note, that One Call 3.0 is included in the "One Call by Call" subscription only. Learn more

If you you want to exclude some parts of the weather data from the API response please add exclude parameter to the API call like in the example below:

https://api.openweathermap.org/data/3.0/onecall?lat=33.44&lon=-94.04&exclude=hourly,daily&appid={API key}

If you do not need to exclude any of the weather data from the API response please use API call like in the example below:

https://api.openweathermap.org/data/3.0/onecall?lat=33.44&lon=-94.04&appid={API key}

Example of API response
Example of API response


                
{
   "lat":33.44,
   "lon":-94.04,
   "timezone":"America/Chicago",
   "timezone_offset":-18000,
   "current":{
      "dt":1684929490,
      "sunrise":1684926645,
      "sunset":1684977332,
      "temp":292.55,
      "feels_like":292.87,
      "pressure":1014,
      "humidity":89,
      "dew_point":290.69,
      "uvi":0.16,
      "clouds":53,
      "visibility":10000,
      "wind_speed":3.13,
      "wind_deg":93,
      "wind_gust":6.71,
      "weather":[
         {
            "id":803,
            "main":"Clouds",
            "description":"broken clouds",
            "icon":"04d"
         }
      ]
   },
   "minutely":[
      {
         "dt":1684929540,
         "precipitation":0
      },
      ...
   ],
   "hourly":[
      {
         "dt":1684926000,
         "temp":292.01,
         "feels_like":292.33,
         "pressure":1014,
         "humidity":91,
         "dew_point":290.51,
         "uvi":0,
         "clouds":54,
         "visibility":10000,
         "wind_speed":2.58,
         "wind_deg":86,
         "wind_gust":5.88,
         "weather":[
            {
               "id":803,
               "main":"Clouds",
               "description":"broken clouds",
               "icon":"04n"
            }
         ],
         "pop":0.15
      },
      ...
   ],
   "daily":[
      {
         "dt":1684951200,
         "sunrise":1684926645,
         "sunset":1684977332,
         "moonrise":1684941060,
         "moonset":1684905480,
         "moon_phase":0.16,
         "summary":"Expect a day of partly cloudy with rain",
         "temp":{
            "day":299.03,
            "min":290.69,
            "max":300.35,
            "night":291.45,
            "eve":297.51,
            "morn":292.55
         },
         "feels_like":{
            "day":299.21,
            "night":291.37,
            "eve":297.86,
            "morn":292.87
         },
         "pressure":1016,
         "humidity":59,
         "dew_point":290.48,
         "wind_speed":3.98,
         "wind_deg":76,
         "wind_gust":8.92,
         "weather":[
            {
               "id":500,
               "main":"Rain",
               "description":"light rain",
               "icon":"10d"
            }
         ],
         "clouds":92,
         "pop":0.47,
         "rain":0.15,
         "uvi":9.23
      },
      ...
   ],
    "alerts": [
    {
      "sender_name": "NWS Philadelphia - Mount Holly (New Jersey, Delaware, Southeastern Pennsylvania)",
      "event": "Small Craft Advisory",
      "start": 1684952747,
      "end": 1684988747,
      "description": "...SMALL CRAFT ADVISORY REMAINS IN EFFECT FROM 5 PM THIS\nAFTERNOON TO 3 AM EST FRIDAY...\n* WHAT...North winds 15 to 20 kt with gusts up to 25 kt and seas\n3 to 5 ft expected.\n* WHERE...Coastal waters from Little Egg Inlet to Great Egg\nInlet NJ out 20 nm, Coastal waters from Great Egg Inlet to\nCape May NJ out 20 nm and Coastal waters from Manasquan Inlet\nto Little Egg Inlet NJ out 20 nm.\n* WHEN...From 5 PM this afternoon to 3 AM EST Friday.\n* IMPACTS...Conditions will be hazardous to small craft.",
      "tags": [

      ]
    },
    ...
  ]
                
              
Fields in API response
If you do not see some of the parameters in your API response it means that these weather phenomena are just not happened for the time of measurement for the city or location chosen. Only really measured or calculated data is displayed in API response.
lat Latitude of the location, decimal (−90; 90)
lon Longitude of the location, decimal (-180; 180)
timezone Timezone name for the requested location
timezone_offset Shift in seconds from UTC
current Current weather data API response
current.dt Current time, Unix, UTC
current.sunrise Sunrise time, Unix, UTC. For polar areas in midnight sun and polar night periods this parameter is not returned in the response
current.sunset Sunset time, Unix, UTC. For polar areas in midnight sun and polar night periods this parameter is not returned in the response
current.temp Temperature. Units - default: kelvin, metric: Celsius, imperial: Fahrenheit. How to change units used
current.feels_like Temperature. This temperature parameter accounts for the human perception of weather. Units – default: kelvin, metric: Celsius, imperial: Fahrenheit.
current.pressure Atmospheric pressure on the sea level, hPa
current.humidity Humidity, %
current.dew_point Atmospheric temperature (varying according to pressure and humidity) below which water droplets begin to condense and dew can form. Units – default: kelvin, metric: Celsius, imperial: Fahrenheit
current.clouds Cloudiness, %
current.uvi Current UV index.
current.visibility Average visibility, metres. The maximum value of the visibility is 10 km
current.wind_speed Wind speed. Wind speed. Units – default: metre/sec, metric: metre/sec, imperial: miles/hour. How to change units used
current.wind_gust (where available) Wind gust. Units – default: metre/sec, metric: metre/sec, imperial: miles/hour. How to change units used
current.wind_deg Wind direction, degrees (meteorological)
current.rain
current.rain.1h (where available) Precipitation, mm/h. Please note that only mm/h as units of measurement are available for this parameter
current.snow
current.snow.1h (where available) Precipitation, mm/h. Please note that only mm/h as units of measurement are available for this parameter
current.weather
current.weather.id Weather condition id
current.weather.main Group of weather parameters (Rain, Snow etc.)
current.weather.description Weather condition within the group (full list of weather conditions). Get the output in your language
current.weather.icon Weather icon id. How to get icons
minutely Minute forecast weather data API response
minutely.dt Time of the forecasted data, unix, UTC
minutely.precipitation Precipitation, mm/h. Please note that only mm/h as units of measurement are available for this parameter
hourly Hourly forecast weather data API response
hourly.dt Time of the forecasted data, Unix, UTC
hourly.temp Temperature. Units – default: kelvin, metric: Celsius, imperial: Fahrenheit. How to change units used
hourly.feels_like Temperature. This accounts for the human perception of weather. Units – default: kelvin, metric: Celsius, imperial: Fahrenheit.
hourly.pressure Atmospheric pressure on the sea level, hPa
hourly.humidity Humidity, %
hourly.dew_point Atmospheric temperature (varying according to pressure and humidity) below which water droplets begin to condense and dew can form. Units – default: kelvin, metric: Celsius, imperial: Fahrenheit.
hourly.uvi UV index
hourly.clouds Cloudiness, %
hourly.visibility Average visibility, metres. The maximum value of the visibility is 10 km
hourly.wind_speed Wind speed. Units – default: metre/sec, metric: metre/sec, imperial: miles/hour.How to change units used
hourly.wind_gust (where available) Wind gust. Units – default: metre/sec, metric: metre/sec, imperial: miles/hour. How to change units used
hourly.wind_deg Wind direction, degrees (meteorological)
hourly.pop Probability of precipitation. The values of the parameter vary between 0 and 1, where 0 is equal to 0%, 1 is equal to 100%
hourly.rain
hourly.rain.1h (where available) Precipitation, mm/h. Please note that only mm/h as units of measurement are available for this parameter
hourly.snow
hourly.snow.1h (where available) Precipitation, mm/h. Please note that only mm/h as units of measurement are available for this parameter
hourly.weather
hourly.weather.id Weather condition id
hourly.weather.main Group of weather parameters (Rain, Snow etc.)
hourly.weather.description Weather condition within the group (full list of weather conditions). Get the output in your language
hourly.weather.icon Weather icon id. How to get icons
daily Daily forecast weather data API response
daily.dt Time of the forecasted data, Unix, UTC
daily.sunrise Sunrise time, Unix, UTC. For polar areas in midnight sun and polar night periods this parameter is not returned in the response
daily.sunset Sunset time, Unix, UTC. For polar areas in midnight sun and polar night periods this parameter is not returned in the response
daily.moonrise The time of when the moon rises for this day, Unix, UTC
daily.moonset The time of when the moon sets for this day, Unix, UTC
daily.moon_phase Moon phase. 0 and 1 are 'new moon', 0.25 is 'first quarter moon', 0.5 is 'full moon' and 0.75 is 'last quarter moon'. The periods in between are called 'waxing crescent', 'waxing gibbous', 'waning gibbous', and 'waning crescent', respectively. Moon phase calculation algorithm: if the moon phase values between the start of the day and the end of the day have a round value (0, 0.25, 0.5, 0.75, 1.0), then this round value is taken, otherwise the average of moon phases for the start of the day and the end of the day is taken
summaryHuman-readable description of the weather conditions for the day
daily.temp Units – default: kelvin, metric: Celsius, imperial: Fahrenheit. How to change units used
daily.temp.morn Morning temperature.
daily.temp.day Day temperature.
daily.temp.eve Evening temperature.
daily.temp.night Night temperature.
daily.temp.min Min daily temperature.
daily.temp.max Max daily temperature.
daily.feels_like This accounts for the human perception of weather. Units – default: kelvin, metric: Celsius, imperial: Fahrenheit. How to change units used
daily.feels_like.morn Morning temperature.
daily.feels_like.day Day temperature.
daily.feels_like.eve Evening temperature.
daily.feels_like.night Night temperature.
daily.pressure Atmospheric pressure on the sea level, hPa
daily.humidity Humidity, %
daily.dew_point Atmospheric temperature (varying according to pressure and humidity) below which water droplets begin to condense and dew can form. Units – default: kelvin, metric: Celsius, imperial: Fahrenheit.
daily.wind_speed Wind speed. Units – default: metre/sec, metric: metre/sec, imperial: miles/hour. How to change units used
daily.wind_gust (where available) Wind gust. Units – default: metre/sec, metric: metre/sec, imperial: miles/hour. How to change units used
daily.wind_deg Wind direction, degrees (meteorological)
daily.clouds Cloudiness, %
daily.uvi The maximum value of UV index for the day
daily.pop Probability of precipitation. The values of the parameter vary between 0 and 1, where 0 is equal to 0%, 1 is equal to 100%
daily.rain (where available) Precipitation volume, mm. Please note that only mm as units of measurement are available for this parameter
daily.snow (where available) Snow volume, mm. Please note that only mm as units of measurement are available for this parameter
daily.weather
daily.weather.id Weather condition id
daily.weather.main Group of weather parameters (Rain, Snow etc.)
daily.weather.description Weather condition within the group (full list of weather conditions). Get the output in your language
daily.weather.icon Weather icon id. How to get icons
alerts National weather alerts data from major national weather warning systems
alerts.sender_name Name of the alert source. Please read here the full list of alert sources
alerts.event Alert event name
alerts.start Date and time of the start of the alert, Unix, UTC
alerts.end Date and time of the end of the alert, Unix, UTC
alerts.description Description of the alert
alerts.tags Type of severe weather
National weather alerts are provided in English by default.
Please note that some agencies provide the alert’s description only in a local language.
Weather data for timestamp
To learn about how get access to weather data for any timestamp from 1st January 1979 till 4 days ahead forecast, please use this section of the documentation.

If you are interested in other functionality on One Call API 3.0, please check Product concept to follow the right section.

How to make an API call
API call

https://api.openweathermap.org/data/3.0/onecall/timemachine?lat={lat}&lon={lon}&dt={time}&appid={API key}

Parameters
lat	required	Latitude, decimal (-90; 90). If you need the geocoder to automatic convert city names and zip-codes to geo coordinates and the other way around, please use our Geocoding API
lon	required	Longitude, decimal (-180; 180). If you need the geocoder to automatic convert city names and zip-codes to geo coordinates and the other way around, please use our Geocoding API
dt	required	Timestamp (Unix time, UTC time zone), e.g. dt=1586468027. Data is available from January 1st, 1979 till 4 days ahead
appid	required	Your unique API key (you can always find it on your account page under the "API key" tab)
units	optional	Units of measurement. standard, metric and imperial units are available. If you do not use the units parameter, standard units will be applied by default. Learn more
lang	optional	You can use the lang parameter to get the output in your language. Learn more
Please note that the one API response contains weather data for only one specified timestamp.
Example of API call

Before making an API call, please note, that One Call 3.0 is included in the "One Call by Call" subscription only. Learn more

https://api.openweathermap.org/data/3.0/onecall/timemachine?lat=39.099724&lon=-94.578331&dt=1643803200&appid={API key}

Example of API response
Example of API response


                   
  {
  "lat": 52.2297,
  "lon": 21.0122,
  "timezone": "Europe/Warsaw",
  "timezone_offset": 3600,
  "data": [
    {
      "dt": 1645888976,
      "sunrise": 1645853361,
      "sunset": 1645891727,
      "temp": 279.13,
      "feels_like": 276.44,
      "pressure": 1029,
      "humidity": 64,
      "dew_point": 272.88,
      "uvi": 0.06,
      "clouds": 0,
      "visibility": 10000,
      "wind_speed": 3.6,
      "wind_deg": 340,
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01d"
        }
      ]
    }
  ]
}
                   
                 
Fields in API response
If you do not see some of the parameters in your API response it means that these weather phenomena are just not happened for the time of measurement for the city or location chosen. Only really measured or calculated data is displayed in API response.
lat Latitude of the location, decimal (−90; 90)
lon Longitude of the location, decimal (-180; 180)
timezone Timezone name for the requested location
timezone_offset Shift in seconds from UTC
data
data.dt Requested time, Unix, UTC
data.sunrise Sunrise time, Unix, UTC. For polar areas in midnight sun and polar night periods this parameter is not returned in the response
data.sunset Sunset time, Unix, UTC. For polar areas in midnight sun and polar night periods this parameter is not returned in the response
data.temp Temperature. Units – default: kelvin, metric: Celsius, imperial: Fahrenheit. How to change units used
data.feels_like Temperature. This accounts for the human perception of weather. Units – default: kelvin, metric: Celsius, imperial: Fahrenheit.
data.pressure Atmospheric pressure on the sea level, hPa
data.humidity Humidity, %
data.dew_point Atmospheric temperature (varying according to pressure and humidity) below which water droplets begin to condense and dew can form. Units – default: kelvin, metric: Celsius, imperial: Fahrenheit.
data.clouds Cloudiness, %
data.uvi UV index. Please pay attention that historical UV index data available only for 5 days back. If you would like to get historical UVI index data starting from 20th September 2020 please contact us
data.visibility Average visibility, metres. The maximum value of the visibility is 10 km
data.wind_speed Wind speed. Units – default: metre/sec, metric: metre/sec, imperial: miles/hour. How to change units used
data.wind_gust (where available) Wind gust. Wind speed. Units – default: metre/sec, metric: metre/sec, imperial: miles/hour. How to change units used
data.wind_deg Wind direction, degrees (meteorological)
data.weather
data.weather.id Weather condition id
data.weather.main Group of weather parameters (Rain, Snow etc.)
data.weather.description Weather condition within the group (full list of weather conditions). Get the output in your language
data.weather.icon Weather icon id. How to get icons
data.rain (where available)
1h Precipitation, mm/h. Please note that only mm/h as units of measurement are available for this parameter
data.snow(where available)
1h Precipitation, mm/h. Please note that only mm/h as units of measurement are available for this parameter
Daily Aggregation
To learn about how get access to aggregated weather data for a particular date from 2nd January 1979 till long-term forecast for 1,5 years ahead, please use this section of the documentation.

If you are interested in other functionality on One Call API 3.0, please check Product concept to follow the right section.

How to make an API call
API call

https://api.openweathermap.org/data/3.0/onecall/day_summary?lat={lat}&lon={lon}&date={date}&appid={API key}

Parameters
lat	required	Latitude, decimal (-90; 90)
lon	required	Longitude, decimal (-180; 180)
date	required	Date in the `YYYY-MM-DD` format for which data is requested. Date is available for 46+ years archive (starting from 1979-01-02) up to the 1,5 years ahead forecast to the current date
appid	required	Your unique API key (you can always find it on your account page under the "API key" tab)
units	optional	Units of measurement. standard, metric and imperial units are available. If you do not use the units parameter, standard units will be applied by default. Learn more
lang	optional	You can use the lang parameter to get the output in your language. Learn more
If the service detected timezone for your location incorrectly you can specify correct timezone manually by adding tz parameter in the ±XX:XX format to API call.
API call

https://api.openweathermap.org/data/3.0/onecall/day_summary?lat={lat}&lon={lon}&date={date}&tz={tz}&appid={API key}

Example of API call

https://api.openweathermap.org/data/3.0/onecall/day_summary?lat=60.45&lon=-38.67&date=2023-03-30&tz=+03:00&appid={API key}

Please pay attention that in case timezone is specified time of afternoon, night, evening, morning temperatures, pressure, humidity will be returned in accordance with this specified timezone.
Example of API call

Before making an API call, please note, that One Call 3.0 is included in the "One Call by Call" subscription only. Learn more

https://api.openweathermap.org/data/3.0/onecall/day_summary?lat=39.099724&lon=-94.578331&date=2020-03-04&appid={API key}

Example of API response
Example of API response


                   
  {
   "lat":33,
   "lon":35,
   "tz":"+02:00",
   "date":"2020-03-04",
   "units":"standard",
   "cloud_cover":{
      "afternoon":0
   },
   "humidity":{
      "afternoon":33
   },
   "precipitation":{
      "total":0
   },
   "temperature":{
      "min":286.48,
      "max":299.24,
      "afternoon":296.15,
      "night":289.56,
      "evening":295.93,
      "morning":287.59
   },
   "pressure":{
      "afternoon":1015
   },
   "wind":{
      "max":{
         "speed":8.7,
         "direction":120
      }
   }
}                
                 
Fields in API response
lat Latitude of the location, decimal (−90; 90)
lon Longitude of the location, decimal (-180; 180)
tz Timezone in the ±XX:XX format
date Date specified in the API request in the `YYYY-MM-DD` format (from 1979-01-02 up to the 1,5 years ahead forecast)
units Units of measurement specified in the request. Learn more
cloud_cover Cloud related information
afternoon Cloud cover at 12:00 for the date specified in the request, %
humidity Humidity related information
afternoon Relative humidity at 12:00 for the date specified in the request, %
precipitation Precipitation related information
total Total amount of liquid water equivalent of precipitation for the date specified in the request, mm
pressure Atmospheric pressure related information
afternoon Atmospheric pressure at 12:00 for the date specified in the request, hPa
temperature Temperature related information
min Minimum temperature for the date specified in the request. Units - default: kelvin, metric: Celsius, imperial: Fahrenheit. How to change units used
max Maximum temperature for the date specified in the request. Units - default: kelvin, metric: Celsius, imperial: Fahrenheit. How to change units used
afternoon Temperature at 12:00 for the date specified in the request. Units - default: kelvin, metric: Celsius, imperial: Fahrenheit. How to change units used
night Temperature at 00:00 for the date specified in the request. Units - default: kelvin, metric: Celsius, imperial: Fahrenheit. How to change units used
evening Temperature at 18:00 for the date specified in the request. Units - default: kelvin, metric: Celsius, imperial: Fahrenheit. How to change units used
morning Temperature at 06:00 for the date specified in the request. Units - default: kelvin, metric: Celsius, imperial: Fahrenheit. How to change units used
wind Wind speed related information
max Maximum wind speed related information
speed Maximum wind speed for the date specified in the request. Units – default: metre/sec, metric: metre/sec, imperial: miles/hour. How to change units used
direction Wind cardinal direction relevant to the maximum wind speed, degrees (meteorological)
Weather overview
This section describes how to get weather overview with a human-readable weather summary for today and tomorrow's forecast, utilizing OpenWeather AI technologies.

If you are interested in other functionality on One Call API 3.0, please check Product concept to follow the right section.

How to make an API call
API call

https://api.openweathermap.org/data/3.0/onecall/overview?lat={lat}&lon={lon}&appid={API key}

Parameters
lat	required	Latitude, decimal (-90; 90)
lon	required	Longitude, decimal (-180; 180)
appid	required	Your unique API key (you can always find it on your account page under the "API key" tab)
date	optional	The date the user wants to get a weather summary in the YYYY-MM-DD format. Data is available for today and tomorrow. If not specified, the current date will be used by default. Please note that the date is determined by the timezone relevant to the coordinates specified in the API request
units	optional	Units of measurement. Standard, metric and imperial units are available. If you do not use the units parameter, standard units will be applied by default. Learn more
Example of API call

https://api.openweathermap.org/data/3.0/onecall/overview?lon=-11.8092&lat=51.509865&appid={API key}

Example of API response


                   
{
   "lat": 51.509865,
   "lon": -0.118092,
   "tz": "+01:00",
   "date": "2024-05-13",
   "units": "metric",
   "weather_overview": "The current weather is overcast with a 
temperature of 16°C and a feels-like temperature of 16°C. 
The wind speed is 4 meter/sec with gusts up to 6 meter/sec 
coming from the west-southwest direction. 
The air pressure is at 1007 hPa with a humidity level of 79%. 
The dew point is at 12°C and the visibility is 10000 meters. 
The UV index is at 4, indicating moderate risk from the 
sun's UV rays. 
The sky is covered with overcast clouds, and there is 
no precipitation expected at the moment. 
Overall, it is a moderately cool and cloudy day 
with light to moderate winds from the west-southwest."
}          
                                       
                 
Fields in API response
lat Latitude of the location, decimal (−90; 90)
lon Longitude of the location, decimal (-180; 180)
tzTimezone in the ±XX:XX format
date Date for which summary is generated in the format YYYY-MM-DD
units Units of measurement specified in the request
weather_overviewAI generated weather overview for the requested date
AI Weather Assistant
To learn how to access weather and weather-related advice in a human-readable format, please use this section of the documentation.

If you are interested in other functionality in One Call API 3.0, please refer to the Product concept to follow the appropriate section.

The AI Weather Assistant is available via API, allowing you to integrate it directly into your applications and workflows. For your convenience, you can also explore the service in a chatbot-like format using the web interface to familiarize yourself with the service's functionality, test various use cases, and understand how the AI Weather Assistant responds to different queries before implementing it in your projects.

Please note that all interactions with the AI Assistant endpoint are free of charge. However, the AI Weather Assistant retrieves weather information for requested locations from the Current & Forecast endpoint of the One Call API 3.0, and these requests are counting toward your One Call API 3.0 usage statistics.

At the moment, the AI Weather Assistant considers current weather, minutely forecast, hourly forecast and daily forecast for the next 7 days for any location around the globe. The product offers global coverage and accepts cities, provinces or countries as valid locations. The AI weather assistant will remember the location you are inquiring about and use it for all future inquiries until a new location is specified.

Questions examples:

What's the weather in London like?
Is it a good idea to go for a swim?
Will it rain tomorrow in Paris?
What should my 8-year-old child wear?
Where is it better to go on holiday next weekend: in London or Paris?
The AI Weather Assistant understands over 50 languages, including English, French, Italian, German, Chinese, Arabic and Hindi.

The AI Weather Assistant is a work in progress. Its knowledge of the world and weather is being continuously enhanced.

How to make a call with web interface
Here you will find how to explore the service in a chatbot-like format with the web interface to familiarize yourself with the service's functionality, test various use cases, and understand how the AI Weather Assistant responds to different queries before implementing it in your projects.

The address of the web page with the web interface is:

https://openweathermap.org/weather-assistant?apikey={API key}

Ensure that you use your valid OpenWeather API key in place of api key.

Parameters
api_key	required	Your unique API key (you can always find it on your account page under the "API key" tab)
Upon successful validation of the API key, you will be directed to the default chat page. This page serves as the primary interface for interacting with the AI Weather Assistant, allowing to initiate conversations and request weather information seamlessly.

weather Assistant interface

Enter your prompt to communicate with the AI Weather Assistant. The AI Weather Assistant will remember the location you are inquiring about and will use it for all future inquiries until a new location is specified. The topic can include queries about the weather or activities based on weather data.

weather Assistant interface
How to make a call with API Endpoints

Step 1: Session start
This HTTP method is used to start a session and ask questions about the weather and weather related advice.To interact with the AI Weather Assistant, please enter your prompt following the guidelines outlined below.

In case of successful creation, the method returns an HTTP code 200.

Method: POST

Header: Content-Type: application/json

X-Api-Key: [your OpenWeather API key]

URL

https://api.openweathermap.org/assistant/session



Example of the request body


                          
        json = {
          "prompt": "What’s weather like in London?",
        } 
                          
                       
Parameters
prompt	required	Query about the weather or activities based on weather data the user is asking for. If a location is not provided in the request, the AI Weather Assistant will ask to specify the location.
Example of the API response


                        
        {
          "answer": "Hello! Right now in London, it's quite 
          cloudy with overcast skies. The temperature is 
          around 9.5°C, but it feels a little cooler at 9.2°C. 
          The humidity is at 91%, so it might feel a bit damp. 
          Winds are light at 1.54 m/s coming from the southwest. 
          With these conditions, it's a cozy day to perhaps enjoy 
          indoor activities or a calm walk with a warm jacket. 
          If you're heading out, there's no rain reported 
          at the moment, but it's a good idea to keep an umbrella
          handy just in case. Stay cozy and enjoy your day in London!",
          "data": {
              "London": {
                  "Current UTC Time": "15 January 2025, 14:25",
                  "Current Week Day UTC": "Wednesday",
                  "clouds": 100,
                  "dew_point": 281.26,
                  "dt": 1736951146,
                  "feels_like": 282.19,
                  "humidity": 91,
                  "pressure": 1034,
                  "sunrise": 1736927957,
                  "sunset": 1736958011,
                  "temp": 282.65,
                  "uvi": 0.43,
                  "visibility": 10000,
                  "weather": [
                      {
                          "description": "overcast clouds",
                          "icon": "04d",
                          "id": 804,
                          "main": "Clouds"
                      }
                  ],
                  "wind_deg": 240,
                  "wind_speed": 1.54
              }
          },
          "session_id": "d47d2211-f1cf-409c-8297-617d74945571"
        }
                        
                     
Fields in API response

answer LLM-generated answer to the prompt
data Data that was used as the data source for generating the 'answer' part. Please note that only sections relevant to the time period mentioned in the "prompt" are included in the API response. If the user doesn’t mention a location or continues to inquire about the same location, the 'data' field will remain empty. The “data” field will contain new weather data automatically upon receiving a query related to a different location or forecast type.
loc1Location 1 name from inquiry
current UTC Time Current time, UTC
current Week Day UTCDay of the week, UTC
latLatitude of the location, decimal (−90; 90)
lonLongitude of the location, decimal (-180; 180)
timezone Timezone name for the requested location
timezone_offsetShift in seconds from UTC
currentCurrent weather data API response
current.dtCurrent time, Unix, UTC
current.sunriseSunrise time, Unix, UTC. For polar areas in midnight sun and polar night periods this parameter is not returned in the response
current.sunsetSunset time, Unix, UTC. For polar areas in midnight sun and polar night periods this parameter is not returned in the response
current.tempTemperature, kelvin
current.feels_likeTemperature. This temperature parameter accounts for the human perception of weather, kelvin.
current.pressureAtmospheric pressure on the sea level, hPa
current.humidityHumidity, %
current.dew_pointAtmospheric temperature (varying according to pressure and humidity) below which water droplets begin to condense and dew can form. Units: kelvin
current.cloudsCloudiness, %
current.uviCurrent UV index
current.visibilityAverage visibility, metres. The maximum value of the visibility is 10 km
current.wind_speed Wind speed. Wind speed. Units: metre/sec
current.wind_gust(where available) Wind gust, metre/sec
current.wind_degWind direction, degrees (meteorological)
current.wind_speed Wind speed. Wind speed. Units: metre/sec
current.rain
current.rain.1h(where available) Precipitation, mm/h
current.snow
current.snow.1h(where available)Precipitation, mm/h
current.weather
current.weather.idWeather condition id
current.weather.mainGroup of weather parameters (Rain, Snow etc.)
current.weather.description Weather condition within the group (full list of weather conditions)
current.weather.icon Weather icon id. How to get icons
minutelyMinute forecast weather data API response
minutely.dtTime of the forecasted data, unix, UTC
minutely.precipitationPrecipitation, mm/h.
hourly Hourly forecast weather data API response
hourly.dtTime of the forecasted data, Unix, UTC
hourly.tempTemperature, kelvin
hourly.feels_likeTemperature. This accounts for the human perception of weather, kelvin
hourly.pressure Atmospheric pressure on the sea level, hPa
hourly.humidityHumidity, %
hourly.dew_pointAtmospheric temperature (varying according to pressure and humidity) below which water droplets begin to condense and dew can form, kelvin
hourly.uviUV index
hourly.cloudsCloudiness, %
hourly.visibilityAverage visibility, metres. The maximum value of the visibility is 10 km
hourly.wind_speed
Wind speed, metre/sec
hourly.wind_gust(where available)Wind gust, metre/sec
hourly.wind_degWind direction, degrees (meteorological)
hourly.pop Probability of precipitation. The values of the parameter vary between 0 and 1, where 0 is equal to 0%, 1 is equal to 100%
hourly.rain
hourly.rain.1h (where available) Precipitation, mm/h
hourly.snow
hourly.snow.1h(where available)Precipitation, mm/h
hourly.weather
current.weather.idWeather condition id
current.weather.mainGroup of weather parameters (Rain, Snow etc.)
current.weather.description Weather condition within the group (full list of weather conditions)
current.weather.icon Weather icon id. How to get icons
dailyDaily forecast weather data API response
daily.dtTime of the forecasted data, Unix, UTC
daily.sunriseSSunrise time, Unix, UTC. For polar areas in midnight sun and polar night periods this parameter is not returned in the response
daily.sunsetSunset time, Unix, UTC. For polar areas in midnight sun and polar night periods this parameter is not returned in the response
daily.moonriseThe time of when the moon rises for this day, Unix, UTC
daily.moonsetThe time of when the moon sets for this day, Unix, UTC
daily.moon_phaseMoon phase. 0 and 1 are 'new moon', 0.25 is 'first quarter moon', 0.5 is 'full moon' and 0.75 is 'last quarter moon'. The periods in between are called 'waxing crescent', 'waxing gibbous', 'waning gibbous', and 'waning crescent', respectively. Moon phase calculation algorithm: if the moon phase values between the start of the day and the end of the day have a round value (0, 0.25, 0.5, 0.75, 1.0), then this round value is taken, otherwise the average of moon phases for the start of the day and the end of the day is taken
summaryHuman-readable description of the weather conditions for the day
Daily.tempkelvin
daily.temp.morn Morning temperature
daily.temp.day Day temperature
daily.temp.eve Evening temperature
daily.temp.night Night temperature
daily.temp.min Min daily temperature
daily.temp.max Max daily temperature
daily.feels_likeThis accounts for the human perception of weather, kelvin
daily.feels_like.morn Morning temperature
daily.feels_like.day Day temperature
daily.feels_like.eve Evening temperature
daily.feels_like.night Night temperature
daily.pressureAtmospheric pressure on the sea level, hPa
daily.humidityHumidity, %
daily.dew_pointAtmospheric temperature (varying according to pressure and humidity) below which water droplets begin to condense and dew can form, kelvin
daily.wind_speedWind speed, metre/sec
daily.wind_gust(where available) Wind gust, metre/sec
daily.wind_degWind direction, degrees (meteorological)
daily.clouds Cloudiness, %
daily.uviThe maximum value of UV index for the day
daily.popProbability of precipitation. The values of the parameter vary between 0 and 1, where 0 is equal to 0%, 1 is equal to 100%
daily.rain(where available)Precipitation volume, mm
daily.snow(where available)Snow volume, mm
daily.weather
daily.weather.idWeather condition id
daily.weather.mainGroup of weather parameters (Rain, Snow etc.)
daily.weather.description Weather condition within the group (full list of weather conditions)
daily.weather.icon Weather icon id. How to get icons
alertsNational weather alerts data from major national weather warning systems
alerts.sender_nameName of the alert source. Please read here the full list of alert sources
alerts.eventAlert event name
alerts.startDate and time of the start of the alert, Unix, UTC
alerts.endDate and time of the end of the alert, Unix, UTC
alerts.descriptionDescription of the alert
alerts.tags Type of severe weather
session_idid of a conversation session
To continue the session, please see Step 2. If you want the chatbot to disregard previous messages, return to Step 1 and begin a new session.

Step 2: Resume a session
This HTTP method is used to resume a conversation session with the chatbot. The AI Weather Assistant will remember the previous messages and retain the location you specify. It will use the location for all following inquiries until a new location is provided.

In case of successful creation, the method returns an HTTP code 200.

Method: POST

Header: Content-Type: application/json

X-Api-Key: [your OpenWeather API key]

URL

https://api.openweathermap.org/assistant/session/{session_id}

Example of the request body


                            
          json = {
            "prompt": "Do I need a hat?",
          } 
                            
                         
Parameters
prompt	required	Query about the weather or activities based on weather data the user is asking for. If a location is not provided in the initial request, the AI Weather Assistant will ask to specify the location.
Example of the API response


                        
        {'answer': "Given the mild temperature of around 9.76°C 
        in London and the gentle north wind at 2.68 m/s, 
        wearing a hat could be a good idea, especially if you 
        tend to feel a bit chilly or if you're 
        sensitive to cooler weather. 
        Plus, a hat can add a nice style touch to your outfit! 
        Stay cozy and enjoy your day, whatever you choose! 😊",
        'data': {},
        'session_id': 'xxxxxxxxx'}
                        
                     
Fields in API response

answer LLM-generated answer to the prompt
data Data that was used as the data source for generating the 'answer' part. Please note that only sections relevant to the time period mentioned in the "prompt" are included in the API response. If the user doesn’t mention a location or continues to inquire about the same location, the 'data' field will remain empty. The “data” field will contain new weather data automatically upon receiving a query related to a different location or forecast type.
loc1Location 1 name from inquiry
current UTC Time Current time, UTC
current Week Day UTCDay of the week, UTC
latLatitude of the location, decimal (−90; 90)
lonLongitude of the location, decimal (-180; 180)
timezone Timezone name for the requested location
timezone_offsetShift in seconds from UTC
currentCurrent weather data API response
current.dtCurrent time, Unix, UTC
current.sunriseSunrise time, Unix, UTC. For polar areas in midnight sun and polar night periods this parameter is not returned in the response
current.sunsetSunset time, Unix, UTC. For polar areas in midnight sun and polar night periods this parameter is not returned in the response
current.tempTemperature, kelvin
current.feels_likeTemperature. This temperature parameter accounts for the human perception of weather, kelvin.
current.pressureAtmospheric pressure on the sea level, hPa
current.humidityHumidity, %
current.dew_pointAtmospheric temperature (varying according to pressure and humidity) below which water droplets begin to condense and dew can form. Units: kelvin
current.cloudsCloudiness, %
current.uviCurrent UV index
current.visibilityAverage visibility, metres. The maximum value of the visibility is 10 km
current.wind_speed Wind speed. Wind speed. Units: metre/sec
current.wind_gust(where available) Wind gust, metre/sec
current.wind_degWind direction, degrees (meteorological)
current.wind_speed Wind speed. Wind speed. Units: metre/sec
current.rain
current.rain.1h(where available) Precipitation, mm/h
current.snow
current.snow.1h(where available)Precipitation, mm/h
current.weather
current.weather.idWeather condition id
current.weather.mainGroup of weather parameters (Rain, Snow etc.)
current.weather.description Weather condition within the group (full list of weather conditions)
current.weather.icon Weather icon id. How to get icons
minutelyMinute forecast weather data API response
minutely.dtTime of the forecasted data, unix, UTC
minutely.precipitationPrecipitation, mm/h.
hourly Hourly forecast weather data API response
hourly.dtTime of the forecasted data, Unix, UTC
hourly.tempTemperature, kelvin
hourly.feels_likeTemperature. This accounts for the human perception of weather, kelvin
hourly.pressure Atmospheric pressure on the sea level, hPa
hourly.humidityHumidity, %
hourly.dew_pointAtmospheric temperature (varying according to pressure and humidity) below which water droplets begin to condense and dew can form, kelvin
hourly.uviUV index
hourly.cloudsCloudiness, %
hourly.visibilityAverage visibility, metres. The maximum value of the visibility is 10 km
hourly.wind_speed
Wind speed, metre/sec
hourly.wind_gust(where available)Wind gust, metre/sec
hourly.wind_degWind direction, degrees (meteorological)
hourly.pop Probability of precipitation. The values of the parameter vary between 0 and 1, where 0 is equal to 0%, 1 is equal to 100%
hourly.rain
hourly.rain.1h (where available) Precipitation, mm/h
hourly.snow
hourly.snow.1h(where available)Precipitation, mm/h
hourly.weather
current.weather.idWeather condition id
current.weather.mainGroup of weather parameters (Rain, Snow etc.)
current.weather.description Weather condition within the group (full list of weather conditions)
current.weather.icon Weather icon id. How to get icons
dailyDaily forecast weather data API response
daily.dtTime of the forecasted data, Unix, UTC
daily.sunriseSSunrise time, Unix, UTC. For polar areas in midnight sun and polar night periods this parameter is not returned in the response
daily.sunsetSunset time, Unix, UTC. For polar areas in midnight sun and polar night periods this parameter is not returned in the response
daily.moonriseThe time of when the moon rises for this day, Unix, UTC
daily.moonsetThe time of when the moon sets for this day, Unix, UTC
daily.moon_phaseMoon phase. 0 and 1 are 'new moon', 0.25 is 'first quarter moon', 0.5 is 'full moon' and 0.75 is 'last quarter moon'. The periods in between are called 'waxing crescent', 'waxing gibbous', 'waning gibbous', and 'waning crescent', respectively. Moon phase calculation algorithm: if the moon phase values between the start of the day and the end of the day have a round value (0, 0.25, 0.5, 0.75, 1.0), then this round value is taken, otherwise the average of moon phases for the start of the day and the end of the day is taken
summaryHuman-readable description of the weather conditions for the day
Daily.tempkelvin
daily.temp.morn Morning temperature
daily.temp.day Day temperature
daily.temp.eve Evening temperature
daily.temp.night Night temperature
daily.temp.min Min daily temperature
daily.temp.max Max daily temperature
daily.feels_likeThis accounts for the human perception of weather, kelvin
daily.feels_like.morn Morning temperature
daily.feels_like.day Day temperature
daily.feels_like.eve Evening temperature
daily.feels_like.night Night temperature
daily.pressureAtmospheric pressure on the sea level, hPa
daily.humidityHumidity, %
daily.dew_pointAtmospheric temperature (varying according to pressure and humidity) below which water droplets begin to condense and dew can form, kelvin
daily.wind_speedWind speed, metre/sec
daily.wind_gust(where available) Wind gust, metre/sec
daily.wind_degWind direction, degrees (meteorological)
daily.clouds Cloudiness, %
daily.uviThe maximum value of UV index for the day
daily.popProbability of precipitation. The values of the parameter vary between 0 and 1, where 0 is equal to 0%, 1 is equal to 100%
daily.rain(where available)Precipitation volume, mm
daily.snow(where available)Snow volume, mm
daily.weather
daily.weather.idWeather condition id
daily.weather.mainGroup of weather parameters (Rain, Snow etc.)
daily.weather.description Weather condition within the group (full list of weather conditions)
daily.weather.icon Weather icon id. How to get icons
alertsNational weather alerts data from major national weather warning systems
alerts.sender_nameName of the alert source. Please read here the full list of alert sources
alerts.eventAlert event name
alerts.startDate and time of the start of the alert, Unix, UTC
alerts.endDate and time of the end of the alert, Unix, UTC
alerts.descriptionDescription of the alert
alerts.tags Type of severe weather
session_idid of a conversation session
Other features
List of weather condition codes
List of weather condition codes with icons (range of thunderstorm, drizzle, rain, snow, clouds, atmosphere etc.)

Units of measurement
standard, metric and imperial units are available.

List of all API parameters with available units.
API call

https://api.openweathermap.org/data/3.0/onecall?lat={lat}&lon={lon}&units={units}

Parameters
units	optional	Units of measurement. standard, metric and imperial units are available. If you do not use the units parameter, standard units will be applied by default.
Temperature is available in Fahrenheit, Celsius and Kelvin units.
Wind speed is available in miles/hour and meter/sec.

For temperature in Fahrenheit and wind speed in miles/hour, use units=imperial
For temperature in Celsius and wind speed in meter/sec, use units=metric
Temperature in Kelvin and wind speed in meter/sec is used by default, so there is no need to use the units parameter in the API call if you want this
Examples of API calls

Standard (default)

api.openweathermap.org/data/3.0/onecall?lat=30.489772&lon=-99.771335

Metric

api.openweathermap.org/data/3.0/onecall?lat=30.489772&lon=-99.771335&units=metric

Imperial

api.openweathermap.org/data/3.0/onecall?lat=30.489772&lon=-99.771335&units=imperial

Multilingual support
You can use lang parameter to get the output in your language.

The contents of the description field will be translated.

API call

https://api.openweathermap.org/data/3.0/onecall?lat={lat}&lon={lon}&lang={lang}

Parameters
lang	optional	You can use the lang parameter to get the output in your language.
Example of API call

Before making an API call, please note, that One Call 3.0 is included in the "One Call by Call" subscription only. Learn more

https://api.openweathermap.org/data/3.0/onecall?lat=30.489772&lon=-99.771335&lang=zh_cn

We support the following languages. To select one, you can use the corresponding language code:

sq Albanian
af Afrikaans
ar Arabic
az Azerbaijani
eu Basque
be Belarusian
bg Bulgarian
ca Catalan
zh_cn Chinese Simplified
zh_tw Chinese Traditional
hr Croatian
cz Czech
da Danish
nl Dutch
en English
fi Finnish
fr French
gl Galician
de German
el Greek
he Hebrew
hi Hindi
hu Hungarian
is Icelandic
id Indonesian
it Italian
ja Japanese
kr Korean
ku Kurmanji (Kurdish)
la Latvian
lt Lithuanian
mk Macedonian
no Norwegian
fa Persian (Farsi)
pl Polish
pt Portuguese
pt_br Português Brasil
ro Romanian
ru Russian
sr Serbian
sk Slovak
sl Slovenian
sp, es Spanish
sv, se Swedish
th Thai
tr Turkish
ua, uk Ukrainian
vi Vietnamese
zu Zulu
List of national weather alerts sources
Country	Agency
Albania	Institute of GeoSciences, Energy, Water and Environment of Albania
Algeria	National Meteorological Office
Argentina	National Weather Service of Argentina
Australia	Australian Bureau of Meteorology
Austria	
Central Institute for Meteorology and Geodynamics
Water Balance Department
Bahrain	Bahrain Meteorological Directorate
Barbados	Barbados Meteorological Service
Belarus	State institution "Republican center for hydrometeorology, control of radioactive contamination and environmental monitoring" (Belhydromet)
Belgium	Royal Meteorological Institute
Belize	National Meteorological Service of Belize
Benin	National Meteorological Agency (METEO-BENIN)
Bosnia and Herzegovina	
Federal Hydrometeorological Institute of BiH
Republic Hydrometeorological Institute
Botswana	Botswana Meteorological Services
Brazil	National Meteorological Institute - INMET
Bulgaria	National Institute of Meteorology and Hydrology - Plovdiv branch
Cameroon	Cameroon National Meteorological Service
Canada	
Alberta Emergency Management Agency (Government of Alberta, Ministry of Municipal Affairs)
Meteorological Service of Canada
Quebec Ministry of Public Safety
Yukon Emergency Measures Organization
Manitoba Emergency Management Organization
Chile	Meteorological Directorate of Chile
Congo	National Civil Aviation Agency (ANAC Congo)
Costa Rica	National Meteorological Institute of Costa Rica
Croatia	State Hydrometeorological Institute (DHMZ)
Curacao and Sint Maarten	Meteorological Department Curacao
Cyprus	Republic of Cyprus - Department of Meteorology
Czech Republic	Czech Hydrometeorological Institute
Denmark	Danish Meteorological Institute
Ecuador	Ecuadoran Institute for Meteorology and Hydrology (INAMHI)
Egypt	Egyptian Meteorological Authority
Estonia	Estonian Environment Agency
Eswatini	Eswatini Meteorological Service
Finland	Finnish Meteorological Institute
France	Meteo-France
Gabon	General Directorate of Meteorology of Gabon
Germany	German Meteorological Office
Ghana	Ghana Meteorological Agency
Greece	Hellenic National Meteorological Service
Guinea	National Meteorological Agency of Guinea
Guyana	Hydrometeorological Service of Guyana
Hong Kong China	Hong Kong Observatory
Hungary	Hungarian Meteorological Service
Iceland	Icelandic Meteorological Office
India	India Meteorological Department
Indonesia	
Agency for Meteorology Climatology and Geophysics of Republic Indonesia (BMKG)
InaTEWS BMKG
Ireland	Met Eireann - Irish Meteorological Service
Israel	Israel Meteorological Service
Italy	Italian Air Force National Meteorological Service
Ivory Coast	Airport, aeronautical and meteorological operating and development company (SODEXAM)
Jamaica	Meteorological Service of Jamaica
Japan	Japan Meteorological Business Support Center
Jordan	Jordanian Meteorological Department
Kazakhstan	National Hydrometeorological Service of the Republic of Kazakhstan (Kazhydromet)
Kenya	Kenya Meteorological Department
Kuwait	Kuwait Meteorological Department
Latvia	Latvian Environment, Geology and Meteorology Center
Lesotho	Lesotho Meteorological Services
Libya	Libyan National Meteorological Center
Lithuania	Lithuanian Hydrometeorological Service under the Ministry of Environment of the Republic of Lithuania (LHMS)
Luxembourg	Luxembourg Airport Administration
Macao China	Macao Meteorological and Geophysical Bureau
Madagascar	METEO Madagascar
Malawi	Malawi Department of Climate Change and Meteorological Services
Maldives	Maldives Meteorological Service
Mauritania	National Meteorological Office of Mauritania
Mauritius	Mauritius Meteorological Services
Mexico	CONAGUA - National Meteorological Service of Mexico
Moldova	State Hydrometeorological Service of Moldova
Mongolia	National Agency Meteorology and the Environmental Monitoring of Mongolia
Mozambique	National Institute of Meteorology of Mozambique
Myanmar	Myanmar Department of Meteorology and Hydrology
Netherlands	Royal Netherlands Meteorological Institute (KNMI)
New Zealand	
Meteorological Service of New Zealand Limited
National Emergency Management Agency
Fire and Emergency New Zealand
Civil Defence Emergency Management (CDEM) Groups
New Zealand	New Zealand Emergency Mobile Alert
Niger	National Meteorological Directorate of Niger
Nigeria	Nigerian Meteorological Agency (NiMet)
North Macedonia	National Hydrometeorological Service - Republic of Macedonia
Norway	
Norwegian Meteorological Institute
Norwegian Water Resources and Energy Directorate
Paraguay	Directorate of Meteorology and Hydrology
Philippines	Philippine Atmospheric Geophysical and Astronomical Services Administration
Poland	Institute of Meteorology and Water Management (IMGW-PIB)
Portugal	Portuguese Institute of Sea and Atmosphere, I.P.
Qatar	Qatar Meteorology Department
Republic of Korea	Korea Meteorological Administration, Weather Information
Romania	National Meteorological Administration
Russia	Hydrometcenter of Russia
Saudi Arabia	National Center for Meteorology - Kingdom of Saudi Arabia
Serbia	Republic Hydrometeorological Service of Serbia
Seychelles	Seychelles Meteorological Authority
Singapore	Meteorological Service Singapore
Slovakia	Slovak Hydrometeorological Institute
Slovenia	National Meteorological Service of Slovenia
Solomon Islands	Solomon Islands Meteorological Services
South Africa	South African Weather Service (SAWS)
Spain	State Meteorological Agency (AEMET)
Sudan	Sudan Meteorological Authority
Sweden	Swedish Meteorological and Hydrological Institute
Switzerland	MeteoSwiss
Tanzania	Tanzania Meteorological Authority
Thailand	Thai Meteorological Department
Timor-Leste	National Directorate of Meteorology and Geophysics of Timor-Leste
Trinidad and Tobago	Trinidad and Tobago Meteorological Service
Ukraine	Ukrainian Hydrometeorological Center
United Arab Emirates (UAE)	National Center of Meteorology (NCM), United Arab Emirates
United Kingdom of Great Britain and Northern Ireland	UK Met Office
Uruguay	Uruguayan Institute of Meteorology
USA	
Environmental Protection Agency (EPA), Air Quality Alerts
Integrated Public Alert and Warning System (IPAWS)
National Oceanic and Atmospheric Administration (NOAA), National Tsunami Warning Center
National Oceanic and Atmospheric Administration (NOAA), National Weather Service
National Oceanic and Atmospheric Administration (NOAA), National Weather Service - Marine Zones
U.S. Geological Survey (USGS), Volcano Hazard Program
Uzbekistan	Uzhydromet
Yemen	Yemeni Civil Aviation and Meteorology Authority (CAMA)
Zambia	Meteorological Department Zambia
Zimbabwe	Meteorological Services Department
Please note that some agencies from the list may cease to provide us the weather alert information.
In case you don’t receive alerts from any agency, please contact us.
We constantly work on our product’s improvement and keep expanding the list of partner agencies.

Call back function for JavaScript code
To use JavaScript code you can transfer callback functionName to JSONP callback.

API call example

api.openweathermap.org/data/3.0/onecall?lat=38.8&lon=12.09&callback=test


API errors
Structure of API errors
In case of incorrected API call you will receive API error response. Error response payload returned for all types of errors with the structure below.

Example of error response

Example of error response


                
{
    "cod":400,
    "message":"Invalid date format",
    "parameters": [
        "date"
    ]
}
        
              
Fields in error response

cod Code of error
message Description of error
parameters(optional) List of request parameters names that are related to this particular error
Errors list

Please find more detailed information about some popular errors below.
API calls return an error 400

API calls return an error 401

API calls return an error 404

API calls return an error 429

API calls return errors '5xx'