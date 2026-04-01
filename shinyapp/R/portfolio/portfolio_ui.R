

portfolio_ui <- function(id){
  
  # -- namespace
  ns <- NS(id)
  
  # -- return ui
  tagList(
    
    div(
      class = "mt-5",
      uiOutput(ns("select_project"))),
    
    div(class = "section",
        uiOutput(ns("project_grid"))))
  
}
