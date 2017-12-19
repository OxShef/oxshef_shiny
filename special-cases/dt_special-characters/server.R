library("tidyverse")
library("shiny")
library("DT")
library("pool")
library("dbplyr")
library("RMariaDB")

function(input, output, session) {

  oxrep_data <- reactiveValues()

  observe({
    if (session$clientData$url_hostname == "127.0.0.1") {
      oxrep_db <- dbPool(
        drv = RMariaDB::MariaDB(),
        dbname = "oxrep",
        port = 3306,
        host = "163.1.169.203",
        user = "ouit0409"
      )

      display_main_data <- oxrep_db %>%
        tbl("Shipwrecks") %>%
        collect() %>%
        slice(285:300) %>%
        mutate(encoding = Encoding(wreckName)) %>%
        select(encoding, wreckSite)

      display_main_data %>%
        write_csv("data/readr_local_exported_display_main_data.csv")

      display_main_data %>%
        write.csv("data/utils_local_exported_display_main_data.csv")

      oxrep_data$local <- display_main_data

    } else {
      oxrep_db <- dbPool(
        drv = RMariaDB::MariaDB(),
        dbname = "oxrep",
        port = 3306,
        host = "163.1.169.203",
        user = "shiney"
      )

      display_main_data <- oxrep_db %>%
        tbl("Shipwrecks") %>%
        collect() %>%
        slice(285:300) %>%
        mutate(encoding = Encoding(wreckName)) %>%
        select(encoding, wreckSite)

      display_main_data %>%
        write_csv("data/readr_shinyapps_exported_display_main_data.csv")

      display_main_data %>%
        write.csv("data/utils_shinyapps_exported_display_main_data.csv")

      oxrep_data$shinyapps <- display_main_data
    }

  })

  source("local-files.R", local = TRUE)$value

  source("remote-files.R", local = TRUE)$value

}