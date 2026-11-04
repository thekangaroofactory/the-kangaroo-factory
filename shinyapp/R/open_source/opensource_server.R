

# ------------------------------------------------------------------------------
# Module Server logic
# ------------------------------------------------------------------------------

opensource_server <- function(id, parent_session) {
  moduleServer(id, function(input, output, session) {
    
    # -- get namespace
    ns <- session$ns
    
    # -- module
    MODULE <- paste0("[", id, "]")
    
    
    # --------------------------------------------------------------------------
    # Observers
    # --------------------------------------------------------------------------

    # get package info from r-universe
    package_mart <- universe::universe_all_packages(universe = "thekangaroofactory")
    
    foo <<- package_mart
    
    # --------------------------------------------------------------------------
    # Observers
    # --------------------------------------------------------------------------
    

  })
}
