

# ------------------------------------------------------------------------------
# Module Server logic
# ------------------------------------------------------------------------------

portfolio_server <- function(id, path, config) {
  moduleServer(id, function(input, output, session) {
    
    # -- declare objects
    ns <- session$ns
    MODULE <- paste0("[", id, "]")

    # --------------------------------------------------------------------------
    # Projects
    # --------------------------------------------------------------------------
    
    # extract from config
    project_mart <- config$projects

    # build & insert card
    helper <- function(project){
      
      # generate card
      ui <- asset_card(title = project$title,
                       description = project$description,
                       type = project$tags,
                       icon = icon("angle-right"),
                       img = paste0("img/projects/", project$image),
                       footer = tagList(span(icon("laptop")), a(href = project$`_pkgdown`, target = "_blank", "Page"),
                                        span(icon("github")), a(href = project$repository, target = "_blank", "Repository")),
                       tag = project$version)
      
      # insert UI
      insertUI(selector = "#project-placeholder",
               where = "beforeEnd",
               ui = ui)
      
    }
    
    lapply(project_mart, helper)
    
    

  
    
  })
}
