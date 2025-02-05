

portfolio_ui <- function(id){
  
  # -- namespace
  ns <- NS(id)
  
  # -- return ui
  tagList(
    
    p("Browse and open a project by clicking the expand button (lower right corner), or use the filters below."),
    
    uiOutput(ns("select_project")),
    
    h2(class = "section",
       "Projects"),
    
    uiOutput(ns("project_grid")))
  
}
