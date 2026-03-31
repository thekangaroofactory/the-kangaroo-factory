

# ------------------------------------------------------------------------------
# This is the server logic of the Shiny web application.
# ------------------------------------------------------------------------------

# -- Define server logic
function(input, output, session) {
  
  cat("Starting main application server... \n")
  
  # -- Check DEBUG mode
  if(DEBUG)
    cat("[i] DEBUG mode is ON \n")
  
  # -- Declare objects
  query_string <- reactiveVal()
  init_lab <- reactiveVal()
  
  
  # ----------------------------------------------------------------------------
  # Call modules
  # ----------------------------------------------------------------------------

  # -- portfolio
  portfolio_server(id = "portfolio", path = file.path(path$data, "philippeperet/portfolio"))
  
  # -- lab
  lab_server(id = "lab", path = path$data, init_lab)
  
  # -- service
  service_server(id = "service", session)
  
  # -- about
  about_server(id = "me", path = file.path(path$data, "philippeperet/profile"))
  
  # -- contact
  contact_server(id = "contact", path = file.path(path$data, "philippeperet/contact"))
  
  
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

    # -- init lab (see lab_server())
    if(input$navbar == "lab")
      init_lab(1)
    
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
  
  
  # ----------------------------------------------------------------------------
  # Legal notice
  # ----------------------------------------------------------------------------
  
  observeEvent(input$legal_notice,
               
               showModal(
                 modalDialog(
                   title = "Legal notice",
                   easyClose = TRUE,
                   
                   tags$img(class = "mb-3", src = "./img/favicon_196x196.png", alt = "Icon"),
                   
                   h4("Owner"),
                   p("This website and its domain name are the property of:"),
                   tags$ul(
                     tags$li("Company name: Philippe PERET EI"),
                     tags$li("SIREN: 909 200 925"),
                     tags$li("Email: philippe.peret@hotmail.com")),
                   
                   h4("Editorial Manager"),
                   p("Philippe PERET EI"),
                   
                   h4("Host"),
                   p("This website is hosted by Posit Software, PBC |", tags$a(href = "https://connect.posit.cloud/", target = "_blank", "https://connect.posit.cloud/")),
                   
                   h4("Development"),
                   p("Philippe PERET EI"))))
  
}
