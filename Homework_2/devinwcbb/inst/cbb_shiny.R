library(shiny)
library(tidyverse)
library(devinwcbb)

ui <- fluidPage(
  
    titlePanel("College Basketball Data"),
  
    fluidRow(
      column(12,
           tableOutput("table1")
    )
  )
  
)

server <- function(input, output, session) {
  
  output$table1 <- renderTable(all_teams_records(data))
                             
}

shinyApp(ui = ui, server = server)