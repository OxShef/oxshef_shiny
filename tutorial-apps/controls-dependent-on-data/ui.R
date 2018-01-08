# OxShef Shiny: tutorial-apps/controls-dependent-on-data

library("leaflet")

fluidPage(
  sidebarLayout(
    sidebarPanel(
      "The pulldown menu below contains only those continents included in the gapminder dataset.",
      # uiOutput("selected_continent_UI"),
      selectInput("selected_continent",
                  "Selected continent:",
                  choices = ""),
      hr(),
      "The pulldown menu below is populated with countries included in the gapminder dataset which are members of the continent chosen above.",
      # uiOutput("selected_country_UI"),
      selectInput("selected_country",
                  "Selected country:",
                  choices = ""),
      hr(),
      "Hover and click on the displayed country shape for additional information about the country.",
      "Country shapes are from the rnaturalearthhires library.",
      hr(),
      HTML("This app is part of the <a href='https://oxshef.github.io/oxshef_shiny/tutorials_controls-dependent-on-data.html' target='_blank'>Oxshef \"Controls dependent on data\" tutorial</a>")
    ),
    mainPanel(
      leafletOutput("selected_country_map")
    )
  )
)