

portfolio_ui <- function(id){
  
  # -- namespace
  ns <- NS(id)
  
  # -- return ui
  tagList(
    
    div(
      class = "mt-5",
      p("To open a project description, click the expand button in the lower right corner.", br(),
        "Use the filter below to select by project type.")),
    
    uiOutput(ns("select_project")),
    
    h2(class = "section",
       "Projects"),
    
    uiOutput(ns("project_grid")))
  
}
