

# ------------------------------------------------------------------------------
# Module Server logic
# ------------------------------------------------------------------------------

portfolio_server <- function(id, user = NULL) {
  moduleServer(id, function(input, output, session) {
    
    # -- get namespace
    ns <- session$ns
    
    
    # --------------------------------------------------------------------------
    # xxx
    # --------------------------------------------------------------------------
    
    # -- Observe user
    observeEvent(user(),
                 cat("Set portfolio =", user()))
    
    
  })
}
