library("tidyverse")

unknown_encoding_csv <- read_csv("data-raw/unknown-encoded-data.csv")

unknown_encoding_csv %>%
  mutate(encoding = Encoding(raw)) %>%
  mutate(unknown = if_else(encoding == "unknown", TRUE, FALSE)) %>%
  write_csv("data/unknown-encoded-data.csv")

forced_ISO_8859_1 <- read_csv("data-raw/unknown-encoded-data.csv", locale = locale(encoding = "ISO-8859-1"))

forced_ISO_8859_1 %>%
  mutate(encoding = Encoding(raw)) %>%
  count(encoding)


forced_utf_16 <- read_csv("data-raw/unknown-encoded-data.csv", locale = locale(encoding = "UTF-16"))

forced_ISO_8859_1 %>%
  mutate(encoding = Encoding(raw)) %>%
  count(encoding)


unknown_encoding_csv$raw %>%
  stringi::stri_trans_general("UTF-16")

unknown_encoding_csv %>%
  mutate(utf.16 = Encoding(raw))