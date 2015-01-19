#setwd("~/Documents/R_projects/shinyapp")
library(shiny)
library(datasets)
library(ggplot2)

shinyServer(
  function(input, output) {
    r<<- 108
    output$ocyl<- renderPrint({input$cyl})
    out<- function() {
      cars<- mpg[mpg$cyl %in% input$cyl
                    & mpg$class %in% input$class
                    & mpg$cty >= input$cty
                    & mpg$year >= input$year
                    & mpg$hwy >= input$hwy, -7]
      output<- if (nrow(cars) >0) {cars} else "No cars matching the criteria"
      return(output)}
    output$ocars<- renderPrint(out())
    output$r<- renderPrint(if (out() == "No cars matching the criteria") {0} else {nrow(out())})
    #output$re<- paste(as.character(renderPrint((if (out() == "No cars matching the criteria") {0} else {nrow(out())}))), " matching results")
    output$results <- renderPrint(paste(nrow(out()), " matching results"))
    output$downloadData <- downloadHandler(
      filename<- 'carsResult.csv',
      content<- function(file) {write.csv(out(), file)}
      )
  } )