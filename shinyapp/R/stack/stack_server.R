

# ------------------------------------------------------------------------------
# Module Server logic
# ------------------------------------------------------------------------------

stack_server <- function(id, user = NULL, path) {
  moduleServer(id, function(input, output, session) {
    
    # -- get namespace
    ns <- session$ns
    
    # -- module
    MODULE <- paste0("[", id, "]")
    
    # -- declare objects
    path_stack <- reactiveVal(NULL)
    
    
    # --------------------------------------------------------------------------
    # User
    # --------------------------------------------------------------------------
    
    # -- Observe user
    observeEvent(user(), {
      
      cat(MODULE, "Set user =", user(), "\n")
      
      # -- set path
      path_stack(file.path(path$data, user(), "stack"))
      
    })
    
    
    # --------------------------------------------------------------------------
    # Outputs
    # --------------------------------------------------------------------------
    
    # -- stack grid
    output$stack_grid <- renderUI({
      
      # -- return tags
      tagList(
        
        p(class = "mt-5",
          "Here you can find the key (i.e. not exhaustive) tools I'm using in", paste0(format(Sys.Date(), "%Y"), "."), br(),
          "Some stats about programming languages usage are available on", a(href = "https://github.com/thekangaroofactory", target = "_blank", "GitHub.")),
 
        # -- R section
        h2(class = "section", "R"),
        
        # -- wrapper
        layout_columns(
          col_widths = c(4, 8),
          
          # -- key figures
          card(
            class = "border-radius tkf-bg-camel color-dark p-3",
            
            # -- R
            tagList(
              p(icon("r-project"), "defines itself as a", span(style = "font-style:italic;", "language and environment for statistical computing and graphics.")),
              p("It makes it very powerful at dealing with data transformation, analysis & visualization."),
              p("It's my first choice language."))),
          
          
          # -- badges
          layout_column_wrap(
            
            # -- badge group
            card(
              class = "border",
              fill = FALSE,
              card_header("App & dashboard"),
              card_body(
                tags$span(
                  div(class = "badge tag tkf-bg-accent color-dark", "Shiny"),
                  div(class = "badge tag tkf-bg-accent color-dark", "bslib"),
                  div(class = "badge tag tkf-bg-accent color-dark", "DT")))),
            
            # -- badge group
            card(
              class = "border",
              fill = FALSE,
              card_header("Data engineering"),
              card_body(
                tags$span(
                  div(class = "badge tag tkf-bg-accent color-dark", "dplyr"),
                  div(class = "badge tag tkf-bg-accent color-dark", "data.table"),
                  div(class = "badge tag tkf-bg-accent color-dark", "geojson")))),
            
            # -- badge group
            card(
              class = "border",
              fill = FALSE,
              card_header("Data visualization"),
              card_body(
                tags$span(
                  div(class = "badge tag tkf-bg-accent color-dark", "ggplot2"),
                  div(class = "badge tag tkf-bg-accent color-dark", "leaflet")))),
            
            # -- badge group
            card(
              class = "border",
              fill = FALSE,
              card_header("API & database"),
              card_body(
                tags$span(
                  div(class = "badge tag tkf-bg-accent color-dark", "plumber"),
                  div(class = "badge tag tkf-bg-accent color-dark", "RCurl"),
                  div(class = "badge tag tkf-bg-accent color-dark", "DBI"),
                  div(class = "badge tag tkf-bg-accent color-dark", "RPostgres")))),
            
            # -- badge group
            card(
              class = "border",
              fill = FALSE,
              card_header("AI"),
              card_body(
                tags$span(
                  div(class = "badge tag tkf-bg-accent color-dark", "keras"),
                  div(class = "badge tag tkf-bg-accent color-dark", "reticulate")))),
            
            # -- badge group
            card(
              class = "border",
              fill = FALSE,
              card_header("Test & documentation"),
              card_body(
                tags$span(
                  div(class = "badge tag tkf-bg-accent color-dark", "testthat"),
                  div(class = "badge tag tkf-bg-accent color-dark", "quarto"),
                  div(class = "badge tag tkf-bg-accent color-dark", "pkgdown"))))
            
          ) # layout_column_wrap
          
        ),
        
        
        # -- Python section ----------------------------------------------------
        h2(class = "section", "Python"),
        
        # -- wrapper
        layout_columns(
          col_widths = c(8, 4),
          
          # -- badges
          layout_column_wrap(
            
            # -- badge group
            card(
              class = "border",
              fill = FALSE,
              card_header("Data engineering"),
              card_body(
                tags$span(
                  div(class = "badge tag tkf-bg-accent color-dark", "numpy"),
                  div(class = "badge tag tkf-bg-accent color-dark", "panda")))),
            
            # -- badge group
            card(
              class = "border",
              fill = FALSE,
              card_header("Machine Learning"),
              card_body(
                tags$span(
                  div(class = "badge tag tkf-bg-accent color-dark", "tensorflow"),
                  div(class = "badge tag tkf-bg-accent color-dark", "keras")))),
            
            # -- badge group
            card(
              class = "border",
              fill = FALSE,
              card_header("App & API"),
              card_body(
                tags$span(
                  div(class = "badge tag tkf-bg-accent color-dark", "Flask"),
                  div(class = "badge tag tkf-bg-accent color-dark", "FastAPI")))),
            
            # -- badge group
            card(
              class = "border",
              fill = FALSE,
              card_header("Environment"),
              card_body(
                tags$span(
                  div(class = "badge tag tkf-bg-accent color-dark", "Jupyter"),
                  div(class = "badge tag tkf-bg-accent color-dark", "PyCharm"),
                  div(class = "badge tag tkf-bg-accent color-dark", "Anaconda"))))),
          
          # -- camel card
          card(
            class = "border-radius tkf-bg-camel color-dark p-3",
            
            # -- Python
            tagList(
              p(icon("python"), "Python"),
              p("I mostly use Python for Machine Learning & in my data analysis mentoring activities.")))),
        
        
        # -- Data management section ----------------------------------------------
        
        h2(class = "section", "Data Management"),
        
        layout_columns(
          col_widths = c(4, 4),
          
          card(
            class = "border-radius tkf-bg-camel color-dark p-3",
            p("I have actually started my carreer with roles in the Data Management & Exchanges domains.")),
          
          layout_column_wrap(
            
            # -- badge group
            card(
              class = "border",
              fill = FALSE,
              card_header("Database"),
              card_body(
                tags$span(
                  div(class = "badge tag tkf-bg-accent color-dark", "SQL"),
                  div(class = "badge tag tkf-bg-accent color-dark", "PostgreSQL"),
                  div(class = "badge tag tkf-bg-accent color-dark", "Oracle")))),
            
            # -- badge group
            card(
              class = "border",
              fill = FALSE,
              card_header("Data warehouse"),
              card_body(
                tags$span(
                  div(class = "badge tag tkf-bg-accent color-dark", "Cloudera"),
                  div(class = "badge tag tkf-bg-accent color-dark", "Hive")))))),
        
        
        # -- Integration section -----------------------------------------------
        
        h2(class = "section", "Integration & QA"),
        
        # -- Section
        layout_columns(
          col_widths = c(4, 4),
          
          # -- text
          tagList(
            tags$ul(
              tags$li("Continuous integration (CI)"),
              tags$li("Automated tests"))),
          
          # -- badges
          layout_column_wrap(
            
            # -- badge group
            card(
              class = "border",
              fill = FALSE,
              card_header("Integration"),
              card_body(
                tags$span(
                  div(class = "badge tag tkf-bg-accent color-dark", "GitHub"),
                  div(class = "badge tag tkf-bg-accent color-dark", "GitLab")))),
            
            # -- badge group
            card(
              class = "border",
              fill = FALSE,
              card_header("QA"),
              card_body(
                tags$span(
                  div(class = "badge tag tkf-bg-accent color-dark", "GitHub actions"),
                  div(class = "badge tag tkf-bg-accent color-dark", "Codecov"))))
            
          ) # layout_column_wrap
        ), # layout_columns
        
        
        
        # -- Deployment section ------------------------------------------------
        
        h2(class = "section", "Deployment & Cloud"),
        
        # -- Section
        layout_columns(
          col_widths = c(4, 6),
          
          # -- text
          tagList(
            tags$ul(
              tags$li("Continuous deployment (CD)"),
              tags$li("Cloud platforms"))),
          
          # -- badges
          layout_column_wrap(

            # -- badge group
            card(
              class = "border",
              fill = FALSE,
              card_header("Containers"),
              card_body(
                tags$span(
                  div(class = "badge tag tkf-bg-accent color-dark", "Docker")))),
            
            # -- badge group
            card(
              class = "border",
              fill = FALSE,
              card_header("Production"),
              card_body(
                tags$span(
                  div(class = "badge tag tkf-bg-accent color-dark", "GCP"),
                  div(class = "badge tag tkf-bg-accent color-dark", "Azure"),
                  div(class = "badge tag tkf-bg-accent color-dark", "AWS"),
                  div(class = "badge tag tkf-bg-accent color-dark", "Supabase")))),
            
            # -- badge group
            card(
              class = "border",
              fill = FALSE,
              card_header("Exploration & prototypes"),
              card_body(
                tags$span(
                  div(class = "badge tag tkf-bg-accent color-dark", "Render"),
                  div(class = "badge tag tkf-bg-accent color-dark", "Shinyapps"),
                  div(class = "badge tag tkf-bg-accent color-dark", "Posit Connect"))))
            
          ) # layout_column_wrap
        ) # layout_columns
        
        
      ) # taglist / return
      
    })
    
  })
}
