library(shiny)
library(tidyverse)
library(plotly)

## Input port argument
args <- commandArgs(trailingOnly=TRUE)
port <- as.numeric(args[[1]])

new_cc <- as.data.frame(read.csv("01.source/cleanup_data.csv",sep=" ",header=T))
data_subset <- new_cc %>% dplyr::select(CodingHours, CoffeeCupsPerDay)
        

## Define UI
ui <- fluidPage(
  
  titlePanel("Relationship coffee and code"),
  
  sidebarLayout(
    position = "right",
    sidebarPanel(
      radioButtons(
        inputId = "CodingHours",
        label = "CodingHours",
        choices = 1:10
      ),
      sliderInput(
        inputId = "CoffeeCupsPerDay",
        label = "CoffeeCupsPerDay,",
        min = 1,
        max = 7,
        value = c(1, 7)
      )
    ),
    
    mainPanel(
      
      plotlyOutput(outputId = "relationship")
      
    )
  )
  
)

## Define server
server <- function(input, output){
  output$relationship <- renderPlotly({
    ch <- input$CodingHours
    ch_data <- data_subset %>% 
      filter(CodingHours == ch)
    ggplotly(ggplot(ch_data, aes(CoffeeCupsPerDay)) +
               geom_histogram(bins = nrow(ch_data),
                              fill = "#f8d6b8") +
               xlim(c(input$range[1], input$range[2])) +
               theme_minimal())
    
  })
  
}

## Run
shinyApp(ui = ui, server = server, options = list(port = port,
                                                  host = "0.0.0.0"))

