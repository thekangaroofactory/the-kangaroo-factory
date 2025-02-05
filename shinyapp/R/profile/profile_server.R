

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
    
    # -- user profile
    output$user_profile <- renderUI({
      
      # -- read user contact file
      cat(MODULE, "Build user profile \n")
      #profile <- read.csv(file = file.path(path_profile(), "profile.csv"), header = T)

      # -- return
      tagList(
        
        # -- title / subtitle
        h1("Senior Data Project Manager"),
        p(style ="font-style: italic; margin-bottom: 5vh;", "Technico-functional data project expert"),

        
        # -- one pager
        card(
          class = "border-radius bg-light p-3 mt-2",
          
          # -- title
          card_header(
            class = "d-flex",
            div(
              class = "flex-column",
            h2("Key Takeways"),
            p(style ="font-style: italic;", "One-page profile summary")),
            shiny::downloadLink(
              class = "ms-auto",
              outputId="download",
              label=tooltip(
                icon("file"),
                "Click to download Chart",
                placement = "right"
              ))),
          
          # -- content
          layout_columns(
            col_widths = c(6, 3, 3),
            
            # -- left
            tagList(
              
              h3("Presentation"),
              p("Since 2001, it has always been about data projects and technico-functional roles.", br(),
                "I enjoy working with complex data pipelines & carefully designed dashboards."),
              
              h3("Career path (20+ XP)"),
              card(
                img(src = "img/career_path_en.png"))),

            
            tagList(
              h3("Specific skills"),
              tags$ul(
                tags$li("Collect & advocate business needs"),
                tags$li("Full-Stack data approach"),
                tags$li("Speak same language as tech. teams"),
                tags$li("Problem solver")),
              h3("Specific domains"),
              tags$ul(
                tags$li("Transportation & logistics"),
                tags$li("CSR")),             
              h3("Team management"),
              tags$ul(
                tags$li("35 people (France & India)")), 
              h3("Latest training"),
              tags$ul(
                tags$li("Generative AI with LLMs"))),
            
            tagList(
              h3("Key stack"),
              tags$ul(
                tags$li("R / Python"),
                tags$li("SQL")),
              h3("Key tools"),
              tags$ul(
                tags$li("Power.BI"),
                tags$li("Data Galaxy")),
              h3("Certifications & Degrees"),
              tags$ul(
                tags$li("Data Science & AI"),
                tags$li("Automotive Engineer (ESTACA)")),
              h3("Languages"),
              tags$ul(
                tags$li("French (native)"),
                tags$li("English (fluent)")))
            
          )),
        
        
        
        # -- temporary career path
        # h2("Career path (20+ XP)"),
        # layout_columns(
        #   col_widths = c(6, 6),
        #   ,
        #   ""),
        
        
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
          class = "border-radius bg-light p-3",
          
          p("2024"),
          tags$ul(
            tags$li("Generative AI with LLMs")),
          
          p("2023"),
          tags$ul(
            tags$li("AI For Good (Public Health & Climate Change)")),
          
          p("2020 / 2021 (660h)"),
          tags$ul(
            tags$li("Data Science | Johns Hopkins University"),
            tags$li("Machine Learning | Stanford University"),
            tags$li("Deep Learning & MLOps | DeepLearning.AI")),
          
          p("2000"),
          tags$ul(
            tags$li("Automotive Engineer | ESTACA"))),
        
        
        # -- Misc
        h2(class = "section",
           "Download Resume")
        
      )
      
    })
    
  })
}
