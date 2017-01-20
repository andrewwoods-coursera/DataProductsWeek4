library(shiny)
library(ggplot2)

shinyServer(function(input, output) {
  

  # Combine the selected variables into a new data frame
  selectedData <- reactive({
    iris[, c(input$xvar, input$yvar)]
  })

  output$plot <- renderPlot({
    clusters <- kmeans(selectedData(), input$clusters)
    cluster <- as.factor(clusters$cluster)
#    noerror <- unclass(iris$Species) == cluster
    p <- ggplot(iris, aes_string(x=input$xvar, y=input$yvar, color=cluster)) +
    geom_point(size=5) +
      labs(color="cluster")
    
#    last_plot() + geom_point(size = 8, alpha = 0.5, aes(shape = noerror))
    
    print(p)
    
  }, height=500)
  
})