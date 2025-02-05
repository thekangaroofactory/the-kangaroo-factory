

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
        h1("Senior Data Project Manager"),
        p(style ="font-style: italic; margin-bottom: 5vh;", "Technico-functional data project expert"),

        
        # -- one pager
        card(
          class = "border-radius bg-contrast p-3 mt-2",
          
          # -- title
          card_header(
            class = "d-flex border-bottom-0",
            div(
              class = "flex-column",
            h2("Key Takeways"),
            p(style ="font-style: italic; font-weight: normal;", "One-page profile summary")),
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
            card(
              
              h4("Presentation"),
              p("Since 2001, it has always been about data projects and technico-functional roles.", br(),
                "I enjoy working with complex data pipelines & carefully designed dashboards."),
              
              h4("Career path (20+ XP)"),
              card(
                fill = FALSE,
                img(src = "img/career_path_en.png"))),
            
            
            # -- middle
            tagList(
              
              h4("Specific skills"),
              tags$ul(
                tags$li("Collect & advocate business needs"),
                tags$li("Full-Stack data approach"),
                tags$li("Speak same language as tech. teams"),
                tags$li("Problem solver")),
              
              h4("Specific domains"),
              tags$ul(
                tags$li("Transportation & logistics"),
                tags$li("CSR")),
              
              h4("Team management"),
              tags$ul(
                tags$li("35 people")),
              
              h4("Latest training"),
              tags$ul(
                tags$li("Generative AI with LLMs"))),
            
            # -- right
            tagList(
              
              h4("Key stack"),
              tags$ul(
                tags$li("R / Python"),
                tags$li("SQL")),
              
              h4("Key tools"),
              tags$ul(
                tags$li("Power.BI"),
                tags$li("Data Galaxy")),
              
              h4("Certifications & Degrees"),
              tags$ul(
                tags$li("Data Science & AI"),
                tags$li("Automotive Engineer (ESTACA)")),
              
              h4("Languages"),
              tags$ul(
                tags$li("French (native)"),
                tags$li("English (fluent)")))
            
          )),
        
        
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
