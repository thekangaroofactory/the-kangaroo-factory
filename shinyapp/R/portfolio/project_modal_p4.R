

project_modal_p4 <- function(path){
  
  # -- return wrapper
  tagList(
    
    # hero section
    hero_section(title = "TheKangarooFactory",
                 description = "Web application including a live testing lab."),
    
    # page content
    div(
      class = "section-container",
      
      # ------------------------------------------------------------------------
      # About section
      div(style = "position:relative;",
          h2(class = "section", "About the Project"),
          actionLink(inputId = "project-close-btn", label = "close tab", icon = icon("close"), class = "project-close",
                     onclick = "Shiny.setInputValue('close_tab', 'projects-viewer', {priority: \"event\"})")),
      
      p("The web application is the engine behind thekangaroofactory.com website.", br(),
        "It enables running R code in the testing lab and fetching information from various data sources."),
      
      
      # ------------------------------------------------------------------------
      # Features section
      
      h2(class = "section", "Features"),
      
      layout_column_wrap(
        
        card(class = "border",
             fill = FALSE,
             card_header("Fetching Data"),
             p("Because open source contribution is a fast evolving environment, it is needed to collect the latest
               information about say a package or blog posts to keep the content up to date.", br(),
               "The app supports multiple data sources, most of them relying on external APIs.")),
        
        card(class = "border",
             fill = FALSE,
             card_header("Lab"),
             p("The lab offers live testing capabilities for users to try the kitems' package features.", br(),
               "This means the app is running module servers in the background.")),
        
        card(class = "border",
             fill = FALSE,
             card_header("Blog & Wiki"),
             p("The website wraps access to blog and how-to articles that are automatically retrieved from external RSS feeds."))),
      
      
      # ------------------------------------------------------------------------  
      # Architecture section
      
      h2(class = "section", "Architecture"),
      
      p("The application has a modular client / server architecture and is delivered on the cloud as a Docker container.", br(),
        "It's deployment is fully automated whenever a new version of the code is promoted."),
      
      # stack
      card(
        class = "tkf-bg-camel mt-5",
        h3("Technical Stack"),
        layout_column_wrap(
          card(
            card_header("Front-end"),
            tags$ul(
              tags$li("R"),
              tags$li("Shiny + bslib"))),
          card(
            card_header("Back-end"),
            tags$ul(
              tags$li("R"),
              tags$li("Shiny, kitems, iker")))))
      
    )
    
  )
  
}
