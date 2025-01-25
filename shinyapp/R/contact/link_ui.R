

link_ui <- function(id){
  
  # -- namespace
  ns <- NS(id)
  
  # -- return ui
  uiOutput(ns("link_grid"))
  
}
