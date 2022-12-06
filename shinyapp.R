library(shiny)
library(tidyverse)
library(plotly)

## Input port argument
args <- commandArgs(trailingOnly=TRUE)
port <- as.numeric(args[[1]])

new_cc <- as.data.frame(read.csv("01.source/cleanup_data.csv",sep=" ",header=T))
data_subset <- new_cc %>% dplyr::select(CodingHours, CoffeeCupsPerDay,CoffeeSolveBugs)
        

## Define UI
ui <- fluidPage(

  titlePanel("Relationship coffee and code"),
  plotOutput("plot1", brush = "plot_brush"),
  tableOutput("data")
  
)



## Define server
server <- function(input, output) {
  output$plot1 <- renderPlot({
   ggplot(data_subset,aes(x=CoffeeCupsPerDay, y=CodingHours,color=data_subset$CoffeeSolveBugs)) + 
      geom_point() +
      geom_smooth(method=lm, se=FALSE) +
      labs(y= "CodingHours", x = "CoffeeCupsPerDay",colour="CoffeeSolveBugs")
  }, res = 96)
  output$data <- renderTable({
    brushedPoints(data_subset, input$plot_brush)
  })
}

## Run
shinyApp(ui = ui, server = server, options = list(port = 8080,
                                                  host = "0.0.0.0"))


