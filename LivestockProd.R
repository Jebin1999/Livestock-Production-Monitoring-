# Install necessary packages if not already installed
if (!require("shiny")) install.packages("shiny")
if (!require("httr")) install.packages("httr")
if (!require("jsonlite")) install.packages("jsonlite")
if (!require("ggplot2")) install.packages("ggplot2")
if (!require("dplyr")) install.packages("dplyr")

library(shiny)
library(httr)
library(jsonlite)
library(ggplot2)
library(dplyr)

# Function to fetch live weather data from Open-Meteo API (no API key required)
fetch_weather_data <- function(latitude, longitude) {
  url <- paste0("https://api.open-meteo.com/v1/forecast?latitude=", latitude,
                "&longitude=", longitude, "&current_weather=true")
  response <- GET(url)
  
  # Check if the API request was successful
  if (status_code(response) == 200) {
    weather_data <- fromJSON(content(response, as="text"))
    return(weather_data)
  } else {
    return(NULL)
  }
}

# Function to simulate milk yield data
simulate_milk_yield <- function(hours) {
  data.frame(
    time = seq.POSIXt(from = Sys.time() - hours * 3600, by = "hour", length.out = hours),
    milk_yield = round(rnorm(hours, mean = 25, sd = 3), 2) # Simulate milk yield in liters
  )
}

# Shiny UI
ui <- fluidPage(
  titlePanel("Livestock Production Monitoring with Live Weather Data"),
  
  sidebarLayout(
    sidebarPanel(
      textInput("location", "Enter Latitude,Longitude (e.g., Dublin: 53.3498,-6.2603):", value = "53.3498,-6.2603"),
      numericInput("hours", "Simulate Hours of Data:", value = 12, min = 1, max = 48),
      actionButton("update", "Update Data")
    ),
    
    mainPanel(
      textOutput("weatherInfo"),
      plotOutput("milkYieldPlot")
    )
  )
)

# Shiny Server
server <- function(input, output, session) {
  
  # Reactive values to store data
  data <- reactiveValues(
    weather = NULL,
    milk_yield = NULL
  )
  
  # Observe button click and fetch live data
  observeEvent(input$update, {
    # Split the input location into latitude and longitude
    coords <- unlist(strsplit(input$location, ","))
    latitude <- as.numeric(coords[1])
    longitude <- as.numeric(coords[2])
    
    # Fetch weather data from Open-Meteo API
    weather_data <- fetch_weather_data(latitude, longitude)
    
    # Check if weather data was successfully fetched
    if (!is.null(weather_data)) {
      data$weather <- weather_data$current_weather
    } else {
      showNotification("Failed to fetch weather data. Check the coordinates.", type = "error")
    }
    
    # Simulate milk yield data
    data$milk_yield <- simulate_milk_yield(input$hours)
  })
  
  # Display weather information
  output$weatherInfo <- renderText({
    req(data$weather)
    weather <- data$weather
    paste("Weather at the location:",
          "\nTemperature:", weather$temperature, "°C",
          "\nWind Speed:", weather$windspeed, "m/s")
  })
  
  # Plot milk yield
  output$milkYieldPlot <- renderPlot({
    req(data$milk_yield)
    ggplot(data$milk_yield, aes(x = time, y = milk_yield)) +
      geom_line(color = "blue") +
      labs(title = "Simulated Milk Yield Over Time", x = "Time", y = "Milk Yield (L)") +
      theme_minimal()
  })
}

# Run the application 
shinyApp(ui = ui, server = server)
