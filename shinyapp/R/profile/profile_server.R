

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
    # User
    # --------------------------------------------------------------------------
    
    # -- Observe user
    observeEvent(user(), {
      
      cat(MODULE, "Set user =", user(), "\n")
      
      # -- set path
      path_profile(file.path(path$data, user(), "profile"))
      
    })
    
    
    # --------------------------------------------------------------------------
    # Outputs
    # --------------------------------------------------------------------------
    
    # -- pdf resume
    pdfurl <- "./PERET_Philippe_2024_11_FR.pdf"
    
    output$pdfviewer <- renderText(
      return(paste('<iframe style="height:80vh; width:100%" src="', pdfurl, '"></iframe>', sep = "")))
    
    
    # -- user profile
    output$user_profile <- renderUI({
      
      # -- read user contact file
      cat(MODULE, "Build user profile \n")
      #profile <- read.csv(file = file.path(path_profile(), "profile.csv"), header = T)

      # -- return
      tagList(
        
        # -- title / subtitle
        profile_title(),
        
        # -- one pager
        one_pager(),
        
        
        # -- Experiences
        h2(class = "section",
           "Experiences"),
        
        accordion(
          
          # -- GEODIS
          accordion_panel(
            title = "GEODIS | CSR Data Project Manager",
            experience_geodis()),
          
          # -- Freelance
          accordion_panel(
            title = "Freelance | Technical Data Expert",
            experience_freelance()),
          
          # -- DS QA
          accordion_panel(
            title = "Dassault Systèmes | QA Leader, Senior Manager",
            experience_ds_qa()),
          
          # -- DS Support
          accordion_panel(
            title = "Dassault Systèmes | L2 Technical Support, Engineer & Manager",
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
        
        
        # -- Misc
        h2(class = "section",
           "Download Resume"),
        
        # -- resume pdf viewer
        accordion(
          open = FALSE,
          accordion_panel(
            title = "Click to expand / collapse viewer",
            htmlOutput(ns("pdfviewer"))))
        
      )
      
    })
    
  })
}
