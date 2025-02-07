

# ------------------------------------------------------------------------------
# Module Server logic
# ------------------------------------------------------------------------------

profile_server <- function(id, user = NULL, path) {
  moduleServer(id, function(input, output, session) {
    
    # -- get namespace
    ns <- session$ns
    
    # -- module
    MODULE <- paste0("[", id, "]")
    
    # -- declare objects
    path_profile <- reactiveVal(NULL)
    
    
    # --------------------------------------------------------------------------
    # Observers
    # --------------------------------------------------------------------------
    
    # -- Observe user
    observeEvent(user(), {
      
      cat(MODULE, "Set user =", user(), "\n")
      
      # -- set path
      path_profile(file.path(path$data, user(), "profile"))
      
    })
    
    
    # -- observe accordion_panel
    observeEvent(input$experience,
                 cat("Accordion =", input$experience, "\n"), ignoreInit = F, ignoreNULL = F)

    
    # -- observe downloadButton
    output$download_resume <- downloadHandler(

      # -- build file name
      filename = function() {
        paste0(ifelse(input$resume_privacy, "Philippe_", "Philippe_PERET_"), input$resume_type, ".pdf")},
      
      # -- build content
      content = function(con) {
        
        cat(MODULE, "Prepare document to download \n")
        cat(MODULE, "-- type = ", input$resume_type, "\n")
        cat(MODULE, "-- privacy = ", input$resume_privacy, "\n")
        
        # -- build url
        target_file <- paste0(ifelse(input$resume_privacy, "Philippe_", "Philippe_PERET_"), input$resume_type, ".pdf")
        target_file <- file.path("../data/philippeperet/profile", target_file)
        
        # -- copy file to tmp con
        file.copy(target_file, con)})
    
    
    # -- observe download button
    observeEvent(input$download,
                 
                 # -- display modal
                 showModal(
                   modalDialog(
                     
                     # -- options
                     title = "Download",
                     easyClose = T,
                     
                     # -- content
                     download_ui(ns),
                     
                     # -- footer
                     footer = tagList(
                       modalButton("Close"),
                       downloadButton(
                         outputId = ns("download_resume"),
                         label = "Download")))))
    
    
    # --------------------------------------------------------------------------
    # Outputs
    # --------------------------------------------------------------------------
    
    # -- user profile
    output$user_profile <- renderUI({
      
      # -- read user contact file
      cat(MODULE, "Build user profile \n")
      
      # -- return
      tagList(
        
        # -- title / subtitle
        profile_title(),
        
        # -- download
        div(
          class = "mb-5",
          actionButton(inputId = ns("download"),
                       label = "download")),
        
        # -- one pager
        one_pager(path$data),
        
        
        # -- Experiences
        h2(class = "section",
           "Experiences"),
        
        p(class = "mb-5",
          "Click on the titles to expand / collapse experience sections."),
        
        accordion(
          id = ns("experience"),
          
          # -- GEODIS
          accordion_panel(
            title = "GEODIS | CSR Data Project Manager",
            value = "exp_geodis",
            experience_geodis()),
          
          # -- Freelance
          accordion_panel(
            title = "Freelance | Technical Data Expert",
            value = "exp_freelance",
            experience_freelance()),
          
          # -- DS QA
          accordion_panel(
            title = "Dassault Systèmes | QA Leader, Senior Manager",
            value = "exp_ds_qa",
            experience_ds_qa()),
          
          # -- DS Support
          accordion_panel(
            title = "Dassault Systèmes | L2 Technical Support, Engineer & Manager",
            value = "exp_ds_support",
            experience_ds_support())),
        
        
        # -- Certifications & Degrees
        h2(class = "section",
           "Certifications & Degree"),
        
        card(
          class = "border-radius bg-contrast p-3",
          
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
