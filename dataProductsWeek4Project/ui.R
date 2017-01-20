library(shinythemes)
library(shiny)
library(ggplot2)

dataset <- iris

fluidPage(theme = shinytheme("slate"),
  
  sidebarPanel(
  
    selectInput('xvar', 'X', names(dataset)),
    selectInput('yvar', 'Y', names(dataset), names(dataset)[[2]]),

    numericInput('clusters', 'Cluster count', 3,
                 min = 1, max = 9)
  ),
  

mainPanel(
  tabsetPanel(
    tabPanel("Plot", plotOutput('plot')),
    tabPanel("Help", p("This simple shiny app uses k-mean clustering to group elements in the iris data set.  Simply select the varaibles to compare and the number of clusters you wish to create."))
)
    
  )
)
