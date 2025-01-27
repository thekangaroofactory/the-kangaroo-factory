

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
        
        p("My technical stack relies on different roles and experiences around data projects & products:"),
        tags$ul(
          tags$li("L2 / Back-end Technical Support"),
          tags$li("Software Quality Assessment"),
          tags$li("Data Analyst Mentorship"),
          tags$li("Data Project Management and/or Development")),
        
        # -- development section
        #h2("Development"),
        
        # -- key figures
        card(
          class = "border-radius bg-light p-3 mt-5",
          
          h3("Key figures"),
          
          layout_columns(
            col_widths = c(4, 4, 4),
            
            # -- R
            tagList(
              p(icon("r-project"), "R"),
              p("R defines itself as a", span(style = "font-style:italic;", "language and environment for statistical computing and graphics."), br(),
                "It makes it very powerful at dealing with data transformation, analysis & visualization."),
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
        h3("R"),
        
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
                  div(class = "badge tag", "Shiny"),
                  div(class = "badge tag", "shinydashboard"),
                  div(class = "badge tag", "bslib"),
                  div(class = "badge tag", "DT")))),
            
            # -- badge group
            card(
              class = "border border-light",
              fill = FALSE,
              card_header("Data engineering"),
              card_body(
                tags$span(
                  div(class = "badge tag", "dplyr"),
                  div(class = "badge tag", "data.table"),
                  div(class = "badge tag", "lubridate"),
                  div(class = "badge tag", "RCurl"),
                  div(class = "badge tag", "jsonlite"),))),
            
            # -- badge group
            card(
              class = "border border-light",
              fill = FALSE,
              card_header("Data visualization"),
              card_body(
                tags$span(
                  div(class = "badge tag", "ggplot2"),
                  div(class = "badge tag", "leaflet"),
                  div(class = "badge tag", "geojson")))),
            
            # -- badge group
            card(
              class = "border border-light",
              fill = FALSE,
              card_header("API & database"),
              card_body(
                tags$span(
                  div(class = "badge tag", "plumber"),
                  div(class = "badge tag", "DBI"),
                  div(class = "badge tag", "RPostgres")))),
            
            # -- badge group
            card(
              class = "border border-light",
              fill = FALSE,
              card_header("AI"),
              card_body(
                tags$span(
                  div(class = "badge tag", "keras"),
                  div(class = "badge tag", "tensorflow"),
                  div(class = "badge tag", "reticulate")))),
            
            # -- badge group
            card(
              class = "border border-light",
              fill = FALSE,
              card_header("Test & documentation"),
              card_body(
                tags$span(
                  div(class = "badge tag", "testthat"),
                  div(class = "badge tag", "quarto"),
                  div(class = "badge tag", "pkgdown"))))
            
          ) # layout_column_wrap
          
        ),
        
        
        # -- Python section ----------------------------------------------------
        h3("Python"),
        
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
                  div(class = "badge tag", "panda"),
                  div(class = "badge tag", "numpy")))),
            
            # -- badge group
            card(
              class = "border border-light",
              fill = FALSE,
              card_header("Machine Learning"),
              card_body(
                tags$span(
                  div(class = "badge tag", "tensorflow"),
                  div(class = "badge tag", "keras")))),
            
            # -- badge group
            card(
              class = "border border-light",
              fill = FALSE,
              card_header("App & API"),
              card_body(
                tags$span(
                  div(class = "badge tag", "Flask"),
                  div(class = "badge tag", "FastAPI"))))
            
          ) # layout_column_wrap
        ), # layout_columns
        
        
        # -- Data storage section ----------------------------------------------
        
        # -- key figures
        card(
          class = "border-radius bg-light p-3",
          
          h3("Data Management"),
          
          layout_columns(
            col_widths = c(4, 4, 4),
            
            tagList(
              p("I have actually started my carreer with roles in the Data Management, Integration, Migration & Exchanges domains.")
            ),
            
            # -- badge group
            card(
              class = "border border-light",
              fill = FALSE,
              card_header("Database"),
              card_body(
                tags$span(
                  div(class = "badge tag", "PostgreSQL"),
                  div(class = "badge tag", "Oracle")))),
            
            # -- badge group
            card(
              class = "border border-light",
              fill = FALSE,
              card_header("Data warehouse"),
              card_body(
                tags$span(
                  div(class = "badge tag", "Cloudera"),
                  div(class = "badge tag", "Hive"))))
            
          )
        ),
        
        
        # -- Integration section -----------------------------------------------
        
        h2("Integration & QA"),
        
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
                  div(class = "badge tag", "git"),
                  div(class = "badge tag", "github"),
                  div(class = "badge tag", "gitlab"),
                  div(class = "badge tag", "actions")))),
            
            # -- badge group
            card(
              class = "border border-light",
              fill = FALSE,
              card_header("QA"),
              card_body(
                tags$span(
                  div(class = "badge tag", "actions"),
                  div(class = "badge tag", "codecov"))))
            
          ) # layout_column_wrap
        ), # layout_columns
        
        
        
        # -- Deployment section ------------------------------------------------
        
        h2("Deployment & Cloud"),
        
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
                  div(class = "badge tag", "Docker")))),
            
            # -- badge group
            card(
              class = "border border-light",
              fill = FALSE,
              card_header("Production"),
              card_body(
                tags$span(
                  div(class = "badge tag", "GCP"),
                  div(class = "badge tag", "Azure"),
                  div(class = "badge tag", "AWS")))),
            
            # -- badge group
            card(
              class = "border border-light",
              fill = FALSE,
              card_header("Exploration & prototypes"),
              card_body(
                tags$span(
                  div(class = "badge tag", "Render"),
                  div(class = "badge tag", "Shinyapps"))))
            
          ) # layout_column_wrap
        ) # layout_columns
        
        
      ) # taglist / return
      
    })
    
  })
}
