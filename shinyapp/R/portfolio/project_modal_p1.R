

project_modal_p1 <- function(){
  
  # -- return wrapper
  tagList(
    
    # hero section
    hero_section(title = "Monitoring Dashboard",
                 description = "Data pipeline API & AI performance monitoring web application."),
    
    # page content
    div(
      class = "section-container",
      
      # -- About section
      div(style = "position:relative;",
        h2(class = "section", "About the Project"),
        actionLink(inputId = "project-close-btn", label = "close tab", icon = icon("close"), class = "project-close",
                   onclick = "Shiny.setInputValue('close_tab', 'project-viewer', {priority: \"event\"})")),
      
      
      p("This project was delivered as a resource to support a live session at the ", 
        a(id = "portfolio-p1-link_shinyconf", class = "ktag", href = "https://www.shinyconf.com/", target = "_blank", "ShinyConf2025"), ".", br(),
        "It's built around a Machine Learning model that was trained on a 140k rows dataset provided by the Australian BOM (", 
        a(href = "https://www.bom.gov.au/", target = "_blank", "Bureau of Meteorology"), ")."),
      
      p("The focus was set on addressing a real life end-to-end use case (collect external data sources, implement reproducible data pipeline, 
      monitor the performance of a system) while keeping the topic (weather forecast) easy to understand for the audience."),
      
      
      # -- Features section
      h2(class = "section", "Features"),
      
      layout_column_wrap(
        card(class = "border",
             card_header("Data engineering"),
             p("Weather observations are collected daily from the external data source, cleaned, prepared and stored into a database."),
             p("The prepared data (observations & predictions) are served by an API to support the dashboard.")),
        card(class = "border",
             card_header("Observations"),
             p("It's possible to explore the collected weather observations, using filters to select specific date range."),
             p("Data visualizations have been developped with a highly graphical approach.")),
        card(class = "border",
             card_header("Predictions"),
             p("The dashboard also displays the latest predictions and monitors the ML model performances."),
             p("A set of MLOps KPIs have been implemented."))),
      
      # -- image
      div(class = "project-image",
          img(src = "./img/projects/p1/dashboard_observations.jpg"),
          div(class = "project-image-caption", "Observations | rainfall")),
      
      
      # -- Architecture section
      h2(class = "section", "Architecture"),
      
      p("The project has different layers to encapsulate the tasks inside independant components."),
      p("There are three layers:"),
      tags$ul(
        tags$li("A data layer for the resources (raw files, tables, schemas, models)"),
        tags$li("An API layer to perform data engineering operations (collect, clean, transform, predict)"),
        tags$li("The dashboard itself with a server / client web application")),
      
      
      # -- Technical stack sub-section
      card(
        class = "tkf-bg-camel section",
        h3("Technical Stack"),
        layout_column_wrap(
          card(card_header("Dashboard"),
               p("Server & Client"),
               tags$ul(
                 tags$li("R"),
                 tags$li("Shiny, bslib"),
                 tags$li("Ggplot2"))),
          card(card_header("Data Engineering"),
               p("API & Database"),
               tags$ul(
                 tags$li("R, Plumber"),
                 tags$li("DBI, PostgreSQL"))),
          card(card_header("Model & Predictions"),
               p("AI / Machine Learning"),
               tags$ul(
                 tags$li("Python"),
                 tags$li("Tensorflow"),
                 tags$li("Keras, Reticulate"))))),
      
      # -- image
      div(class = "project-image",
          img(src = "./img/projects/p1/dashboard_predictions.jpg"),
          div(class = "project-image-caption", "Predictions | density & strength")),
      
      
      # -- Deliverable section
      h2(class = "section", "Deliverables"),
      
      p("The web application as well as the API were deployed as containers on the cloud (GCP) so that the audience of the live session
      could test it and explore the source code on GitHub."),
      
      layout_column_wrap(
        card(class = "border",
             card_header("API"),
             p("The API was delivered as a Docker container."),
             p("The underlying PostgreSQL database is hosted on ", a(href = "https://supabase.com/", target = "_blank", "Supabase"), "cloud.")),
        card(class = "border",
             card_header("Dashboard"),
             p("The Dashboard web application was also delivered as a Docker container deployed on GCP.")),
        card(class = "border",
             card_header("Live session"),
             "The live session was delivered at the",
             a(id = "portfolio-p1-link_shinyconf", class = "ktag", href = "https://www.shinyconf.com/", target = "_blank", "ShinyConf2025"), 
             "using this project as a resource to demonstrate modern dashboarding & data pipeline.")),
      
      # -- image
      div(class = "project-image",
          img(src = "./img/projects/p1/shinyconf_screenshot.jpg"),
          div(class = "project-image-caption", "ShinyConf2025 | live session")),
      
      p(style = "margin-top:40px;", "The workload was about 40 days (excl. AI model training)"),
      
      
      # -- Links section
      tags$ul(
        tags$li(icon("github"), "repository of the",
                a(id = "portfolio-p1-link_github_api",
                  class = "ktag",
                  href = "https://github.com/thekangaroofactory/rain-forecast-data-pipeline",
                  target = "_blank",
                  "API")),
        
        tags$li(icon("github"), "repository of the",
                a(id = "portfolio-p1-link_github_dashboard",
                  class = "ktag",
                  href = "https://github.com/thekangaroofactory/rain-forecast-dashboard",
                  target = "_blank",
                  "Dashboard")))
      
    ))
  
}
