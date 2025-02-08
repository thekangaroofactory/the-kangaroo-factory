

# ------------------------------------------------------------------------------
# Module Server logic
# ------------------------------------------------------------------------------

service_server <- function(id, user = NULL, path) {
  moduleServer(id, function(input, output, session) {
    
    # -- get namespace
    ns <- session$ns
    
    # -- module
    MODULE <- paste0("[", id, "]")
    
    # -- declare objects
    path_stack <- reactiveVal(NULL)
    
    
    # --------------------------------------------------------------------------
    # User
    # --------------------------------------------------------------------------
    
    # -- Observe user
    observeEvent(user(), {
      
      cat(MODULE, "Set user =", user(), "\n")
      
      # -- set path
      path_stack(file.path(path$data, user(), "stack"))
      
    })
    
    
    # --------------------------------------------------------------------------
    # Outputs
    # --------------------------------------------------------------------------
    
    # -- service grid
    output$service_grid <- renderUI({
      
      # -- return tags
      tagList(
        
        h1("Services"),
        
        # -- key figures
        card(
          class = "border-radius bg-contrast p-3 mt-5",
          h3("Data Services"),
          
          # -- layout
          layout_column_wrap(
            
            # -- xxx
            card(
              fill = FALSE,
              card_header("Project Management"),
              p("Project Management dedicated to data driven applications..."),
              tags$ul(
                tags$li("Understand & advocate business needs"),
                tags$li("Collect data"))),
            
            # -- xxx
            card(
              fill = FALSE,
              card_header("Data Management & Governance"),
              p("xxx"),
              tags$ul(
                tags$li(""),
                tags$li("Data flow lineage"))),
            
            # -- xxx
            card(
              fill = FALSE,
              card_header("Data Quality & Transformation"),
              p("xxx"),
              tags$ul(
                tags$li("Understand & advocate business needs"),
                tags$li("Collect data"))),
            
            # -- xxx
            card(
              fill = FALSE,
              card_header("Data Analysis & Visualization"),
              p("xxx"),
              tags$ul(
                tags$li("Produce data analysis & reports"),
                tags$li("Build reproducinle data visualizations"),
                tags$li("Design & develop dashboards"))),
            
            # -- xxx
            card(
              fill = FALSE,
              card_header("R"),
              p("Development using the R language"),
              tags$ul(
                tags$li("Scripts"),
                tags$li("Dashboards & web applications"),
                tags$li("Packages & documentation")))
            
          ))
        
      ) # taglist / return
      
    })
    
  })
}
