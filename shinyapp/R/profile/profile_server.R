

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
    
    user <- list(firstname = "philippe",
                 lastname = "peret")

    
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
                 cat("Accordion =", input$experience, "\n"))

    
    # --------------------------------------------------------------------------
    # Manage Download
    # --------------------------------------------------------------------------
    
    # -- display download ui (modal)
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
                         "data-value" = "confirm_download",
                         class = "gtag",
                         outputId = ns("download_resume"),
                         label = "Download")))))
    
    
    # -- generate resume
    observeEvent(input$generate_resume, {
      
      cat(MODULE, "Generate document preview \n")
      cat("resume_type = ", input$resume_type, "\n")
      if(!is.null(input$resume_options))
        cat("resume_options = ", input$resume_options, "\n")
      
      # -- call quarto
      tryCatch(
        
        # -- expr to try
        {
          
          cat("[START] Render quarto document to html... \n")
          
          # -- generate html
          quarto::quarto_render(input = file.path(path$template, "resume.qmd"),
                                execute_params = list(code_path = file.path(path$code, "profile"),
                                                      www_path = path$www,
                                                      profile_path = path_profile(),
                                                      full = ifelse(input$resume_type == "Full", TRUE, FALSE),
                                                      anonymous = ifelse("Anonymous" %in% input$resume_options, TRUE, FALSE),
                                                      contact = TRUE),
                                quiet = T)
          
          # -- print html to pdf
          cat("[START] Print html document to pdf... \n")
          print_to_pdf(filename = "resume.html", path = path$template)
          
          # -- copy to user folder
          cat("[START] Copy pdf document to user folder... \n")
          file.copy(from = file.path(path$template, "resume.pdf"),
                    to = file.path(path_profile(), download_filename(user, type = input$resume_type, options = input$resume_options)))
          
        },
        
        # -- in case of error
        finally = cat(MODULE, "[END] pdf file generated finished \n")
        
      )
      
    })
    
    
    # -- download handler
    output$download_resume <- downloadHandler(

      # -- build file name
      filename = function()
        download_filename(user, type = input$resume_type, options = input$resume_options),
      
      # -- build content
      content = function(con) {
        
        cat(MODULE, "Prepare document to download \n")
        cat(MODULE, "-- type = ", input$resume_type, "\n")
        cat(MODULE, "-- options = ", input$resume_options, "\n")
        
        # -- build url
        target_file <- download_filename(user, type = input$resume_type, options = input$resume_options)
        target_file <- file.path("../data/philippeperet/profile", target_file)
        
        # -- copy file to tmp con
        file.copy(target_file, con)})
    
    
    # -- download preview
    output$download_preview <- renderUI({

      # -- declare resource path
      addResourcePath(prefix = "profile_media", directoryPath = path_profile())

      # -- build filename
      filename <- download_filename(user, type = input$resume_type, options = input$resume_options)
      
      # -- check file
      # under the EXPERIMENTAL variable!
      if(EXPERIMENTAL && !file.exists(file.path(path_profile(), filename)))
        actionButton(inputId = ns("generate_resume"),
                     label = "Build resume")
      
      else
        tags$iframe(style="height:400px; width:100%", src = paste0("profile_media/", filename))})
    
    
    # --------------------------------------------------------------------------
    # Outputs
    # --------------------------------------------------------------------------
    
    # -- user profile
    output$user_profile <- renderUI({
      
      # -- read user profile
      cat(MODULE, "Read user profile \n")
      user_profile <- read_profile(path_profile())
      
      # -- read user contact file
      cat(MODULE, "Build user profile \n")
      
      # -- return
      tagList(
        
        # -- title / subtitle
        profile_title(title = user_profile$title),
        
        # -- download
        div(
          class = "mb-5",
          actionButton(
            inputId = ns("download"),
            class = "gtag",
            label = "download")),
        
        # -- one pager
        key_takeaways(profile = user_profile, path = path$data, language = "en", full = TRUE),
        
        
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
            profile_experience(user_profile$experiences$geodis_csr)),
          
          # -- Freelance
          accordion_panel(
            title = "Freelance | Technical Data Expert",
            value = "exp_freelance",
            profile_experience(user_profile$experiences$freelance)),
          
          # -- DS QA
          accordion_panel(
            title = "Dassault Systèmes | QA Leader, Senior Manager",
            value = "exp_ds_qa",
            profile_experience(user_profile$experiences$ds_qa)),
          
          # -- DS Support
          accordion_panel(
            title = "Dassault Systèmes | L2 Technical Support, Engineer & Manager",
            value = "exp_ds_support",
            profile_experience(user_profile$experiences$ds_support))),
        
        
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
