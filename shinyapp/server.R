

# ------------------------------------------------------------------------------
# This is the server logic of the Shiny web application.
# ------------------------------------------------------------------------------

# -- Define server logic
function(input, output, session) {
  
  # -- Check DEBUG mode
  if(DEBUG)
    cat("[i] DEBUG mode is ON \n")
  
  
  # -- Declare objects
  user <- reactiveVal("philippeperet")
  
  
  # ----------------------------------------------------------------------------
  # Call modules
  # ----------------------------------------------------------------------------

  # -- portfolio
  portfolio_server(id = "portfolio", user, path)
  
  # -- profile
  profile_server(id = "profile", user, path)
  
  # -- contact
  contact_server(id = "contact", user, path)
  
  # -- stack
  stack_server(id = "stack", user, path)
  
  
  # ----------------------------------------------------------------------------
  # Manage user
  # ----------------------------------------------------------------------------
  
  # -- Observe url search string (set user)
  observe({
    
    # -- Check for non empty string
    if(session$clientData$url_search != ''){
      
      # -- Get url search key / value
      cat("New url search =", session$clientData$url_search, "\n")
      url_search <- substring(session$clientData$url_search, first = 2)
      url_search <- unlist(strsplit(url_search, "="))
      
      # -- Update user
      if(url_search[1] == "portfolio")
        (url_search[2])}
    
  }) |>
    
    bindEvent(session$clientData$url_search)
  
  
}
