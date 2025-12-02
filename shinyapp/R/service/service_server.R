

# ------------------------------------------------------------------------------
# Module Server logic
# ------------------------------------------------------------------------------

service_server <- function(id, user = NULL, path, parent_session) {
  moduleServer(id, function(input, output, session) {
    
    # -- get namespace
    ns <- session$ns
    
    # -- module
    MODULE <- paste0("[", id, "]")
    
    # -- declare objects
    # path_stack <- reactiveVal(NULL)
    
    
    # --------------------------------------------------------------------------
    # User
    # --------------------------------------------------------------------------
    
    # -- Observe user
    # observeEvent(user(), {
    #   
    #   cat(MODULE, "Set user =", user(), "\n")
    #   
    #   # -- set path
    #   path_stack(file.path(path$data, user(), "stack"))
    #   
    # })
    
    
    # --------------------------------------------------------------------------
    # Observers
    # --------------------------------------------------------------------------
    
    # -- Contact button
    observeEvent(input$switch_contact, {
      
      cat("Switch to contact tab \n")
      
      # -- Switch nav panel
      nav_select(id = "navbar", 
                 selected = "contact",
                 session = parent_session)})
    
    # -- Contact button
    observeEvent(input$switch_project, {
      
      cat("Switch to contact tab \n")
      
      # -- Switch nav panel
      nav_select(id = "navbar", 
                 selected = "portfolio",
                 session = parent_session)})
    
    
    # --------------------------------------------------------------------------
    # Outputs
    # --------------------------------------------------------------------------
    
    # -- service grid
    output$service_grid <- renderUI({
      
      # -- return tags
      tagList(
        
        h1("Technical-Functional Data Services"),
        p(class="subtitle", "Backed by", as.numeric(format(Sys.Date(), "%Y")) - 2001, "years of data experience."),
        
        div(
          class = "mt-5",
          actionButton(
            class = "gtag",
            inputId = ns("switch_contact"),
            label = "Contact me")),
        
        
        # -- layout
        layout_column_wrap(
          class = "mt-5",
          
          # -- functional ------------------------------------------------------
          tagList(
            h2("Functional Services"),
            
            tags$ul(
              tags$li("Data Project Managements"),
              tags$li("Transformation"),
              tags$li("Architecture (portfolio, data flow, QA)")),
            
            h3("Reference"),
            p("GEODIS"),
            
            # -- data management & governance
            card(
              class = "border-radius tkf-bg-camel color-dark p-3",
              card_header("Specificities"),
              p("Technical-functional approach"),
              tags$ul(
                tags$li("Speak same language as both business & technical teams"),
                tags$li("Perform technical tasks if/when necessary"),
                tags$li("Team management experience"))),
            
            # -- data quality & pipelines
            card(
              class = "border-radius tkf-bg-camel color-dark p-3",
              card_header("Reliable systems"),
              p("Strong experience in"),
              tags$ul(
                tags$li("Data quality"),
                tags$li("Reproducible pipelines (collection, cleaning, transformation)")))),
          
          
          # -- mentoring -------------------------------------------------------
          tagList(
            h2("Mentoring Services"),
            
            tags$ul(
              tags$li("Coaching & mentoring"),
              tags$li("Training"),
              tags$li("Capitalization")),
            
            h3("References"),
            
            tags$ul(
              tags$li("Mentor @OpenClassrooms", br(),
                      a(href = "https://openclassrooms.com/paths/1040-data-analyst", target = "_blank", "Data Analyst"), "program"),
              tags$li("Speaker at the", a(href = "https://www.shinyconf.com/", target = "_blank", "ShinyConf2025"), br(),
                      "'Modern shiny dashboard with bslib' session."),
              tags$li("eBook writer", br(),
                      a(href = "https://thekangaroofactory.github.io/communication-between-shiny-modules/", target = "_blank", "Mastering Communication Between Shiny Modules")))),
          
          
          # -- technical -------------------------------------------------------
          tagList(
            h2("Technical Services"),
            
            p("Development using the R language:"),
            tags$ul(
              tags$li("Data analysis & visualizations"),
              tags$li("APIs, dashboards & web applications"),
              tags$li("Packages & documentation")),
            
            h3("References"),
            p("GEODIS, OpenClassrooms, ShinyConf2025 by Appsilon"),
            
            # -- apps & tools
            card(
              class = "border-radius tkf-bg-camel color-dark p-3",
              fill = FALSE,
              card_header("R Package"),
              p("The {", span(style = "font-weight: bold;", "kitems"), "} package provides a framework to manage data frame items within R / Shiny apps."),
              p("Visit the", a(style = "color:var(--tkf-color-dark);", href = "https://thekangaroofactory.github.io/kitems/", target = "_blank", "website."))),
            
            # -- link to portfolio
            div(
              class = "mt-5",
              actionButton(
                class = "gtag",
                inputId = ns("switch_project"),
                label = "See projects")),)),
        
        
        # -- references --------------------------------------------------------
        div(
          class = "mt-5",
          
          h2("Additional References"),
          p("As an employee of", a(href = "https://www.3ds.com", target = "_blank", "Dassault Systèmes"), "for more than 15 years,", br(),
            "I also worked with various industries & customers, including:",
            a(href = "https://www.bmwgroup.com", target = "_blank", "BMW"),
            a(href = "https://www.stellantis.com", target = "_blank", "Stellantis"),
            a(href = "https://www.claas.com", target = "_blank", "Claas"),
            a(href = "https://www.alstom.com", target = "_blank", "Alstom"),
            a(href = "https://www.airbus.com", target = "_blank", "Airbus"),
            a(href = "https://www.miele.com", target = "_blank", "Miele")))
        
        
      ) # taglist / return
      
    })
    
  })
}
