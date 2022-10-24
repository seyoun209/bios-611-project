library(shiny)
library(tidyverse)
library(plotly)

## Input port argument
args <- commandArgs(trailingOnly=TRUE)
port <- as.numeric(args[[1]])








## Run
shinyApp(ui = ui, server = server, options = list(port = port, host = "0.0.0.0"))
