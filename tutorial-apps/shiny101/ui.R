# OxShef Shiny: tutorial-apps/shiny101

fluidPage(
  selectInput("exponent", label = "Exponent (i.e. x^n)", choices = 1:5),
  plotOutput("curvePlot")
)