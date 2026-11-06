

# ------------------------------------------------------------------------------
# This is the server logic of the Shiny web application.
# ------------------------------------------------------------------------------

# -- Define server logic
function(input, output, session) {
  
  cat("Starting main application server... \n")
  
  # -- Declare objects
  query_string <- reactiveVal()
  init_lab <- reactiveVal()

  # -- log session end
  session$onSessionEnded(function(){
    ktag(who = session$token, what = "close_session")
  })
  
  
  # ----------------------------------------------------------------------------
  # Get data
  # ----------------------------------------------------------------------------
  
  # read YAML config
  config <- yaml::read_yaml(file = file.path(Sys.getenv("DATA_HOME"), "_tkf.yml"))
  
  # get packages from R-universe API
  shinyjs::html(id = "loader-label", html = "Fetching external data from R-universe API")
  package_mart <- universe::universe_all_packages(universe = "thekangaroofactory")
  
  # get RSS feeds
  shinyjs::html(id = "loader-label", html = "Fetching external data from blog RSS feed")
  blog_mart <- tidyRSS::tidyfeed(feed = "https://thekangaroofactory.github.io/the-kangaroo-factory-blog/index.xml", list = TRUE, clean_tags = FALSE)
  shinyjs::html(id = "loader-label", html = "Fetching external data from wiki RSS feed")
  wiki_mart <- tidyRSS::tidyfeed(feed = "https://thekangaroofactory.github.io/the-kangaroo-factory-wiki/index.xml", list = TRUE, clean_tags = FALSE)
  
  # compute counts
  counts <- list(package = length(package_mart), 
                 project = length(config$projects), 
                 guide = length(config$opensource$guides), 
                 post = nrow(blog_mart$entries), 
                 article = nrow(wiki_mart$entries))
  
  # ----------------------------------------------------------------------------
  # Call modules
  # ----------------------------------------------------------------------------

  # home
  home_server(id = "home", counts, session)
  
  # open source
  opensource_server(id = "opensource", config, mart = package_mart)
  
  # -- portfolio
  portfolio_server(id = "portfolio", path = file.path(Sys.getenv("DATA_HOME"), "philippeperet/portfolio"), config)
  
  # -- lab
  lab_server(id = "lab", path = Sys.getenv("DATA_HOME"), init_lab)
  
  # blog & wiki
  rss_server(id = "blog", mart = blog_mart, session)
  rss_server(id = "wiki", mart = wiki_mart , session)
  
  
  # ----------------------------------------------------------------------------
  # Analytics
  # ----------------------------------------------------------------------------

  observeEvent(input$ktag_event, 
               ktag(when = input$ktag_event$when, what = input$ktag_event$what, who = session$token))
  
  # -- download
  output$download_ktag <- downloadHandler(
    filename = function() {
      paste("ktag-", Sys.Date(), ".csv", sep = "")
    },
    content = function(file) {
      write.csv(read.csv(file.path(Sys.getenv("DATA_HOME"), "ktag.csv"), row.names = NULL), file)
    }
  )
  
  
  # -- download lab stats
  output$download_lab <- downloadHandler(
    filename = function() {
      paste("lab-", Sys.Date(), ".csv", sep = "")
    },
    content = function(file) {
      write.csv(read.csv(file.path(Sys.getenv("DATA_HOME"), "/spy/spy_items.csv"), row.names = NULL), file)
    }
  )
  
  
  # ----------------------------------------------------------------------------
  # URL Query String
  # ----------------------------------------------------------------------------
  
  # -- Observe url search string (once!)
  # because query string will be updated on tab change
  observe({

    # -- log session
    ktag(who = session$token, what = "init_session", how = session$clientData$url_search)
    url_parameters <- getQueryString()
        
    if(length(url_parameters)){
      
      # -- store to pass to tab
      query_string(url_parameters)
      
      # -- admin hack
      if("admin" %in% names(url_parameters))
          nav_insert(
            id = "navbar",
            nav = nav_panel(class = "p-5",
                            value = "admin",
                            title = "Admin",
                            p("This is the admin tab."),
                            downloadButton("download_ktag", "Download ktag"),
                            downloadButton("download_lab", "Download lab")),
            target = "about",
            position = "after",
            select = FALSE,
            session = session)

      if("nav" %in% names(url_parameters))
        nav_select(id = "navbar", selected = url_parameters$nav)}
    
  }) |> bindEvent(session$clientData$url_search, once = TRUE)
  
  
  # ----------------------------------------------------------------------------
  # Navigation
  # ----------------------------------------------------------------------------
  
  # -- Observe active tab
  observeEvent(input$navbar, {
    
    ktag(who = session$token, what = "select_tab", how = input$navbar)
    updateQueryString(paste0("?nav=", input$navbar))

    # -- init lab (see lab_server())
    if(input$navbar == "lab")
      init_lab(1)
    
  }, ignoreInit = TRUE)
  
  
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
