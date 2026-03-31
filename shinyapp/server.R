

# ------------------------------------------------------------------------------
# This is the server logic of the Shiny web application.
# ------------------------------------------------------------------------------

# -- Define server logic
function(input, output, session) {
  
  cat("Starting application server... \n")
  
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
  
  # -- lab
  lab_server(id = "lab", user, path)
  
  # -- service
  service_server(id = "service", user, path, session)
  
  # -- profile
  # profile_server(id = "profile", user, path)
  about_server(id = "me", user, path)
  
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
      url_search <- unlist(strsplit(url_search, "&"))
      url_search <- strsplit(url_search, "=")
      url_parameters <- lapply(url_search, function(x) x[2])
      names(url_parameters) <- lapply(url_search, function(x) x[1])
      
      # -- user
      if("portfolio" %in% names(url_parameters))
        user(url_parameters$portfolio)
      
      # -- nav
      if("nav" %in% names(url_parameters))
        nav_select(id = "navbar", selected = url_parameters$nav)}
    
  }) |>
    
    bindEvent(session$clientData$url_search)
  
  
  # ----------------------------------------------------------------------------
  # Observe
  # ----------------------------------------------------------------------------
  
  # -- Observe active nav_panel
  observeEvent(input$navbar,
               cat("Active tab =", input$navbar, "\n"))
  
  
  # ----------------------------------------------------------------------------
  # Blog
  # ----------------------------------------------------------------------------
  
  output$blog_ui <- renderUI({
  
    url_base <- "https://thekangaroofactory.github.io/the-kangaroo-factory-blog"
    url <- paste(url_base, "posts", "package-is-project", sep = "/")
    
    # -- return
    tags$iframe(
      class = "blog",
      src = url,
      scrolling = 'yes')
    
  })
  
  
  # ----------------------------------------------------------------------------
  # Wiki
  # ----------------------------------------------------------------------------
  
  output$wiki_ui <- renderUI({
    
    url_base <- "https://thekangaroofactory.github.io/the-kangaroo-factory-wiki"
    url <- paste(url_base, "articles", "bslib/customize_bslib_backgrounds.html", sep = "/")
    
    # -- return
    tags$iframe(
      class = "blog",
      src = url,
      scrolling = 'yes')
    
  })
  
}
