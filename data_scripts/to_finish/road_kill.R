pacman::p_load(tidyverse, pins, connectapi, googledrive)

# Download the file from google drive
sdrive <- shared_drive_find("byuids_data") # This will ask for authentication.
google_file <- drive_ls(sdrive) |>
  filter(stringr::str_detect(name, "Roadkill"))
tempf <- tempfile()
drive_download(google_file, tempf)
roadkill <-  read_csv(tempf) |>
  mutate(
    observed = lubridate::ymd_hms(observed),
    reported = lubridate::ymd_hms(reported),
    gmu = as.integer(gmu)
  )

count(roadkill, species) |> arrange(desc(n))

top5 <- c("Mule Deer (Odocoileus hemionus)", "White-tailed Deer (Odocoileus virginianus)", "Elk (Cervus canadensis)",
"Moose (Alces americanus)", "Deer (Odocoileus)", "Domestic Cat (Felis catus)")

roadkill |>
  mutate(
    observed_month = month(observed),
    observed_year = year(observed)) |>
  filter(observed_year %in% 2015:2024) |>
  filter(species %in% top5) |>
  count(species, observed_year, observed_month, name = "kills") |>
  ggplot(aes(x = observed_month, y = kills,
    color = factor(observed_year), shape = species)) +
  geom_point() +
  geom_line()
