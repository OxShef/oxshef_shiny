
### =========== Get labels ======================
### =============================================

shipwrecks_table_labels <- read_csv("data/shipwrecks-table-labels.csv")
colnames(shipwrecks_table_labels) <- tolower(make.names(colnames(shipwrecks_table_labels)))

shipwrecks_table_labels <- shipwrecks_table_labels %>%
  mutate(display.name = ifelse(is.na(display.name), data.name , display.name)) %>%
  mutate(
    display.name = gsub('([[:upper:]])', ' \\1', display.name),
    display.name = gsub(
      "(^|[[:space:]])([[:alpha:]])",
      "\\1\\U\\2",
      display.name,
      perl = TRUE
    ))

### =========== Get secure database details =====
### =============================================

secure_database_details <- read_csv("data/secure-database-details.csv", locale = locale(encoding = "UTF-8"))

#
# username_oxrep_db <- "local.username"
username_oxrep_db <- "server.username"


print(paste("The current value of username_oxrep_db is", username_oxrep_db, "\nThis MUST be 'server.username' when deploying to the server. IS IT?"))

print(paste("The username submitted to dbPool is:", secure_database_details %>%
              filter(property == username_oxrep_db) %>%
              select(value) %>%
              .[[1]]))

## ======= LOCAL
oxrep_db <- dbPool(
  drv = RMySQL::MySQL(),
  dbname = "oxrep",
  port = 3306,
  host = secure_database_details %>%
    filter(property == "host") %>%
    select(value) %>%
    .[[1]],
  user = secure_database_details %>%
    filter(property == username_oxrep_db) %>%
    select(value) %>%
    .[[1]]
)

### =========== Get main table =============
### =============================================

dt_main_data <- {
  shipwrecks <- oxrep_db %>%
    tbl("Shipwrecks") %>%
    collect()
}

total_observations_dt_main_data <- nrow(dt_main_data)


dt_main_data <- dt_main_data %>%
  mutate(maximumDepth = as.numeric(maximumDepth),
         minimumDepth = as.numeric(minimumDepth))


display_main_label_df <- shipwrecks_table_labels %>%
  filter(!is.na(main.table)) %>%
  select(data.name, display.name) %>%
  mutate(display.name = trimws(display.name),
         display.name = gsub("\\s+", " ", display.name))

# dt_main_data <- dt_main_data %>%
#   mutate_if(is.character, funs(stringr::str_conv(., "UTF-8")))


### =========== Artifacts

shipwreck_finds <- oxrep_db %>%
  tbl("ShipwreckFinds") %>%
  collect()



### =========== Display version of tables

## Display version omits IDs
display_main_data <- dt_main_data %>%
  select(-contains("ID")) %>%
  # select(display_main_label_df$data.name) %>%
  collect()


