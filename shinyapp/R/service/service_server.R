

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
        p(class="subtitle", "Backed by 24 years of data experience."),
        
        div(
          class = "mt-5",
          actionButton(
            class = "gtag",
            inputId = ns("switch_contact"),
            label = "Contact me")),
        
        # -- section
        card(
          class = "border-radius bg-tkf p-3 mt-5",
          h3("Functional Services"),
          
          # -- layout
          layout_column_wrap(
            
            # -- project management
            div(
              class = "ml-5",
              h4("Data Project Management"),
              tags$ul(
                tags$li("Understand & advocate business needs"),
                tags$li("Build strategy, roadmap, budget"),
                tags$li("Converge developemnt backlog"),
                tags$li("Manage priorities & arbitrations"),
                tags$li("Organize operations & meetings"),
                tags$li("Communicate with various audiences"))),
            
            # -- data management & governance
            card(
              card_header("Specificities"),
              p("Technical-functional approach"),
              tags$ul(
                tags$li("Speak same language as both business & technical teams"),
                tags$li("Perform technical tasks if/when necessary"),
                tags$li("Team management experience"))),
            
            # -- data quality & pipelines
            card(
              card_header("Reliable systems"),
              p("Strong experience in"),
              tags$ul(
                tags$li("Data quality"),
                tags$li("Reproducible pipelines (collection, cleaning, transformation)"))))),
        
        div(
          class = "m-4",
          h3("Mentoring Services"),
          p(class = "mt-2",
            "I provide mentoring services to OpenClassrooms, on the", 
            a(href = "https://openclassrooms.com/paths/1040-data-analyst", 
              target = "_blank",
              "Data Analyst"), 
            "program.")),
        
        
        card(
          class = "border-radius bg-tkf p-3 mt-5",
          h3("Technical Services"),
          
          # -- layout
          layout_column_wrap(
            
            # -- left
            div(
              h4("Development using the R language"),
              tags$ul(
                tags$li("Data analysis & visualizations"),
                tags$li("APIs, dashboards & web applications"),
                tags$li("Packages & documentation"))),
            
            # -- apps & tools
            card(
              card_header("Best Practices"),
              p("For better quality, focus on"),
              tags$ul(
                tags$li("Architecture"),
                tags$li("Communication workflows"),
                tags$li("Documentations")))
            
          ))
        
      ) # taglist / return
      
    })
    
  })
}
