library(shiny)
library(leaflet)

# Define UI
ui <- fluidPage(
  leafletOutput("map")
)