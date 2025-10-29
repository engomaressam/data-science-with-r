# Install and import required libraries
require(shiny)
require(ggplot2)
require(leaflet)
require(tidyverse)
require(httr)
require(scales)
# Import model_prediction R which contains methods to call OpenWeather API
# and make predictions
source("model_prediction.R")

test_weather_data_generation<-function(){
  city_weather_bike_df<-generate_city_weather_bike_data()
  stopifnot(length(city_weather_bike_df)>0)
  print(head(city_weather_bike_df))
  return(city_weather_bike_df)
}

# Create a RShiny server
shinyServer(function(input, output){
  # Define a city list
  city_list <- c("Seoul", "New York", "Paris", "London", "Suzhou")
  
  # Define color factor
  color_levels <- colorFactor(c("green", "yellow", "red"), 
                              levels = c("small", "medium", "large"))
  
  # Generate city weather bike data
  city_weather_bike_df <- reactive({
    generate_city_weather_bike_data()
  })

  # Create another data frame called `cities_max_bike` with each row contains city location info and max bike
  # prediction for the city
  cities_max_bike <- reactive({
    city_weather_bike_df() %>%
      group_by(CITY_ASCII, LNG, LAT) %>%
      summarise(
        max_bike_prediction = max(BIKE_PREDICTION, na.rm = TRUE),
        bike_prediction_level = ifelse(max_bike_prediction < 1000, "small",
                                     ifelse(max_bike_prediction < 3000, "medium", "large")),
        label = first(LABEL),
        .groups = 'drop'
      )
  })
  
  # Observe drop-down event and render leaflet map
  observeEvent(input$city_dropdown, {
    if(input$city_dropdown == "All") {
      # If All was selected from dropdown, then render a leaflet map with circle markers
      # and popup weather LABEL for all five cities
      output$city_bike_map <- renderLeaflet({
        leaflet(cities_max_bike()) %>%
          addTiles() %>%
          addCircleMarkers(
            lng = ~LNG, 
            lat = ~LAT,
            popup = ~label,
            radius = ~ifelse(bike_prediction_level == "small", 6,
                           ifelse(bike_prediction_level == "medium", 10, 12)),
            color = ~color_levels(bike_prediction_level),
            stroke = FALSE,
            fillOpacity = 0.8
          )
      })
      
      # Clear sidebar plots when "All" is selected
      output$temp_line <- renderPlot({
        ggplot() + 
          geom_text(aes(x = 0.5, y = 0.5, label = "Select a city to view detailed plots"), 
                   size = 6, hjust = 0.5, vjust = 0.5) +
          theme_void() +
          xlim(0, 1) + ylim(0, 1)
      })
      
      output$bike_line <- renderPlot({
        ggplot() + 
          geom_text(aes(x = 0.5, y = 0.5, label = "Select a city to view detailed plots"), 
                   size = 6, hjust = 0.5, vjust = 0.5) +
          theme_void() +
          xlim(0, 1) + ylim(0, 1)
      })
      
      output$humidity_pred_chart <- renderPlot({
        ggplot() + 
          geom_text(aes(x = 0.5, y = 0.5, label = "Select a city to view detailed plots"), 
                   size = 6, hjust = 0.5, vjust = 0.5) +
          theme_void() +
          xlim(0, 1) + ylim(0, 1)
      })
      
      output$bike_date_output <- renderText({
        "Click on a point in the bike prediction trend to see details"
      })
      
    } else {
      # If just one specific city was selected, then render a leaflet map with one marker
      # on the map and a popup with DETAILED_LABEL displayed
      selected_city_data <- cities_max_bike() %>%
        filter(CITY_ASCII == input$city_dropdown)
      
      selected_city_weather <- city_weather_bike_df() %>%
        filter(CITY_ASCII == input$city_dropdown)
      
      output$city_bike_map <- renderLeaflet({
        leaflet(selected_city_data) %>%
          addTiles() %>%
          addMarkers(
            lng = ~LNG, 
            lat = ~LAT,
            popup = ~first(selected_city_weather$DETAILED_LABEL)
          )
      })
      
      # Temperature trend plot
      output$temp_line <- renderPlot({
        ggplot(selected_city_weather, aes(x = as.POSIXct(FORECASTDATETIME), y = TEMPERATURE)) +
          geom_line(color = "blue", size = 1) +
          geom_point(color = "red", size = 2) +
          geom_text(aes(label = round(TEMPERATURE, 1)), vjust = -0.5, size = 3) +
          labs(title = paste("Temperature Trend for", input$city_dropdown),
               x = "Date/Time", y = "Temperature (°C)") +
          theme_minimal() +
          theme(axis.text.x = element_text(angle = 45, hjust = 1))
      })
      
      # Interactive bike prediction trend plot
      output$bike_line <- renderPlot({
        ggplot(selected_city_weather, aes(x = as.POSIXct(FORECASTDATETIME), y = BIKE_PREDICTION)) +
          geom_line(color = "darkgreen", size = 1) +
          geom_point(color = "orange", size = 2) +
          geom_text(aes(label = round(BIKE_PREDICTION, 0)), vjust = -0.5, size = 3) +
          labs(title = paste("Bike Sharing Demand Prediction for", input$city_dropdown),
               x = "Date/Time", y = "Predicted Bike Demand") +
          theme_minimal() +
          theme(axis.text.x = element_text(angle = 45, hjust = 1))
      })
      
      # Humidity vs bike prediction correlation plot
      output$humidity_pred_chart <- renderPlot({
        ggplot(selected_city_weather, aes(x = HUMIDITY, y = BIKE_PREDICTION)) +
          geom_point(color = "purple", size = 3, alpha = 0.7) +
          geom_smooth(method = "lm", formula = y ~ poly(x, 4), color = "red", se = TRUE) +
          labs(title = paste("Humidity vs Bike Demand Correlation for", input$city_dropdown),
               x = "Humidity (%)", y = "Predicted Bike Demand") +
          theme_minimal()
      })
    }
  })
  
  # Handle plot click events for bike prediction trend
  output$bike_date_output <- renderText({
    if(!is.null(input$plot_click) && input$city_dropdown != "All") {
      selected_city_weather <- city_weather_bike_df() %>%
        filter(CITY_ASCII == input$city_dropdown)
      
      # Find the closest point to the click
      click_time <- as.POSIXct(input$plot_click$x, origin = "1970-01-01")
      weather_times <- as.POSIXct(selected_city_weather$FORECASTDATETIME)
      
      closest_idx <- which.min(abs(weather_times - click_time))
      
      if(length(closest_idx) > 0) {
        clicked_data <- selected_city_weather[closest_idx, ]
        paste("Date/Time:", clicked_data$FORECASTDATETIME, 
              "\nPredicted Bike Demand:", round(clicked_data$BIKE_PREDICTION, 0))
      } else {
        "Click on a point in the bike prediction trend to see details"
      }
    } else {
      "Click on a point in the bike prediction trend to see details"
    }
  })
})
