# OxShef Shiny: tutorial-apps/shiny101

function(input, output, session){

  output$curvePlot <- renderPlot({
    print(input$exponent)
    curve(x^as.numeric(input$exponent),
          from = -3,
          to = 3,
          main = paste0("Plot of x^", input$exponent),
          ylab = "y")
  })

}