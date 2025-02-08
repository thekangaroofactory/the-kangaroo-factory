

portfolio_ui <- function(id){
  
  # -- namespace
  ns <- NS(id)
  
  # -- return ui
  tagList(
    
    card(
      class = "bg-contrast mt-5",
      p("To open a project description, click the expand button (lower right corner).", br(),
        "Use the filter below to select by project type.")),
    
    uiOutput(ns("select_project")),
    
    h2(class = "section",
       "Projects"),
    
    uiOutput(ns("project_grid")))
  
}
