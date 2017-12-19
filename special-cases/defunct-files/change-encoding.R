display_main_data <- display_main_data %>%
  slice(285:300)

display_main_data %>%
  write_csv("data/exported_display_main_data.csv")

display_main_data$wreckName %>% stringi::stri_enc_detect()

display_main_data$wreckSite %>% iconv("", "ASCII") %>% Encoding()
as_utf8 <- display_main_data$wreckSite %>% iconv("ISO-8859-1") %>% Encoding()

display_main_data %>%
  mutate(encoding = Encoding(wreckName)) %>%
  select(encoding, wreckSite, everything()) %>%
  mutate(wreckSite = ifelse(encoding == "unknown", iconv(wreckSite, "ISO-8859-1"), iconv("wreckSite")))


read_csv("data/exported_display_main_data.csv") %>%
  mutate(encoding = Encoding(wreckSite)) %>%
  select(encoding, wreckSite, everything()) %>%
  mutate(wreckSite = ifelse(encoding == "unknown", iconv(wreckSite, "ISO-8859-1"), iconv(wreckSite, "UTF-8"))) %>%
  mutate(encoding = Encoding(wreckSite)) %>%
  write_csv("data/converted-to-iso8859-1.csv")

display_main_data$wreckSite == as_utf8
