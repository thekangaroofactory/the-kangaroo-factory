

portfolio_ui <- function(id){
  
  # -- namespace
  ns <- NS(id)
  
  # -- return ui
  tagList(
    
    p("Browse and select a project, or use the filters below."),
    
    uiOutput(ns("select_project")),
    
    p("Maybe add some sort options and a bit of text here."),
    
    uiOutput(ns("project_grid")))
  
}
