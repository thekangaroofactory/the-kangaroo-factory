

# ------------------------------------------------------------------------------
# Module Server logic
# ------------------------------------------------------------------------------

home_server <- function(id, content, parent_session) {
  moduleServer(id, function(input, output, session) {
    
    # -- get namespace
    ns <- session$ns
    
    # -- module
    MODULE <- paste0("[", id, "]")
    
    
    # --------------------------------------------------------------------------
    # Data engineering
    # --------------------------------------------------------------------------
    
    # get counts
    counts <- as.list(table(content$type))
    
    # prepare stats
    # package, project, guide, post, article
    stats <- list(list(title = "Packages", icon = "fa-solid fa-code", value = counts$package, label = "on r-universe", target = ns("stat_select")),
                  list(title = "Guides", icon = "fa-solid fa-book", value = counts$guide, label = "eBooks", target = ns("stat_select")),
                  list(title = "Projects", icon = "fa-solid fa-code", value = counts$project, label = "featured", target = ns("stat_select")),
                  list(title = "Posts", icon = "fa-solid fa-pen-to-square", value = counts$post, label = "on the blog", target = ns("stat_select")),
                  list(title = "Articles", icon = "fa-solid fa-file-lines", value = counts$article, label = "in the wiki", target = ns("stat_select")))
    
    # prepare steps
    content <- content[order(content$date, decreasing = T), ]
    steps <- build_steps(trend = head(content, 3))

    
    # --------------------------------------------------------------------------
    # Insert UI
    # --------------------------------------------------------------------------
    
    insertUI(
      selector = "#stats-placeholder",
      where = "beforeEnd",
      ui = div(
        class = "animated-fade",
        stat_ui(stats)))
    
    insertUI(
      selector = "#next-steps-placeholder",
      where = "beforeEnd",
      ui = div(
        class = "animated-fade",
        next_steps(steps)))
    
    
    # --------------------------------------------------------------------------
    # Observers
    # --------------------------------------------------------------------------
    
    observeEvent(input$stat_select, {
      
      if(input$stat_select %in% c("Packages", "Guides"))
        nav_select(id = "navbar", 
                   selected = "open-source",
                   session = parent_session)
      
      if(input$stat_select == "Projects")
        nav_select(id = "navbar", 
                   selected = "projects",
                   session = parent_session)
      
      if(input$stat_select == "Posts")
        nav_select(id = "navbar", 
                   selected = "blog",
                   session = parent_session)
      
      if(input$stat_select == "Articles")
        nav_select(id = "navbar", 
                   selected = "wiki",
                   session = parent_session)
      
    })
    
  })
}
