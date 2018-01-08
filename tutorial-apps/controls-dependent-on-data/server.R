# OxShef Shiny: tutorial-apps/controls-dependent-on-data

library("tidyverse")
library("gapminder")
library("rnaturalearthhires")
library("sf")
library("shiny")

country_shps <- countries10 %>%
  st_as_sf() %>%
  setNames(. , tolower(colnames(.)))

gapminder_countries <- country_shps %>%
  inner_join(gapminder %>%
               filter(year == max(year)),
             by = c("name" = "country", "continent" = "continent"))

function(input, output, session) {
  observe({
    updateSelectInput(session,
                      "selected_continent",
                      choices = unique(gapminder_countries$continent))
  })


  observe({
    updateSelectInput(
      session,
      "selected_country",
      choices = gapminder_countries %>%
        filter(continent == input$selected_continent) %>%
        select(name) %>%
        .[[1]]
    )


  })

  output$selected_country_map <- renderLeaflet({
    if (input$selected_country == "") {
      return()
    }

    gapminder_countries %>%
      filter(name == input$selected_country) %>%
      leaflet() %>%
      addTiles() %>%
      addPolygons(
        label = ~ name,
        popup = ~ paste("Country:", name,
                        "<br>",
                        "Population:", pop)
      )

  })

}