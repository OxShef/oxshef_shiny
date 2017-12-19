## =============================== License ========================================
## ================================================================================
## This work is distributed under the CC0 1.0 Universal (CC0 1.0) license, included in the parent directory
## Copyright Owner: University of Oxford
## Date of Authorship: 2016
## Author: Martin John Hadley (orcid.org/0000-0002-3039-6849)
## ================================================================================

library(shinyjs)

shinyUI(navbarPage(
  "OxShef Template App",
  tabPanel(
    "Visualisation",
    fluidPage(
      uiOutput("url_allow_popout_UI"),
      useShinyjs(),
      includeCSS("www/animate.min.css"),
      # provides pulsating effect
      includeCSS("www/loading-content.css"),
      # provides styles for the "loading sheet"
      wellPanel(
        p("Below a ggplot2 chart will be shown after a pause of 5 seconds."),
        p(
          "You can force the loading screen to show again by clicking the submit button."
        ),
        p(
          "Note that ALL content below where 'loading pane' is greyed out i.e. the loading pane is on top
          of all other content."
        ),
        actionButton("reload", label = "Reload")
        ),
      div(
        id = "loading-content",
        class = "loading-content",
        h2(class = "animated infinite pulse", "Loading data...")
      ),
      plotOutput("chart", height = "200px"),
      "Text below the chart, probably explaining why the chart looks the way it does. Note that the \"loading pane\" covers this content too, it is designed to cover the entirety of the screen below where it is called in the ui.R file"
    )
    ),
  tabPanel("About",
           includeMarkdown(knitr::knit("tab_about.Rmd"))),
  ## collapses the menu bar into a "hamburger" when the window is narrower than 768px
  ## see https://shiny.rstudio.com/articles/layout-guide.html for more info
  collapsible = TRUE
))

