output$rdata_local_oxrep <- downloadHandler(
  filename = function(){
    paste0("rdata_local_oxrep", ".rdata")
  },
  content = function(file){

    rdata_local_oxrep <- oxrep_data$local

    save(rdata_local_oxrep, file = file)

  }
)

output$rdata_local_dbSendQuery <- downloadHandler(
  filename = function(){
    paste0("rdata_local_dbSendQuery", ".rdata")
  },
  content = function(file){

    oxrep_db <- dbPool(
      drv = RMariaDB::MariaDB(),
      dbname = "oxrep",
      port = 3306,
      host = "163.1.169.203",
      user = "ouit0409"
    )

    connection_oxrep_db <- poolCheckout(oxrep_db)

    # dbSendQuery(connection_oxrep_db, "SET NAMES utf8;")

    rs <- dbSendQuery(connection_oxrep_db, "SELECT * FROM Shipwrecks")

    data_from_oxrep <- dbFetch(rs)

    poolReturn(connection_oxrep_db)

    rdata_local_dbSendQuery <- data_from_oxrep %>%
      slice(285:300) %>%
      mutate(encoding = Encoding(wreckName)) %>%
      select(encoding, wreckSite)

    save(rdata_local_dbSendQuery, file = file)

  }
)

output$readr_local_exported_display_main_table_DT <-
  DT::renderDataTable({
    # input$update

    if (file.exists("data/readr_local_exported_display_main_data.csv")) {
      read_csv("data/readr_local_exported_display_main_data.csv") %>%
        datatable()
    } else {
      tibble(note = "You must run this app locally first!") %>%
        datatable()
    }

  })

output$download_readr_local_exported_display_main_data <- downloadHandler(
  filename = function() {
    paste("readr_local_exported_display_main_data", ".csv", sep = "")
  },
  content = function(file) {

    read_csv("data/readr_local_exported_display_main_data.csv") %>%
      write_csv(file)
  }
)

output$rdata_readr_local_exported_display_main_data <- downloadHandler(
  filename = function(){
    paste0("readr_local_exported_display_main_data", ".rdata")
  },
  content = function(file){

    readr_local_exported_display_main_data <- read_csv("data/readr_local_exported_display_main_data.csv")

    save(readr_local_exported_display_main_data, file = file)

  }
)

output$utils_local_exported_display_main_table_DT <-
  DT::renderDataTable({
    if (file.exists("data/utils_local_exported_display_main_data.csv")) {
      read_csv("data/utils_local_exported_display_main_data.csv") %>%
        datatable()
    } else {
      tibble(note = "You must run this app locally first!") %>%
        datatable()
    }

  })

output$download_utils_local_exported_display_main_data <- downloadHandler(
  filename = function() {
    paste("utils_local_exported_display_main_data", ".csv", sep = "")
  },
  content = function(file) {

    read_csv("data/utils_local_exported_display_main_data.csv") %>%
      write_csv(file)
  }
)

output$rdata_utils_local_exported_display_main_data <- downloadHandler(
  filename = function(){
    paste0("utils_local_exported_display_main_data", ".rdata")
  },
  content = function(file){

    utils_local_exported_display_main_data <- read_csv("data/utils_local_exported_display_main_data.csv")

    save(utils_local_exported_display_main_data, file = file)

  }
)

