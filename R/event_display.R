# This is the test dataframe. This would be replaced once we have backend database, 
events <- data.frame(
  event_id = c(1, 2, 3),
  
  title = c(
    "Basketball Pickup",
    "Study Group",
    "Club Fundraiser"
  ),
  
  description = c(
    "Join us for a basketball game!",
    "Prepare for finals together.",
    "Come support our student club."
  ),
  
  category = c("Sports & Fitness","Academic","Social"),
  
  lat = c(34.0735, 34.0717, 34.0705),
  lng = c(-118.4520, -118.4422, -118.4445),
  
  date = as.Date(rep("2026-12-01", 3)),
  
  start_time = c("16:00", "14:00", "12:00"),
  end_time = c("18:00", "16:00", "15:00")
)

## Generate a complete popup 
create_event_popup <- function(events) {
  
  paste0(
    "<h3>", htmltools::htmlEscape(events$title), "</h3>",
    
    "<b>Category:</b> ", 
    htmltools::htmlEscape(events$category), "<br>",
    
    "<b>Date:</b> ", events$date, "<br>",
    
    "<b>Time:</b> ", events$start_time," - ", events$end_time, "<br>",
    
    "<b>Description:</b><br>",
    htmltools::htmlEscape(events$description)
  )
}

## Turn the events in Supabase to pins on map 
add_event_markers <- function(map, events) {
  
  map <- addMarkers(
    map,
    data = events,
    lng = ~lng,
    lat = ~lat,
    layerId = ~paste0("event_", event_id),
    group = "existing_events",
    label = ~title,
    popup = create_event_popup(events) ## Call the popup function we defined. 
  )
  
  return(map)
}