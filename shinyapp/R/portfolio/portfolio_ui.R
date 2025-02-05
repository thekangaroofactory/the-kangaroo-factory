

portfolio_ui <- function(id){
  
  # -- namespace
  ns <- NS(id)
  
  # -- return ui
  tagList(
    
    card(
      class = "bg-contrast mt-5",
      p("Browse and open a project by clicking the expand button (lower right corner), or use the filter below.")),
    
    uiOutput(ns("select_project")),
    
    h2(class = "section",
       "Projects"),
    
    uiOutput(ns("project_grid")))
  
}
