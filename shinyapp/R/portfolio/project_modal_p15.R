

project_modal_p15 <- function(path){
  
  # -- add resource path
  my_path <- file.path(path, "p15")
  addResourcePath(prefix = "project_media", directoryPath = my_path)
  
  # -- return wrapper
  tagList(
    
    # -- Project header section
    h1("GPX-Tracker"),
    p("Exploration project around GPX files."),
    
    # -- Project info section
    layout_column_wrap(class = "mt-5",
                       value_box(class = "tkf-bg-camel border",
                                 showcase = icon("box-archive"),
                                 theme = value_box_theme(bg = "#726d67", fg = "#d9cec2"),
                                 title = "Project Type",
                                 value = "WebApp",
                                 p("R / Shiny web application")),
                       
                       value_box(class = "tkf-bg-camel border",
                                 showcase = icon("file-code"),
                                 theme = value_box_theme(bg = "#726d67", fg = "#d9cec2"),
                                 title = "Domain",
                                 value = "GeoData",
                                 p("Projecting data on maps")),
                       
                       value_box(class = "tkf-bg-camel border",
                                 showcase = icon("unlock"),
                                 theme = value_box_theme(bg = "#726d67", fg = "#d9cec2"),
                                 title = "Visibility",
                                 value = "Public",
                                 p("Repository is open"))),
    
    
    # -- About section
    h2(class = "section",
       "Connect the dots"),
    p("GPX tracks are (JSON) lists of GPS coordinates & elevation captured along with their timestamp.", br(),
      "And that's it!"),
    p("From this list of points, you can compute distances, time, speed but also detect anomalies or even breaks."),
    
    # -- Features section
    h2(class = "section",
       "Features"),
    layout_column_wrap(
      width = "300px",
      
      card(class = "border",
           fill = FALSE,
           card_header("A Map!"),
           p("The GPX track is projected on the map to show the itinary.")),
      
      card(class = "border",
           fill = FALSE,
           card_header("Profiles"),
           tags$ul(
             tags$li("Speed"),
             tags$li("Elevation"))),
      
      card(class = "border",
           fill = FALSE,
           card_header("Detection"),
           tags$ul(
             tags$li("Breaks"),
             tags$li("Anomalies")))),
  
    # -- Technical stack sub-section
    card(
      class = "tkf-bg-camel mt-5",
      h3("Technical Stack"),
      layout_column_wrap(
        card(class = "border",
             fill = FALSE,
             card_header("Stack"),
             tags$ul(
               tags$li("R"),
               tags$li("Leaflet"))))),
   
    # -- Links section
    card(
      class = "tkf-bg-camel section",
      h2("Links"),
      layout_column_wrap(
        card(fill = FALSE,
             card_header("Repository"),
             p("The GitHub", icon("github"), "repository of the project"),
             tags$a(id = "portfolio-p15-link_github_repo",
                    class = "ktag",
               "GPX-Tracker",
               target = "_blank",
               href = "https://github.com/thekangaroofactory/gpx-tracker"))))
    
  )
  
}
