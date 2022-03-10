#'
#'
#'
#'
#'
#'


ui <- fluidPage(
  
  # Put a titlePanel here
  titlePanel("k-means clustering"),
  
  sidebarLayout(
    # Sidebar. Put your inputs inside the sidebarPanel
    sidebarPanel(
      selectInput('xcol', 'X Variable', names(iris)),
      selectInput('ycol', 'Y Variable', names(iris),
                  selected=names(iris)[[2]]),
      numericInput('clusters', 'Cluster count', 3,
                   min = 1, max = 9)
    ),
    
    # Main panel. put your output plot here
    mainPanel(
      plotOutput('plot1')
    )
  )
)

server <- function(input, output, session) {
  
  selectedData <- reactive({
    iris[, c(input$xcol, input$ycol)]
  })
  
  clusters <- reactive({
    create_clusters(selectedData(), input$clusters)
  })
  
  output$plot1 <- renderPlot({
    palette(c("#999999", "#E69F00", "#56B4E9", "#009E73", 
              "#F0E442", "#0072B2", "#D55E00", "#CC79A7"))
    
    par(mar = c(5.1, 4.1, 0, 1))
    plot_clusters(selectedData(),clusters())
  })
}

shinyApp(ui = ui, server = server)