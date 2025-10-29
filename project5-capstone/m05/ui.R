# Load required libraries
require(leaflet)
require(shiny)

# Create a RShiny UI
shinyUI(
  fluidPage(padding=5,
  titlePanel("Bike-sharing demand prediction app"), 
  # Create a side-bar layout
  sidebarLayout(
    # Create a main panel to show cities on a leaflet map
    mainPanel(
      # leaflet output with id = 'city_bike_map', height = 1000
      leafletOutput("city_bike_map", height = 1000)
    ),
    # Create a side bar to show detailed plots for a city
    sidebarPanel(
      # select drop down list to select city
      selectInput("city_dropdown", "Select City:", 
                  choices = c("All", "Seoul", "New York", "Paris", "London", "Suzhou"),
                  selected = "All"),
      
      # Temperature trend plot
      plotOutput("temp_line", height = 300),
      
      # Interactive bike prediction trend plot with click event
      plotOutput("bike_line", height = 300, click = "plot_click"),
      
      # Text output for clicked bike prediction point
      verbatimTextOutput("bike_date_output"),
      
      # Humidity vs bike prediction correlation plot
      plotOutput("humidity_pred_chart", height = 300)
    ))
))