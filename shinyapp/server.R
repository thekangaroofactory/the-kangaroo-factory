

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
  query_string <- reactiveVal()
  
  
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
  # URL Query String
  # ----------------------------------------------------------------------------
  
  # -- Observe url search string (once!)
  # because query string will be updated on tab change
  observe({
    
    url_parameters <- getQueryString()
    
    if(length(url_parameters)){
      
      # -- store to pass to tab
      query_string(url_parameters)
      
      if("nav" %in% names(url_parameters))
        nav_select(id = "navbar", selected = url_parameters$nav)
      
    }
    
  }) |> bindEvent(session$clientData$url_search, once = TRUE)
  
  
  # ----------------------------------------------------------------------------
  # Navigation
  # ----------------------------------------------------------------------------
  
  # -- Observe active tab
  observeEvent(input$navbar, {
    
    cat("Active tab =", input$navbar, "\n")
    updateQueryString(paste0("?nav=", input$navbar))

  }, ignoreInit = TRUE)
  
  
  # ----------------------------------------------------------------------------
  # Blog
  # ----------------------------------------------------------------------------
  
  output$blog_ui <- renderUI({
  
    url_base <- "https://thekangaroofactory.github.io/the-kangaroo-factory-blog"
    
    # -- check url query string
    url <- if("post" %in% names(query_string()))
        paste(url_base, "posts", query_string()$post, sep = "/")
    else url_base
    
    # -- return
    tags$iframe(
      id = "blog",
      class = "blog",
      src = url,
      scrolling = 'yes')
    
  })
  
  
  # ----------------------------------------------------------------------------
  # Wiki
  # ----------------------------------------------------------------------------
  
  output$wiki_ui <- renderUI({
    
    url_base <- "https://thekangaroofactory.github.io/the-kangaroo-factory-wiki"
    
    # -- check url query string
    url <- if("cat" %in% names(query_string()))
      paste(url_base, "articles", query_string()$cat, paste0(query_string()$article, ".html"), sep = "/")
    else url_base
    
    # -- return
    tags$iframe(
      class = "blog",
      src = url,
      scrolling = 'yes')
    
  })
  
}
