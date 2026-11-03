

# ------------------------------------------------------------------------------
# Module Server logic
# ------------------------------------------------------------------------------

home_server <- function(id, parent_session) {
  moduleServer(id, function(input, output, session) {
    
    # -- get namespace
    ns <- session$ns
    
    # -- module
    MODULE <- paste0("[", id, "]")
    
    
    # --------------------------------------------------------------------------
    # Observers
    # --------------------------------------------------------------------------

    # just get package count
    nb_package <- universe::universe_ls(universe = "thekangaroofactory")
    
    stats <- list(list(title = "Packages", icon = "fa-solid fa-code", value = 4, label = "on r-universe", target = ns("stat_select")),
                  list(title = "Models", icon = "fa-solid fa-code", value = 2, label = "on kaggle"))
    
    # >> build the ui before
    
    Sys.sleep(2)
    
    removeUI(selector = "#stats-placeholder > *")
    
    insertUI(
      selector = "#stats-placeholder",
      where = "beforeEnd",
      ui = div(
        class = "animated-ui",
        stat_ui(stats)))
    
    
    # --------------------------------------------------------------------------
    # Observers
    # --------------------------------------------------------------------------
    
    observeEvent(input$stat_select, {
      
      str(input$stat_select)
      
      if(input$stat_select == "Packages")
        nav_select(id = "navbar", 
                   selected = "open-source",
                   session = parent_session)
      
    })
    
    
    
    
  })
}
