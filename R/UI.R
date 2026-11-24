time_choices<-sprintf("%02d:00", 0:23)

ui <- fluidPage(

  titlePanel("Events @ UCLA"),

  sidebarLayout(

    sidebarPanel(
      h3("Submit an Event"),
      textOutput("preview"), ## Display the result

      h4("Selected Location"),
      textOutput("selected_location"),

      ## Event Name
      textInput("event_title", "Event Title"),

      ## Event Description
      textAreaInput("event_description","Description",rows=3),

      ## Category
      selectInput("event_category","Type",choices=c("Academic","Social","Sports & Fitness","Arts & Entertainment","Culture & Identity", "Health & Wellbeing", "Religious","Others")),

      ## Date and Time
      dateInput("event_date","Date"),
      selectInput("event_start","Starts",choices=time_choices, selected=format(Sys.time(), "%H:00")),
      selectInput("event_end","Ends",choices=time_choices, selected=format(Sys.time(), "%H:00")),

      ## Add a Button to Submit Event
      actionButton("submit_event","Submit Event")
    ),

    mainPanel(
      leafletOutput("ucla_map", height = 600)
    )
  )
)


