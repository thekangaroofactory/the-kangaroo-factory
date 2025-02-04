

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
        p(style ="font-style: italic;", "Technico-functional data project expert"),

        
        # -- one pager
        card(
          class = "border-radius bg-light p-3",
          
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
          layout_column_wrap(
            
            # -- left
            tagList(
              
              h3("Presentation"),
              p("Since 2001, it has always been about data projects and technico-functional roles.", br(),
                "I enjoy working with complex data pipelines & carefully designed dashboards."),
            
              h3("Career path (20+ XP)"),
              img(src = "img/career_path.png")),
            
            tagList(
              h3("Specific skills"),
              tags$ul(
                tags$li("Collect & advocate business need"),                
                tags$li("Full-Stack data approach"),                
                tags$li("Problem solver"),
                tags$li("Speak same language as tech. teams")),
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
                tags$li("Power.BI")),
              h3("Degrees & certifications"),
              tags$ul(
                tags$li("Engineer (ESTACA)")),
              h3("Languages"),
              tags$ul(
                tags$li("French"),
                tags$li("English")))
            
          )),
        
        
        # -- Experiences
        h2("Experiences"),
        
        accordion(
          accordion_panel(
            title = "kjkjjk",
            template_experience()),
          accordion_panel(
            title = "kjkjjk",
            template_experience())),
        
        
        # -- Misc
        h2("Download Resume")
        
      )
      
    })
    
  })
}
