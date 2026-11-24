server <- function(input, output, session) {
  selected_location <- reactiveVal(NULL)

  output$ucla_map <- renderLeaflet({
    add_event_markers(map,events)
  })

  output$preview <- renderText({
    paste("Your event:", input$event_title)   ## server reads the current value
  })

  ## Create a new event pin 
  observeEvent(input$ucla_map_click, {
    
  click <- input$ucla_map_click ## Get the clicked location

    selected_location(click)

    ##Create a red pin icon.
    pin_icon <- makeAwesomeIcon(
      icon = "circle",
      library = "fa",
      markerColor = "red",
      iconColor = "darkred"
    )

    ## Update the map.
    leafletProxy("ucla_map") |>
      clearGroup("draft_pin") |>
      addAwesomeMarkers(
        lng = click$lng,
        lat = click$lat,
        icon = pin_icon,
        group = "draft_pin",
        popup = "What are you planning here?"
      )
  })

  ## Identify the existing events
  observeEvent(input$ucla_map_marker_click,{
    click<-input$ucla_map_marker_click
    
    if(is.null(click$id)){
      return()
    }
    selected_event<-events[paste0("event_", events$event_id) == click$id,]
    print (selected_event)
  })
  
  output$selected_location <- renderText({
    loc <- selected_location()
    if (is.null(loc)) {
      return("Click anywhere on the map.")
    }
    sprintf("Latitude: %.5f, Longitude: %.5f",loc$lat,loc$lng)
  })
  
  ## Submit Event
  observeEvent(input$submit_event, {
    ## Check validity: The event title should not be empty
    title<- trimws(input$event_title)
    if (!nzchar(title)) {
      showNotification(
        "Please enter an event.",
        type = "error"
      )
      return()
    }

    ## Check validity: Date should not be empty
    if (is.null(input$event_date) ||
        is.na(input$event_date)) {
      showNotification(
        "Please select a date.",
        type = "error"
      )
      return()
    }

    ## Check validity: End time is later than start time
    if (input$event_end <= input$event_start) {
      showNotification(
        "End time must be after start time.",
        type = "error"
      )
      return()
    }

    showNotification(
      paste(
        "Valid event:",
        title,
        "| Type:", input$event_category,
        "| Date:", input$event_date,
        "| Time:", input$event_start,
        "-", input$event_end
      ),
      type = "message",
      duration = 8
    )
  })
}
