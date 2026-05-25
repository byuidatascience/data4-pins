devtools::install_github("hathawayj/buildings")
library(buildings)

pacman::p_load(tidyverse, fs, sf, arrow, googledrive, downloader, fs, glue, rvest, pins, connectapi)

board <- board_connect()

permits <- buildings::permits

pin_write(board, permits, type = "parquet", access_type = "all")
pin_name <- "permits"
meta <- pin_meta(board, paste0("hathawayj/", pin_name))
client <- connect()
my_app <- content_item(client, meta$local$content_id)
set_vanity_url(my_app, paste0("data/", pin_name))