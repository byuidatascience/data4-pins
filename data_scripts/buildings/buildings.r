devtools::install_github("hathawayj/buildings")
library(buildings)

pacman::p_load(tidyverse, fs, sf, arrow, googledrive, downloader, fs, glue, rvest, pins, connectapi)

board <- board_connect()


buildings0809 <- buildings::buildings0809
pin_write(board, buildings0809, type = "parquet", access_type = "all")
pin_name <- "buildings0809"
meta <- pin_meta(board, paste0("hathawayj/", pin_name))
client <- connect()
my_app <- content_item(client, meta$local$content_id)
set_vanity_url(my_app, paste0("data/", pin_name))



climate_zone_fips <- buildings::climate_zone_fips

climate_zone_fips <- climate_zone_fips |>
  mutate(across(where(is.character),
                ~ iconv(.x, from = "", to = "UTF-8", sub = "byte")))

pin_write(board, climate_zone_fips, type = "parquet", access_type = "all")
pin_name <- "climate_zone_fips"
meta <- pin_meta(board, paste0("hathawayj/", pin_name))
client <- connect()
my_app <- content_item(client, meta$local$content_id)
set_vanity_url(my_app, paste0("data/", pin_name))


permits <- buildings::permits

pin_write(board, permits, type = "parquet", access_type = "all")
pin_name <- "permits"
meta <- pin_meta(board, paste0("hathawayj/", pin_name))
client <- connect()
my_app <- content_item(client, meta$local$content_id)
set_vanity_url(my_app, paste0("data/", pin_name))


restaurants <- buildings::restaurants
pin_write(board, restaurants, type = "parquet", access_type = "all")
pin_name <- "restaurants"
meta <- pin_meta(board, paste0("hathawayj/", pin_name))
client <- connect()
my_app <- content_item(client, meta$local$content_id)
set_vanity_url(my_app, paste0("data/", pin_name))
