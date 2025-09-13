

project_modal_p1 <- function(path){

  # -- add resource path
  my_path <- file.path(path, "philippeperet/portfolio/p1")
  addResourcePath(prefix = "project_media", directoryPath = my_path)
  
  # -- return wrapper
  tagList(
    
    # -- Project header section
    h1("Rain Forecast Dashboard"),
    p("Data Exploration & ML Monitoring Dashboard"),
    
    
    # -- Project info section
    layout_column_wrap(class = "mt-5",
                       value_box(class = "bg-tkf border border-light",
                                 showcase = icon("chart-line"),
                                 theme = value_box_theme(bg = "#726d67", fg = "#d9cec2"),
                                 title = "Project Type",
                                 value = "Dashboard",
                                 p("Web application & API containers deployed on the cloud")),
                       
                       value_box(class = "bg-tkf border border-light",
                                 showcase = icon("hourglass"),
                                 theme = value_box_theme(bg = "#726d67", fg = "#d9cec2"),
                                 title = "Workload",
                                 value = "40 days",
                                 p("Excl. AI model training")),
                       
                       value_box(class = "bg-tkf border border-light",
                                 showcase = icon("unlock"),
                                 theme = value_box_theme(bg = "#726d67", fg = "#d9cec2"),
                                 title = "Visibility",
                                 value = "Public",
                                 p("Dashboard & repositories are open"),
                                 p("API is private"))),
    
    
    # -- About section
    h2(class = "section",
       "About the Project"),
    p("This dashboard is part of a project that started in 2020.", br(),
      "It's built around a Machine Learning model (AI) that was trained on a 140k dataset provided by the Australian Government BOM (", a(href = "https://www.bom.gov.au/", target = "_blank", "Bureau of Meteorology"), ")."),
    p("Weather observation data have been collected continuously to keep monitoring the rain predictions."),
    
    
    # -- Features section
    h2(class = "section",
       "Features"),
    layout_column_wrap(
      card(class = "border border-light",
           card_header("Data engineering"),
           p("Observations are collected from an external data source, cleaned, prepared and stored into a database."),
           p("The prepared data (observations & predictions) are served by an API to support the dashboard.")),
      card(class = "border border-light",
           card_header("Observations"),
           card_image(
             class = "p-3",
             src = "project_media/dashboard_observations.jpg",
             alt = "Project image"),
           p("It's possible to explore the collected weather observations, using filters to select specific date range."),
           p("Data visualizations have been developped with a highly graphical approach (here rainfall).")),
      card(class = "border border-light",
           card_header("Predictions"),
           card_image(
             class = "p-3",
             src = "project_media/dashboard_predictions.jpg",
             alt = "Project image"),
           p("The dashboard displays the latest predictions and monitors the ML model performances."),
           p("A set of MLOps KPIs have been implemented."))),
    
    
    # -- Background section
    h2(class = "section",
       "Background"),
    
    # -- Architecture sub-section
    h3("Architecture"),
    p("The project architecture has different layers to encapsulate tasks inside independant components."),
    p("Layers"),
    tags$ul(
      tags$li("A data layer to store the database & other resources (raw files, schemas, models)"),
      tags$li("An API layer to perform data engineering operations (collect, clean, transform, predict)"),
      tags$li("The dashboard layer itself with a server / client web application (visualization computations done in the background)")),
    
    # -- Technical stack sub-section
    card(
      class = "bg-tkf section",
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
               tags$li("RCurl"),
               tags$li("Keras, Reticulate"),
               tags$li("DBI, PostgreSQL"))),
        card(card_header("Model & Predictions"),
             p("AI / Machine Learning"),
             tags$ul(
               tags$li("Python"),
               tags$li("Tensorflow"))))),

    
    # -- Deliverable section
    h2(class = "section",
       "Deliverables"),
    layout_column_wrap(
      card(class = "border border-light",
           card_header("API"),
           p("The API is delivered as a Docker container (GCP).", br(),
           "The underlying PostgreSQL database is hosted on Supabase.")),
      card(class = "border border-light",
           card_header("Dashboard"),
           p("The Dashboard web application is also delivered as a Docker container (GCP)."))),
    
    
    # -- Document section
    card(class = "border border-light",
         card_header("Documentation"),
         p("Communication supports have also been delivered."),
         accordion(
           open = FALSE,
           accordion_panel(
             title = "Click to expand / collapse",
             value = "p1_documentation",
             tags$iframe(style="height:600px; width:100%", src = "project_media/Rain Forecast Dashboard Full.pdf")))),
    
    
    # -- Links section
    card(
      class = "bg-tkf section",
      h2("Links"),
      layout_column_wrap(
        card(card_header("Repository"),
             p("The GitHub", icon("github"), "repository of the API."),
             tags$a(
               'data-value' = "link_p1_github_api",
               "rain-forecast-data-pipeline",
               target = "_blank",
               href = "https://github.com/thekangaroofactory/rain-forecast-data-pipeline")),
        card(card_header("Repository"),
             p("The GitHub", icon("github"), "repository of the Dashboard."),
             tags$a(
               'data-value' = "link_p1_github_dashboard",
               "rain-forecast-dashboard",
               target = "_blank",
               href = "https://github.com/thekangaroofactory/rain-forecast-dashboard"))))
    
  )
  
}
