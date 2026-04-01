

# ------------------------------------------------------------------------------
# Module Server logic
# ------------------------------------------------------------------------------

service_server <- function(id, parent_session) {
  moduleServer(id, function(input, output, session) {
    
    # -- get namespace
    ns <- session$ns
    
    # -- module
    MODULE <- paste0("[", id, "]")
    
    
    # --------------------------------------------------------------------------
    # Observers
    # --------------------------------------------------------------------------
    
    # -- Contact button
    observeEvent(input$switch_contact, {
      
      # -- Switch nav panel
      nav_select(id = "navbar", 
                 selected = "contact",
                 session = parent_session)})
    
    # -- projects button
    observeEvent(input$switch_project, {
      
      # -- Switch nav panel
      nav_select(id = "navbar", 
                 selected = "projects",
                 session = parent_session)})
    
    # -- blog button
    observeEvent(input$switch_blog, {
      
      # -- Switch nav panel
      nav_select(id = "navbar", 
                 selected = "blog",
                 session = parent_session)})
    
    # -- blog button
    observeEvent(input$switch_wiki, {
      
      # -- Switch nav panel
      nav_select(id = "navbar", 
                 selected = "wiki",
                 session = parent_session)})
    
    # -- lab button
    observeEvent(input$switch_lab, {
      
      # -- Switch nav panel
      nav_select(id = "navbar", 
                 selected = "lab",
                 session = parent_session)})
    
  })
}
