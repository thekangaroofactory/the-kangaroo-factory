

project_modal_p5 <- function(path){
  
  # -- return wrapper
  tagList(
    
    # hero section
    hero_section(title = "GPX-Tracker",
                 description = "Connect the dots and compute analysis based on GPX files."),
    
    # page content
    div(
      class = "section-container",
      
      # ------------------------------------------------------------------------
      # About section
      div(style = "position:relative;",
          h2(class = "section", "About the Project"),
          actionLink(inputId = "project-close-btn", label = "close tab", icon = icon("close"), class = "project-close",
                     onclick = "Shiny.setInputValue('close_tab', 'projects-viewer', {priority: \"event\"})")),
      
      p("GPX tracks are (JSON) lists of GPS coordinates & elevation captured along with their timestamp — and that's it!", br(),
        "From this sometimes huge list of points, you can recreate the path, compute distances, times, speed 
        but also detect breaks or even recording anomalies."),

            
      # ------------------------------------------------------------------------
      # Features section
      h2(class = "section", "Features"),
      
      layout_column_wrap(
        
        card(class = "border",
             fill = FALSE,
             card_header("Map"),
             p("GPX tracks are projected on a map to show the itinary.")),
        
        card(class = "border",
             fill = FALSE,
             card_header("Stats & Profiles"),
             p("Key figures are computed from the raw data, and displayed as KPIs or graphical profiles (speed, elevation).")),
        
        card(class = "border",
             fill = FALSE,
             card_header("Detection"),
             p("In order to compute accurate stats, it is necessary to look for recording anomalies as well as breaks and
               potential overnight stops."))),
      
      
      # -- image
      div(class = "project-image",
          img(src = "./img/projects/p5/screenshot.png"),
          div(class = "project-image-caption", "Screenshot | track analysis")),
      
      
      # ------------------------------------------------------------------------
      # Architecture section
      h2(class = "section", "Architecture"),
      
      p("The tool is a modular client / server web application, also using the Nominatim OpenStreetMap API 
        to retrieve addresses and cities from the GPS coordinates."),
      
      # -- stack
      card(
        class = "tkf-bg-camel mt-5",
        h3("Technical Stack"),
        layout_column_wrap(
          card(class = "border",
               fill = FALSE,
               card_header("Dashboard"),
               tags$ul(
                 tags$li("R"),
                 tags$li("Leaflet"))),
          
          card(class = "border",
               fill = FALSE,
               card_header("Geocoding"),
               tags$ul(
                 tags$li("R"),
                 tags$li("OpenStreeMap API")))))
      
    )
  )
  
}
