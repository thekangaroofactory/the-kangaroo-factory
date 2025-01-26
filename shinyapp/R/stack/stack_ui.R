

stack_ui <- function(id){
  
  # -- namespace
  ns <- NS(id)
  
  # -- return ui
  uiOutput(ns("stack_grid"))
  
}
