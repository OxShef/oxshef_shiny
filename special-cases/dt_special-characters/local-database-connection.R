oxrep_db <- dbPool(
  drv = RMariaDB::MariaDB(),
  dbname = "oxrep",
  port = 3306,
  host = "163.1.169.203",
  user = "ouit0409"
)

connection_oxrep_db <- poolCheckout(oxrep_db)

dbSendQuery(connection_oxrep_db, "SET NAMES utf8;")

rs <- dbSendQuery(connection_oxrep_db, "SELECT * FROM Shipwrecks")

data_from_oxrep <- dbFetch(rs)

poolReturn(connection_oxrep_db)

rdata_local_dbSendQuery <- data_from_oxrep %>%
  slice(285:300) %>%
  mutate(encoding = Encoding(wreckName)) %>%
  select(encoding, wreckSite)

rdata_local_dbSendQuery
