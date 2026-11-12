library(leaflet)
map <- leaflet(options = leafletOptions(minZoom = 15.2))
map <- addTiles(map)
map <- setView(map, lng = -118.4441, lat = 34.07115, zoom = 15.4)
map <- setMaxBounds(map,
  lng1 = -118.4551,
  lat1 = 34.0590,
  lng2 = -118.4331,
  lat2 = 34.0801
)
map
