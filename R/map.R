library(leaflet)
map <- leaflet(options = leafletOptions(minZoom = 15.2))
map <- addTiles(map)
map <- htmlwidgets::onRender(map, "function(el, x) {
function makeGrayscale() {
el.querySelectorAll('.leaflet-tile').forEach(function(tile) {
tile.style.filter = 'grayscale(100%)';
});
}
makeGrayscale();
var observer = new MutationObserver(function() {
makeGrayscale();
});
observer.observe(el, {
childList: true,
subtree: true
});
}")
map <- setView(map, lng = -118.4441, lat = 34.07115, zoom = 15.4)
map <- setMaxBounds(map,
  lng1 = -118.4551,
  lat1 = 34.0590,
  lng2 = -118.4331,
  lat2 = 34.0801
)
map
