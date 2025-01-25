

project_explorer <- function(sections){
  
  cat("[project_explorer] Buidling project explorer content... \n")
  
  # path_portfolio <- "E:/Portfolio/R/Projects/the-kangaroo-factory/data/philippeperet/portfolio/p1"
  
  my_path <- "E:/Portfolio/R/Projects/the-kangaroo-factory/data/philippeperet/portfolio/p1"
  addResourcePath(prefix = "project_media", directoryPath = my_path)
  
  pdfurl <- "project_media/Rain Forecast Dashboard Full.pdf"
  
  # -- wrapper
  tagList(
    
    # -- Project header section
    header_section(sections$header),
    
    
    # -- Value box section
    value_section(sections$values),
    
    # -- Project info section
    # layout_column_wrap(class = "mt-5",
    #   value_box(class = "border border-light",
    #             showcase = icon("chart-line"),
    #             theme = "purple",
    #             title = "Project Type",
    #             value = "Dashboard",
    #             p("Web application & API containers deployed on the cloud")),
    #   
    #   value_box(class = "border border-light",
    #             showcase = icon("hourglass"),
    #             theme = "purple",
    #             title = "Workload",
    #             value = "40 days",
    #             p("Excl. AI model training")),
    #   
    #   value_box(class = "border border-light",
    #             showcase = icon("unlock"),
    #             theme = "purple",
    #             title = "Visibility",
    #             value = "Public",
    #             p("Dashboard & repositories are open"),
    #             p("API is private ;)"))),
    
    
    # -- Text section
    text_section(sections$text),
    
    
    # -- About section
    # h2(class = "mt-5 mb-3",
    #    "About the Project"),
    # p("The Rain Forecast Dashboard is part of a project that started in 2020.", br(),
    # "An AI model (Machine Learning) was then trained on a 140k dataset provided by the Australian Government BOM (Bureau of Meteorology)."),
    # p("Weather observation data have been collected continuously to keep monitoring the rain predictions."),
    # 
    
    # -- Features section
    h2(class = "mt-5 mb-3",
       "Features"),
    layout_column_wrap(
      card(class = "border border-light",
           card_header(class = "card-header bg-primary",
                       "Data engineering"),
           p("Observations are collected from an external data source, then cleaned, prepared and stored into a database."),
           p("The prepared data (observations & predictions) are served by an API to support the dashboard.")),
      card(class = "border border-light",
           card_header(class = "card-header bg-primary",
                       "Observation dashboard"),
           card_image(#file = file.path(path_portfolio, "dashboard_observations.jpg"),
                      src = "project_media/dashboard_observations.jpg",
                      alt = "Project image"),
           p("It allows to explore the collected weather observations, using filters to select specific date range."),
           p("Dedicated data visualizations have been developped with a highly graphical approach.")),
      card(class = "border border-light",
           card_header(class = "card-header bg-primary",
                       "Prediction dashboard"),
           card_image(#file = file.path(path_portfolio, "dashboard_predictions.jpg"),
                      src = "project_media/dashboard_predictions.jpg",
                      alt = "Project image"),
           p("This part of the dashboard displays the latest predictions and monitors the ML model performances."),
           p("A set of MLOps KPIs have been implemented with decicated code to fit with the dashboard design."))),
    
    
    # -- Background section
    h2(class = "mt-5 mb-3",
       "Background"),
    
    # -- Architecture sub-section
    h3("Architecture"),
    p("The project architecture has different layers to encapsulate dedicated tasks inside independant components."),
    p("- A data layer stores the database as well as other resources (raw files, schemas, models)", br(),
      "- An API layer performs all the data engineering operations through individual components (collection, cleaning, transformation, prediction)", br(),
      "- Finally, the dashboard layer itself is built with a server / client web application to get the data visualization computations done in the background"),
    
    # -- Technical stack sub-section
    h3(class = "mt-5 mb-3",
       "Technical Stack"),
    layout_column_wrap(
      card(class = "border border-light",
           card_header(class = "card-header bg-primary",
                       "Dashboard"),
           p("Server & Client"),
           tags$ul(
             tags$li("R"),
             tags$li("Shiny, bslib"),
             tags$li("Ggplot2, dplyr"),
             tags$li("Docker, GCP"))),
      card(class = "border border-light",
           card_header(class = "card-header bg-primary",
                       "Data Engineering"),
           p("API & Database"),
           tags$ul(
             tags$li("R, Plumber"),
             tags$li("RCurl"),
             tags$li("Keras, Reticulate"),
             tags$li("DBI, PostgreSQL (Supabase)"),
             tags$li("Docker, GCP"))),
      card(class = "border border-light",
           card_header(class = "card-header bg-primary",
                       "Model & Predictions"),
           p("AI / Machine Learning"),
           tags$ul(
             tags$li("Python"),
             tags$li("Tensorflow")))),
    
    # -- Methodology sub-section
    h3("Methodology"),
    p("The methodology is based on the Agile mindset and 25 years of experience around data project convergence & deployments."),
    
    
    # -- Deliverable section
    h2(class = "mt-5 mb-3",
       "Deliverables"),
    layout_column_wrap(
      card(class = "border border-light",
           card_header(class = "card-header bg-primary",
                       "API"),
           p("The API is delivered as a Docker container deployed on GCP (Cloud Run)"),
           p("The underlying database is hosted on Supabase.")),
      card(class = "border border-light",
           card_header(class = "card-header bg-primary",
                       "Dashboard"),
           p("The Dashboard is also delivered as a Docker container deployed on GCP (Cloud Run)"))),
      
    
    # -- Document section
    card(class = "border border-light",
         card_header("Project Presentation"),
         tags$iframe(style="height:600px; width:100%", src = pdfurl)),
    
    
    # -- Links section
    h2(class = "mt-5 mb-3",
       "Links"),
    layout_column_wrap(
      card(class = "border border-light",
           card_header("Dashboard"),
           p("A public instance of the web application is accessible", br(),
           "(cold start creates a delay at startup)"),
           tags$a(
             "Rain Forecast Dashboard",
             target = "_blank",
             href = "https://rain-forecast-dashboard-902168338454.europe-west9.run.app/")),
      card(class = "border border-light",
           card_header("Repository"),
           p("The GitHub repository of the API"),
           tags$a(
             "rain-forecast-data-pipeline",
             target = "_blank",
             href = "https://github.com/thekangaroofactory/rain-forecast-data-pipeline")),
      card(class = "border border-light",
           card_header("Repository"),
           p("The GitHub repository of the Dashboard"),
           tags$a(
             "rain-forecast-dashboard",
             target = "_blank",
             href = "https://github.com/thekangaroofactory/rain-forecast-dashboard")))
      
    )
    
}
