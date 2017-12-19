## Different versions

# source("access-oxrep.R")
# display_main_data <- display_main_data %>%
#   slice(285:300) %>%
#   mutate(encoding = Encoding(wreckName)) %>%
#   select(encoding, wreckSite)
#
# display_main_data

# save(display_main_data, file = "data/rdata-object.rdata")
load(file = "data/rdata-object.rdata")

# username_oxrep_db <- "local.username"
username_oxrep_db <- "server.username"

switch(username_oxrep_db,
       "server.username" = {
         display_main_data %>%
           write_csv("data/readr_shinyapps_exported_display_main_data.csv")
       },
       "local.username" = {
         display_main_data %>%
           write_csv("data/readr_local_exported_display_main_data.csv")
       })

switch(username_oxrep_db,
       "server.username" = {
         display_main_data %>%
           write.csv("data/utils_shinyapps_exported_display_main_data.csv")
       },
       "local.username" = {
         display_main_data %>%
           write.csv("data/utils_local_exported_display_main_data.csv")
       })
