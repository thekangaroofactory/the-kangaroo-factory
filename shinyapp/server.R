

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
  # Get data & compute id (for html)
  # ----------------------------------------------------------------------------
  
  # read YAML config
  config <- yaml::read_yaml(file = file.path(Sys.getenv("DATA_HOME"), "_tkf.yml"))
  config <- asset_ids(config)
  
  # get packages from R-universe API
  shinyjs::html(id = "loader-label", html = "Fetching data from R-universe API")
  package_mart <- universe::universe_all_packages(universe = "thekangaroofactory")
  package_mart <- lapply(seq_along(package_mart), \(idx) c(package_mart[[idx]], list(id = paste("package", idx, sep = "-"))))
  
  # get RSS feeds
  shinyjs::html(id = "loader-label", html = "Fetching data from blog RSS feed")
  blog_mart <- tidyRSS::tidyfeed(feed = "https://thekangaroofactory.github.io/the-kangaroo-factory-blog/index.xml", list = TRUE, clean_tags = FALSE)
  blog_mart$entries$id <- paste("post", 1:nrow(blog_mart$entries), sep = "-")
  
  shinyjs::html(id = "loader-label", html = "Fetching data from wiki RSS feed")
  wiki_mart <- tidyRSS::tidyfeed(feed = "https://thekangaroofactory.github.io/the-kangaroo-factory-wiki/index.xml", list = TRUE, clean_tags = FALSE)
  wiki_mart$entries$id <- paste("article", 1:nrow(wiki_mart$entries), sep = "-")
  
  # drop loader
  removeUI(selector = "#stats-placeholder > *", immediate = TRUE)
  
  
  # ----------------------------------------------------------------------------
  # Compute stats
  # ----------------------------------------------------------------------------
  
  # update bot message
  session$sendCustomMessage(
    type = "type_bot_message", 
    message = list(text = "Computing things to do."))

  # build content df
  content <- build_content(config, package_mart, blog_mart, wiki_mart)
  
  # update bot message
  session$sendCustomMessage(
    type = "type_bot_message", 
    message = list(text = "Let's jump in!"))
  
  
  # ----------------------------------------------------------------------------
  # Call modules
  # ----------------------------------------------------------------------------
  
  # open source
  opensource_server(id = "opensource", config, package_mart, session)
  
  # portfolio / projects
  portfolio_server(id = "portfolio", config, session)
  
  # -- lab
  lab_server(id = "lab", path = Sys.getenv("DATA_HOME"), init_lab, session)
  
  # blog & wiki
  rss_server(id = "blog", mart = blog_mart, session)
  rss_server(id = "wiki", mart = wiki_mart , session)
  
  # home
  # keep last once everything is loaded
  home_server(id = "home", content, session)
  
  
  # ----------------------------------------------------------------------------
  # Insert links
  # ----------------------------------------------------------------------------
  
  # linkedin
  nav_insert(
    id = "navbar",
    nav = nav_item(
      a(id = "linkedin",
        class = "external-link nav-link ktag",
        href = config$linkedin,
        target = "_blank",
        icon("linkedin", class = "fa-xl"))),
    position = "after")
  
  # github
  nav_insert(
    id = "navbar",
    nav = nav_item(
      a(id = "github",
        class = "external-link nav-link ktag",
        href = config$github,
        target = "_blank",
        icon("github", class = "fa-xl"))))
  
  # youtube
  nav_insert(
    id = "navbar",
    nav = nav_item(
      a(id = "youtube",
        class = "external-link nav-link",
        href = config$youtube,
        target = "_blank",
        icon("youtube", class = "fa-xl"))))
  
  # mastodon
  nav_insert(
    id = "navbar",
    nav = nav_item(
      a(id = "mastodon",
        class = "external-link nav-link",
        href = config$mastodon,
        target = "_blank",
        icon("mastodon", class = "fa-xl"))))
  
  
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
  

  # -- close tab
  observeEvent(input$close_tab, {
    
    # select tab
    # when pattern is foo-viewer, foo will be selected
    target <- unlist(strsplit(input$close_tab, split = "-"))
    if(length(target) == 2 && target[[2]] == "viewer")
      nav_select(id = "navbar", selected = target[[1]])
    
    # close tab
    nav_remove(id = "navbar", target = input$close_tab)
    
  })
  
  
  # -- jump from next step item
  observeEvent(input$jump_action, {
    
    # input is expecting list(nav = "foo", id = "bar")
    if(!is.list(input$jump_action))
      warning("Input jump_action is expecting a list(nav = 'foo', id = 'bar')", call. = F)
    
    # activate tab
    nav_select(id = "navbar", 
               selected = ifelse(input$jump_action$nav %in% c("package", "guide"), 
                                 "open-source", 
                                 input$jump_action$nav))
    
    # wait 100ms for the tab to be displayed, then scroll to the #
    if(input$jump_action$id != "#")
      session$sendCustomMessage(type = "scroll_to_tag",
                                list(id = input$jump_action$id, delay = 100))
    
  })
  
  
  # ----------------------------------------------------------------------------
  # Legal notice
  # ----------------------------------------------------------------------------
  
  observeEvent(input$legal_notice, {
    
    # display modal
    custom_modal_show(
      div(
        class = "legal-notice",
        
        tags$img(src = "./img/favicon_196x196.png", alt = "Icon"),
        
        h4("Owner"),
        p("This website and its domain name are the property of:"),
        tags$ul(
          tags$li("Company name: Philippe PERET EI"),
          tags$li("SIREN: 909 200 925"),
          tags$li("Email: philippe.peret@hotmail.com")),
        
        h4("Editorial Manager"),
        p("Philippe PERET EI"),
        
        h4("Host"),
        p("This website is hosted by Posit Software, PBC |", a(href = "https://connect.posit.cloud/", target = "_blank", "https://connect.posit.cloud/")),
        
        h4("Development"),
        p("Philippe PERET EI")))
    
  })
  
}
