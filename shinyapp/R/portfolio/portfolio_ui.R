

portfolio_ui <- function(id){
  
  # -- namespace
  ns <- NS(id)
  
  # -- return ui
  tagList(
    
    div(
      class = "mt-5",
      p("Use the filter below to filter by project type.")),
    
    uiOutput(ns("select_project")),
    
    div(class = "section",
        uiOutput(ns("project_grid"))))
  
}
