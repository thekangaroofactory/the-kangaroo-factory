

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
              p("xxx")),
            
            # -- xxx
            card(
              fill = FALSE,
              card_header("Data Quality"),
              p("xxx")),
            
            # -- xxx
            card(
              fill = FALSE,
              card_header("Data Pipelines"),
              p("xxx")))),
        
        
      ) # taglist / return
      
    })
    
  })
}
