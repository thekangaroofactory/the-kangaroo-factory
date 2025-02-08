

# ------------------------------------------------------------------------------
# Module Server logic
# ------------------------------------------------------------------------------

service_server <- function(id, user = NULL, path, parent_session) {
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
    # Observers
    # --------------------------------------------------------------------------
    
    # -- Contact button
    observeEvent(input$switch_contact, {
                 
                 cat("Switch to contact tab \n")
                 
                 # -- Switch nav panel
                 nav_select(id = "navbar", 
                            selected = "contact",
                            session = parent_session)})
    
    
    # --------------------------------------------------------------------------
    # Outputs
    # --------------------------------------------------------------------------
    
    # -- service grid
    output$service_grid <- renderUI({
      
      # -- return tags
      tagList(
        
        h1("Technical-Functional Data Services"),
        
        p("Based on a full-stack data approach backed by 20+ years of solid data experience."),
        
        actionButton(
          class = "mt-5",
          inputId = ns("switch_contact"),
          label = "Contact me"),
        
        # -- section
        card(
          class = "border-radius bg-contrast p-3 mt-5",
          h3("Functional Services"),
          
          # -- layout
          layout_column_wrap(
            
            # -- project management
            card(
              fill = FALSE,
              card_header("Data Project Management"),
              p("Technical-functional approach"),
              tags$ul(
                tags$li("Understand & advocate business needs"),
                tags$li("Build strategy, roadmap, budget"),
                tags$li("Converge developemnt backlog"),
                tags$li("Manage priorities & arbitrations"),
                tags$li("Organize operations & meetings"),
                tags$li("Communicate with various audiences"))),
            
            # -- data management & governance
            card(
              fill = FALSE,
              card_header("Data Management & Governance"),
              p("Product Data / Lifecycle Management"),
              tags$ul(
                tags$li("Data management & lifecyle"),
                tags$li("Data exchanges"),
                tags$li("Data flow lineage"))),
            
            # -- data quality & pipelines
            card(
              fill = FALSE,
              card_header("Data Quality & Transformation"),
              p("Build reliable systems"),
              tags$ul(
                tags$li("Setup data quality strategy & indicators"),
                tags$li("Build data pipelines (collection, cleaning, transformation)"),
                tags$li("Setup automation strategies"))))),
        
        
        card(
          class = "border-radius bg-contrast p-3 mt-5",
          h3("Technical Services"),
          
          # -- layout
          layout_column_wrap(
            
            # -- analysis & visualization
            card(
              fill = FALSE,
              card_header("Data Analysis & Visualizations"),
              p("Development using the R language"),
              tags$ul(
                tags$li("Produce data analysis & reports"),
                tags$li("Data analysis mentorship"),
                tags$li("Build reproducible data visualizations"))),
        
            # -- apps & tools
            card(
              fill = FALSE,
              card_header("Tools & Apps"),
              p("Development using the R language"),
              tags$ul(
                tags$li("Scripts & APIs"),
                tags$li("Dashboards & web applications"),
                tags$li("Packages & documentation")))
            
          ))
        
      ) # taglist / return
      
    })
    
  })
}
