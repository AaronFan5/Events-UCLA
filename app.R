library(shiny)
library(bslib)
library(shinyWidgets)
library(leaflet)
library(leaflet.extras)
library(htmltools)
library(DBI)
library(RPostgres)
library(pool)
library(lubridate)
library(dplyr)


source("R/map.R")
source("R/UI.R")
source("R/server.R")

shinyApp(ui = ui, server = server)
