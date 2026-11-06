library(leaflet)
map <- leaflet()
map <- addTiles(map)
map <- setView(map, lng = -118.4452, lat = 34.0689, zoom = 16)
map

