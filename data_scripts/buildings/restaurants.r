devtools::install_github("hathawayj/buildings")
library(buildings)

pacman::p_load(tidyverse, fs, sf, arrow, googledrive, downloader, fs, glue, rvest, pins, connectapi)

board <- board_connect()

restaurants <- buildings::restaurants
pin_write(board, restaurants, type = "parquet", access_type = "all")
pin_name <- "restaurants"
meta <- pin_meta(board, paste0("hathawayj/", pin_name))
client <- connect()
my_app <- content_item(client, meta$local$content_id)
set_vanity_url(my_app, paste0("data/", pin_name))