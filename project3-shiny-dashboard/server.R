# Load libraries
library(shiny)
library(tidyverse)

# Read in data
adult <- read_csv("adult.csv")
# Convert column names to lowercase for convenience 
names(adult) <- tolower(names(adult))

# Define server logic
shinyServer(function(input, output) {
  
  df_country <- reactive({
    adult %>% filter(native_country == input$country)
  })
  
  # TASK 5: Create logic to plot histogram or boxplot
  output$p1 <- renderPlot({
    if (input$graph_type == "histogram") {
      # Histogram
      ggplot(df_country(), aes_string(x = input$continuous_variable)) +
        geom_histogram(binwidth = 5, fill = "steelblue", color = "black", alpha = 0.7) +
        labs(title = paste("Histogram of", input$continuous_variable), 
             x = input$continuous_variable, 
             y = "Frequency") +
        facet_wrap(~prediction) +
        theme_minimal()
    }
    else {
      # Boxplot
      ggplot(df_country(), aes_string(y = input$continuous_variable, x = "prediction")) +
        geom_boxplot(fill = "lightblue", color = "darkblue") +
        labs(title = paste("Boxplot of", input$continuous_variable), 
             x = "Income Level", 
             y = input$continuous_variable) +
        theme_minimal()
    }
    
  })
  
  # TASK 6: Create logic to plot faceted bar chart or stacked bar chart
  output$p2 <- renderPlot({
    # Bar chart
    p <- ggplot(df_country(), aes_string(x = input$categorical_variable)) +
      labs(title = paste("Bar Chart of", input$categorical_variable), 
           x = input$categorical_variable, 
           y = "Count") +
      theme_minimal() +
      theme(axis.text.x = element_text(angle = 45, hjust = 1),
            legend.position = "bottom")
    
    if (input$chart_type == "stacked") {
      p + geom_bar(aes(fill = prediction), position = "stack")
    }
    else{
      p + 
        geom_bar(aes_string(fill = input$categorical_variable)) +
        facet_wrap(~prediction)
    }
  })
  
})
