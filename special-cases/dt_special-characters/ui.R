library("DT")

fluidPage(
  h1("pool %>% tbl()"),
  downloadButton("rdata_local_oxrep", "rdata_local_oxrep"),
  downloadButton("rdata_shinyapps_oxrep", "rdata_shinyapps_oxrep"),
  h1("dbSendQuery"),
  downloadButton("rdata_remote_dbSendQuery", "rdata_remote_dbSendQuery"),
  downloadButton("rdata_local_dbSendQuery", "rdata_local_dbSendQuery"),
  h1("readr_local_exported_display_main_table_DT"),
  DT::dataTableOutput("readr_local_exported_display_main_table_DT"),
  downloadButton("rdata_readr_local_exported_display_main_data", "rdata_readr_local_exported_display_main_data"),
  downloadButton("download_readr_local_exported_display_main_data", "Download Table"),
  h1("readr_shinyapps_exported_display_main_table_DT"),
  DT::dataTableOutput("readr_shinyapps_exported_display_main_table_DT"),
  downloadButton("rdata_readr_shinyapps_exported_display_main_data", "rdata_readr_shinyapps_exported_display_main_data"),
  downloadButton("download_readr_shinyapps_exported_display_main_data", "Download Table"),
  h1("utils_shinyapps_exported_display_main_table_DT"),
  DT::dataTableOutput("utils_shinyapps_exported_display_main_table_DT"),
  downloadButton("rdata_utils_shinyapps_exported_display_main_data", "rdata_utils_shinyapps_exported_display_main_data"),
  downloadButton("download_utils_shinyapps_exported_display_main_data", "Download Table"),
  h1("utils_local_exported_display_main_table_DT"),
  DT::dataTableOutput("utils_local_exported_display_main_table_DT"),
  downloadButton("rdata_utils_local_exported_display_main_data", "rdata_utils_local_exported_display_main_data"),
  downloadButton("download_utils_local_exported_display_main_data", "Download Table")
  )