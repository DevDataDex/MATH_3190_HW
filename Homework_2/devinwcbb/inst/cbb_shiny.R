data <- get_cbb_data()

ui <- fluidPage(
  
    titlePanel("College Basketball Data"),
  
    sidebarLayout(
      
      sidebarPanel(
        selectInput('team', 'Teams', team_list(data), 
                    selected = "Southern Utah"),
        textOutput("text1")
        
      ),
      
      mainPanel(
        plotOutput("plot1"),
       
      )
      
    ),
    
    mainPanel( DTOutput("table1"))
  
  
)

server <- function(input, output, session) {
  
  team <- reactive({input$team})
  
  output$text1 <- renderPrint({
    team_win_record(data,team(),1)
  })
    
  output$plot1 <- renderPlot({
       bbgraph(data, team())
     })  
  
  output$table1 <- renderDT(
      team_filter(data, team()),
      options = list(pageLength = 10, 
                     bFilter = FALSE),
      rownames = FALSE,
      
  )
}

shinyApp(ui = ui, server = server)


