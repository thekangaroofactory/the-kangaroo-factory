

# ------------------------------------------------------------------------------
# Module Server logic
# ------------------------------------------------------------------------------

portfolio_server <- function(id, config, parent_session) {
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

      # prepare footer actions
      # from YAML, open project details or external link
      footer_actions <- if(!is.null(project$actions)){
        
        # define helper
        build_action <- function(action){
          
          if("open" %in% names(action))
            
            # open project details
            actionLink(inputId = ns(action$open),
                       label = "open",
                       icon = icon("up-right-and-down-left-from-center"),
                       onclick = sprintf("Shiny.setInputValue('%s', '%s', {priority: 'event'})",
                                         ns("open_project"), action$open))
          
          else
            
            # external link
            div(span(icon(action$icon)), a(href = action$href, target = "_blank", action$label))
          
        }
        
        # apply helper
        lapply(project$actions, build_action)
        
      } else NULL
        
      
      # generate card
      ui <- asset_card(id = project$id,
                       title = project$title,
                       description = project$description,
                       type = project$tags,
                       icon = icon("angle-right"),
                       img = paste0("img/projects/", project$image),
                       footer = footer_actions,
                       tag = project$version)
      
      # insert UI
      insertUI(selector = "#project-placeholder",
               where = "beforeEnd",
               ui = ui)
      
    }
    
    lapply(project_mart, helper)
    
    
    # --------------------------------------------------------------------------
    # Actions
    # --------------------------------------------------------------------------
    
    observeEvent(input$open_project, {
      
      # drop tab (no matter if it already exits)
      nav_remove(id = "navbar", target = "projects-viewer", session = parent_session)
      
      # prepare ui
      nav <- nav_panel(class = "p-5",
                       value = "projects-viewer",
                       title = "Project details", 
                       
                       do.call(paste0("project_modal_", input$open_project), list()))
      
      # insert tab
      nav_insert(id = "navbar", 
                 nav = nav, 
                 target = "project", 
                 position = "after", 
                 select = TRUE, 
                 session = parent_session)
      
    })
    
  })
}
