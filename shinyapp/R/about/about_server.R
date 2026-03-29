

# ------------------------------------------------------------------------------
# Module Server logic
# ------------------------------------------------------------------------------

about_server <- function(id, user = NULL, path) {
  moduleServer(id, function(input, output, session) {
    
    # -- get namespace
    ns <- session$ns
    
    # -- module
    MODULE <- paste0("[", id, "]")

    
    # --------------------------------------------------------------------------
    # Observers
    # --------------------------------------------------------------------------
    
    # -- user
    # path_profile <- reactive(file.path(path$data, user(), "profile"))
    
    # -- observe accordion_panel
    observeEvent(input$experience,
                 cat("Accordion =", input$experience, "\n"))
    
    
    # --------------------------------------------------------------------------
    # Outputs
    # --------------------------------------------------------------------------
    
    output$resume <- renderUI(
      
      accordion(
        open = FALSE,
        accordion_panel(
          title = "Click to expand / collapse",
          value = "resume",
          tags$iframe(style="height:800px; width:100%", src = "profile_media/Philippe_PERET_full.pdf"))))
    
    
    # -- user profile
    output$user_profile <- renderUI({
      
      # -- read user profile
      cat(MODULE, "Read user profile \n")
      user_profile <- read_profile(path_profile())
      
      # -- read user contact file
      cat(MODULE, "Build user profile \n")
      
      # -- add resource path
      addResourcePath(prefix = "profile_media", directoryPath = path_profile())
      
      # -- return
      tagList(
        
        # -- title / subtitle
        # h2("Key Takeaways"),
        
        # -- one pager
        key_takeaways(profile = user_profile, path = path$data, language = "en", full = TRUE),
        
        
        # -- Experiences
        h2(class = "section",
           "Full Resume"),
        
        # -- download
        div(
          class = "mb-5 mt-3",
          actionButton(
            inputId = ns("download"),
            class = "gtag",
            label = "download")),
        
        
        
        
        # -- Certifications & Degrees
        h2(class = "section",
           "Certifications & Degree"),
        
        card(
          class = "border-radius tkf-bg-camel p-3",
          
          layout_column_wrap(
            
            card(
              card_header("2024"),
              tags$ul(
                tags$li("Generative AI with LLMs"))),
            
            card(
              card_header("2023"),
              tags$ul(
                tags$li("AI For Good (Public Health & Climate Change)"))),
            
            card(
              card_header("2020 / 2021 (660h)"),
              tags$ul(
                tags$li("Data Science | Johns Hopkins University"),
                tags$li("Machine Learning | Stanford University"),
                tags$li("Deep Learning & MLOps | DeepLearning.AI"))),
            
            card(
              card_header("2000"),
              tags$ul(
                tags$li("Automotive Engineer | ESTACA"))))),
        
      ) # tagList
    }) # renderUI
    
  })
}
