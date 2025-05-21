library(leaflet)
source("R/world_wonders_data.R")
source("R/create_wonders_map.R")


wonders <- world_wonders_data()


map <- create_wonders_map(wonders)
map
