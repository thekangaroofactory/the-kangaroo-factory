

service_ui <- function(id){
  
  # -- namespace
  ns <- NS(id)
  
  # -- return ui
  uiOutput(ns("service_grid"))
  
}
