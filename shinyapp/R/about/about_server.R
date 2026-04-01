

# ------------------------------------------------------------------------------
# Module Server logic
# ------------------------------------------------------------------------------

about_server <- function(id, path) {
  moduleServer(id, function(input, output, session) {
    
    # -- get namespace
    ns <- session$ns
    
    # -- module
    MODULE <- paste0("[", id, "]")
    
    
    # --------------------------------------------------------------------------
    # Observers
    # --------------------------------------------------------------------------

    # -- observe accordion_panel
    observeEvent(input$acc_resume,
                 ktag(who = session$token, what = "about-expand_resume"))
    
    
    # --------------------------------------------------------------------------
    # Outputs
    # --------------------------------------------------------------------------
    
    output$resume <- renderUI({
      
      # -- declare resource path
      addResourcePath(prefix = "profile_media", directoryPath = path)
      
      accordion(
        id = ns("acc_resume"),
        open = FALSE,
        accordion_panel(
          title = "Click to expand / collapse",
          value = "resume",
          tags$iframe(style="height:800px; width:100%", src = "profile_media/Philippe_PERET_full.pdf")))
      
    })
    
  })
}
