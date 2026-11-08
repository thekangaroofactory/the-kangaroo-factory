

project_modal_p2 <- function(){
  
  # -- return wrapper
  tagList(
    
    # hero section
    hero_section(title = "France Election",
                 description = "Dynamic data visualization based on election open data."),
    
    # page content
    div(
      class = "section-container",
      
      # ------------------------------------------------------------------------      
      # About section
      
      div(style = "position:relative;",
          h2(class = "section", "About the Project"),
          actionLink(inputId = "project-close-btn", label = "close tab", icon = icon("close"), class = "project-close",
                     onclick = "Shiny.setInputValue('close_tab', 'projects-viewer', {priority: \"event\"})")),
      
      p("The application features official election datasets published by the French Government on the", 
        a("data.gouv.fr", target = "_blank", href = "https://www.data.gouv.fr/datasets/search?q=elections"), "platform.", br(),
        "There are 10 elections + 2 geographical boundaries datasets behind this tool, making these multiple big data sources a challenge to manipulate."),
      
      
      # ------------------------------------------------------------------------
      # Features section
      
      h2(class = "section", "Features"),
      
      layout_column_wrap(
        
        card(class = "border",
             fill = FALSE,
             card_header("Election types"),
             p("The application supports different election types and electoral boundaries."),
             layout_columns(
               tagList(
                 p("Election types"),
                 tags$ul(
                   tags$li("Presidential"),
                   tags$li("Legislative"),
                   tags$li("Municipal"))),
               tagList(
                 p("Boundary types"),
                 tags$ul(
                   tags$li("Municipality"),
                   tags$li("Legislative district"))))),
        
        card(class = "border",
             fill = FALSE,
             card_header("Data quality & transformation"),
             p("The raw datasets require some operations."),
             p("In particular, department & city code formats are not homogenized through the different files."),
             p("The transformation also involves matching the election results with the electoral boundaries (geographical data).")),
        
        card(class = "border",
             fill = FALSE,
             card_header("Map"),
             p("The application projects the election results for a given candidate / list on selected electoral boundaries."),
             p("Options are available to tune color and opacity."),
             p("Also a search input is available to navigate the map using the", 
               a(href = "https://www.openstreetmap.org/", target = "_blank", "OpenStreetMap"), "API."))),
      
      
      # -- image
      div(class = "project-image",
          img(src = "./img/projects/p2/election_map.jpg"),
          div(class = "project-image-caption", "Map | presidential election")),
      
      # ------------------------------------------------------------------------
      # Technical section
      
      h2(class = "section", "Architecture"),
      
      p("The application has a client / server architecture which relies on several module servers to manage the various data 
        types and use cases (map, elections, boundaries)."),
      
      # stack
      card(
        class = "tkf-bg-camel mt-5",
        h3("Technical Stack"),
        layout_column_wrap(
          card(
            card_header("Data Engineering"),
            p("Cleaning & transformation"),
            tags$ul(
              tags$li("R"),
              tags$li("dplyr, geojsonio"))),
          card(
            card_header("Web application"),
            p("Client & server"),
            tags$ul(
              tags$li("R"),
              tags$li("Shiny"))),
          card(
            card_header("Map"),
            p("Display & search"),
            tags$ul(
              tags$li("R, Leaflet"),
              tags$li("OpenStreetMap API"))))),
      
      
      # ------------------------------------------------------------------------
      # Deliverable section
      
      h2(class = "section", "Deliverables"),
      
      layout_column_wrap(
        card(
          class = "border",
          fill = FALSE,
          card_header("Application"),
          p("The web application is delivered as a Docker container.")),
        card(
          class = "border",
          card_header("Visibility"),
          p("The application is registered on the data.gouv.fr plateform, so that it can 
            be found from the list of reuses as well as the election and boundaries datasets."),
          
          a(id = "portfolio-p3-link_data_gouv_page",
            class = "ktag",
            href = "https://www.data.gouv.fr/fr/reuses/carte-interactive-des-resultats-des-elections/",
            target = "_blank",
            "reuse page"))),
      
      # -- image
      div(class = "project-image",
          img(src = "./img/projects/p2/datagouv.png"),
          div(class = "project-image-caption", "Reuse page | data.gouv.fr")),
      
    )
    
  )
  
}
