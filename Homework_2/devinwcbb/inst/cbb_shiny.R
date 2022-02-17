data <- get_cbb_data()

ui <- fluidPage(
  
    titlePanel("College Basketball Data"),
  
    sidebarLayout(
      
      sidebarPanel(
        selectInput('team', 'Teams', team_list(data), 
                    selected = "Southern Utah")
      ),
      
      
      
      mainPanel(
        plotOutput("plot1"),
        textOutput("text1")
      )
      
    )
    
    # fluidRow(
    #   column(12,
    #        tableOutput("table1")
    #   )
    # )
    
    
  
)

server <- function(input, output, session) {
  
  team <- reactive({input$team})
  
  # output$table1 <- renderTable(all_teams_records(data))
  
  output$text1 <- renderPrint({
    team_win_record(data,team(),1)
  })
    
  output$plot1 <- renderPlot({
       bbgraph(data, team())
     })                        
}

shinyApp(ui = ui, server = server)