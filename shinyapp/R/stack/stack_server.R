

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
      
      # -- links
      github_src <- "https://github-readme-stats.vercel.app/api/top-langs/?username=thekangaroofactory&layout=compact&theme=dark&hide_border=true&bg_color=2d3037&exclude_repo=Website-kangaroo-ai"
      
      # -- return tags
      tagList(
        
        # -- key figures
        card(
          class = "border-radius bg-contrast p-3 mt-5",
          
          h3("Key figures"),
          
          layout_columns(
            col_widths = c(4, 4, 4),
            
            # -- R
            tagList(
              p(icon("r-project"), "R"),
              p("R defines itself as a", span(style = "font-style:italic;", "language and environment for statistical computing and graphics.")),
              p("It makes it very powerful at dealing with data transformation, analysis & visualization."),
              p("It's my first choice language because dataframes are native in R, as well as vectorized alternatives (faster compared to for loops).", br(),
                "Also R has powerfull graphic systems for data visualization.")),
            
            # -- GitHub languages
            card(
              fill = FALSE,
              card_header(icon("github"), "GitHub"),
              card_image(
                src = github_src)),
            
            # -- Python
            tagList(
              p(icon("python"), "Python"),
              p("Python is the most popular language ( source:", 
                tags$a(href = "https://www.tiobe.com/tiobe-index/", 
                       target = "_blank",
                       "tiobe-index"), ")", br(),
                "and the default for many projets."),
              p("I mostly use it for Machine Learning training activities", br(), "(some libraries are not direclty available in R).")))),
        
        
        # -- R section
        h2(class = "section",
           "R"),
        
        # -- wrapper
        layout_columns(
          col_widths = c(4, 8),
          
          # -- text
          tagList(
            p("These are the packages I'm using the most from my R stack"),
            tags$ul(
              tags$li("App & dashboard"),
              tags$li("Data engineering"),
              tags$li("Data visualization (graphs & maps)"),
              tags$li("API & database"),
              tags$li("AI"),
              tags$li("Test & documentation"))),
          
          # -- badges
          layout_column_wrap(
            
            # -- badge group
            card(
              class = "border border-light",
              fill = FALSE,
              card_header("App & dashboard"),
              card_body(
                tags$span(
                  div(class = "badge tag bg-accent color-bg", "Shiny"),
                  div(class = "badge tag bg-accent color-bg", "shinydashboard"),
                  div(class = "badge tag bg-accent color-bg", "bslib"),
                  div(class = "badge tag bg-accent color-bg", "DT")))),
            
            # -- badge group
            card(
              class = "border border-light",
              fill = FALSE,
              card_header("Data engineering"),
              card_body(
                tags$span(
                  div(class = "badge tag bg-accent color-bg", "dplyr"),
                  div(class = "badge tag bg-accent color-bg", "data.table"),
                  div(class = "badge tag bg-accent color-bg", "lubridate"),
                  div(class = "badge tag bg-accent color-bg", "RCurl"),
                  div(class = "badge tag bg-accent color-bg", "jsonlite"),
                  div(class = "badge tag bg-accent color-bg", "geojson")))),
            
            # -- badge group
            card(
              class = "border border-light",
              fill = FALSE,
              card_header("Data visualization"),
              card_body(
                tags$span(
                  div(class = "badge tag bg-accent color-bg", "ggplot2"),
                  div(class = "badge tag bg-accent color-bg", "leaflet")))),
            
            # -- badge group
            card(
              class = "border border-light",
              fill = FALSE,
              card_header("API & database"),
              card_body(
                tags$span(
                  div(class = "badge tag bg-accent color-bg", "plumber"),
                  div(class = "badge tag bg-accent color-bg", "DBI"),
                  div(class = "badge tag bg-accent color-bg", "RPostgres")))),
            
            # -- badge group
            card(
              class = "border border-light",
              fill = FALSE,
              card_header("AI"),
              card_body(
                tags$span(
                  div(class = "badge tag bg-accent color-bg", "keras"),
                  div(class = "badge tag bg-accent color-bg", "tensorflow"),
                  div(class = "badge tag bg-accent color-bg", "reticulate")))),
            
            # -- badge group
            card(
              class = "border border-light",
              fill = FALSE,
              card_header("Test & documentation"),
              card_body(
                tags$span(
                  div(class = "badge tag bg-accent color-bg", "testthat"),
                  div(class = "badge tag bg-accent color-bg", "quarto"),
                  div(class = "badge tag bg-accent color-bg", "pkgdown"))))
            
          ) # layout_column_wrap
          
        ),
        
        
        # -- Python section ----------------------------------------------------
        h2(class = "section",
           "Python"),
        
        # -- wrapper
        layout_columns(
          col_widths = c(4, 8),
          
          # -- text
          tagList(
            tags$ul(
              tags$li("Machine Learning"),
              tags$li("Scripts & notebooks"),
              tags$li("GitHub templates"))),
          
          # -- badges
          layout_column_wrap(
            
            # -- badge group
            card(
              class = "border border-light",
              fill = FALSE,
              card_header("Data engineering"),
              card_body(
                tags$span(
                  div(class = "badge tag bg-accent color-bg", "panda"),
                  div(class = "badge tag bg-accent color-bg", "numpy"),
                  div(class = "badge tag bg-accent color-bg", "SQLAlchemy")))),
            
            # -- badge group
            card(
              class = "border border-light",
              fill = FALSE,
              card_header("Machine Learning"),
              card_body(
                tags$span(
                  div(class = "badge tag bg-accent color-bg", "tensorflow"),
                  div(class = "badge tag bg-accent color-bg", "keras")))),
            
            # -- badge group
            card(
              class = "border border-light",
              fill = FALSE,
              card_header("App & API"),
              card_body(
                tags$span(
                  div(class = "badge tag bg-accent color-bg", "Flask"),
                  div(class = "badge tag bg-accent color-bg", "FastAPI"))))
            
          ) # layout_column_wrap
        ), # layout_columns
        
        
        # -- Data storage section ----------------------------------------------
        
        # -- key figures
        card(
          class = "border-radius bg-contrast p-3 section",
          
          h3("Data Management"),
          
          layout_columns(
            col_widths = c(4, 4, 4),
            
            tagList(
              p("I have actually started my carreer with roles in the Data Management & Exchanges domains.")
            ),
            
            # -- badge group
            card(
              class = "border border-light",
              fill = FALSE,
              card_header("Database"),
              card_body(
                tags$span(
                  div(class = "badge tag bg-accent color-bg", "PostgreSQL"),
                  div(class = "badge tag bg-accent color-bg", "Oracle")))),
            
            # -- badge group
            card(
              class = "border border-light",
              fill = FALSE,
              card_header("Data warehouse"),
              card_body(
                tags$span(
                  div(class = "badge tag bg-accent color-bg", "Cloudera"),
                  div(class = "badge tag bg-accent color-bg", "Hive"))))
            
          )
        ),
        
        
        # -- Integration section -----------------------------------------------
        
        h2(class = "section",
           "Integration & QA"),
        
        # -- Section
        layout_columns(
          col_widths = c(4, 8),
          
          # -- text
          tagList(
            tags$ul(
              tags$li("Continuous integration (CI)"),
              tags$li("Automated tests"))),
          
          # -- badges
          layout_column_wrap(
            
            # -- badge group
            card(
              class = "border border-light",
              fill = FALSE,
              card_header("Integration"),
              card_body(
                tags$span(
                  div(class = "badge tag bg-accent color-bg", "git"),
                  div(class = "badge tag bg-accent color-bg", "GitHub"),
                  div(class = "badge tag bg-accent color-bg", "GitLab"),
                  div(class = "badge tag bg-accent color-bg", "GitHub actions")))),
            
            # -- badge group
            card(
              class = "border border-light",
              fill = FALSE,
              card_header("QA"),
              card_body(
                tags$span(
                  div(class = "badge tag bg-accent color-bg", "GitHub actions"),
                  div(class = "badge tag bg-accent color-bg", "Codecov"))))
            
          ) # layout_column_wrap
        ), # layout_columns
        
        
        
        # -- Deployment section ------------------------------------------------
        
        h2(class = "section",
           "Deployment & Cloud"),
        
        # -- Section
        layout_columns(
          col_widths = c(4, 8),
          
          # -- text
          tagList(
            tags$ul(
              tags$li("Continuous deployment (CD)"),
              tags$li("Cloud platforms"))),
          
          # -- badges
          layout_column_wrap(

            # -- badge group
            card(
              class = "border border-light",
              fill = FALSE,
              card_header("Containers"),
              card_body(
                tags$span(
                  div(class = "badge tag bg-accent color-bg", "Docker")))),
            
            # -- badge group
            card(
              class = "border border-light",
              fill = FALSE,
              card_header("Production"),
              card_body(
                tags$span(
                  div(class = "badge tag bg-accent color-bg", "GCP"),
                  div(class = "badge tag bg-accent color-bg", "Azure"),
                  div(class = "badge tag bg-accent color-bg", "AWS"),
                  div(class = "badge tag bg-accent color-bg", "Supabase")))),
            
            # -- badge group
            card(
              class = "border border-light",
              fill = FALSE,
              card_header("Exploration & prototypes"),
              card_body(
                tags$span(
                  div(class = "badge tag bg-accent color-bg", "Render"),
                  div(class = "badge tag bg-accent color-bg", "Shinyapps"))))
            
          ) # layout_column_wrap
        ) # layout_columns
        
        
      ) # taglist / return
      
    })
    
  })
}
