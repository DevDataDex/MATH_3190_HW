data <- get_cbb_data()

ui <- fluidPage(
  
    theme = shinytheme("sandstone"),
  
    titlePanel("College Basketball Data"),
  
    navbarPage("Menu",
      tabPanel("Individual Team Data",
        sidebarLayout(
          sidebarPanel(
            selectInput('team', 'Teams', team_list(data), 
                        selected = "Southern Utah"),
            textOutput("text1")
          ),
          
          mainPanel(
            plotOutput("plot1"),
            DTOutput("table1"),
            plotOutput("plot2")
          ),
        ),
      ),
      
      tabPanel("All Team Data",
          DTOutput("table2")
      )
    )

)

server <- function(input, output, session) {
  
  team <- reactive({input$team})
  
  output$text1 <- renderPrint({
    team_win_record(data,team(),1)
  })
    
  output$plot1 <- renderPlot({
       bbgraph(data, team())
     })  
  
  output$plot2 <- renderPlot({
    violingraph(data, team())
  })
  
  output$table1 <- renderDT(
      team_filter(data, team()),
      options = list(pageLength = 10, 
                     bFilter = FALSE),
      rownames = FALSE,
      colnames = c("Date", "Opponent", "Team Score", "Opponent Score", 
                   "Location", "Score Difference")
  )
  
  output$table2 <- renderDT(
    all_teams_records(data),
    options = list(pageLength = 10),
    colnames = c("Rank","Team","Wins","Total Games", "Win Percentage", "Sort")
  )
}

shinyApp(ui = ui, server = server)


