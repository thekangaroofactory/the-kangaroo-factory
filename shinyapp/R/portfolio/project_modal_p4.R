

project_modal_p4 <- function(path){

  # -- add resource path
  my_path <- file.path(path, "p4")
  addResourcePath(prefix = "project_media", directoryPath = my_path)
  
  # -- return wrapper
  tagList(
    
    # -- Project header section
    h1("TheKangarooFactory"),
    p("Portfolio & testing lab application"),
    
    
    # -- Project info section
    layout_column_wrap(class = "mt-5",
                       value_box(class = "tkf-bg-camel border",
                                 showcase = icon("window-restore"),
                                 theme = value_box_theme(bg = "#726d67", fg = "#d9cec2"),
                                 title = "Project Type",
                                 value = "WebApp",
                                 p("Web application deployed on the cloud")),
                       
                       value_box(class = "tkf-bg-camel border",
                                 showcase = icon("hourglass"),
                                 theme = value_box_theme(bg = "#726d67", fg = "#d9cec2"),
                                 title = "Workload",
                                 value = "30 days",
                                 p("Incl. UX design")),
                       
                       value_box(class = "tkf-bg-camel border",
                                 showcase = icon("unlock"),
                                 theme = value_box_theme(bg = "#726d67", fg = "#d9cec2"),
                                 title = "Visibility",
                                 value = "Public",
                                 p("The access is public"))),
    
    
    # -- About section
    h2(class = "section",
       "About the Project"),
    
    # -- text
    p("The web application is the engine behind thekangaroofactory.com website.", br(),
      "This enables running R code in the testing lab section (as a server is required)."),
    

    # -- Features section
    h2(class = "section",
       "Features"),
    layout_column_wrap(
      
      card(class = "border",
           fill = FALSE,
           card_header("TheLab"),
           p("The lab offers live testing capabilities for users to try kitems package features.", br(),
             "It is also meant to receive additional tools in the future.")),
      
      card(class = "border",
           fill = FALSE,
           card_header("Profile Builder"),
           p("Because the app was originally meant to host profile & portfolio, it has background automated capabilities to build profile & resume.", br(),
             "It supports multiple parameters like light/dark modes, anonymous, printable")),
      
      card(class = "border",
           fill = FALSE,
           card_header("Blog & Wiki"),
           p("The website wraps access to blog and how-to articles that are automatically rendered & published using Quarto."))),
    
    
    # -- Architecture section
    h2(class = "section",
       "Architecture"),
    
    p("The application has a standard client / server architecture which relies on several module servers."),
    
    # -- Technical stack sub-section
    card(
      class = "tkf-bg-camel mt-5",
      h3("Technical Stack"),
      layout_column_wrap(
        card(
          card_header("Front-end"),
          p("UI"),
          tags$ul(
            tags$li("R"),
            tags$li("Shiny + bslib"),
            tags$li("css, javascript"))),
        card(
          card_header("Back-end"),
          p("Server"),
          tags$ul(
            tags$li("R"),
            tags$li("Shiny"))))),
    
    
    # -- Deliverable section
    h2(class = "section",
       "Deliverables"),
    layout_column_wrap(
      card(
        class = "border",
        card_header("Application"),
        p("The web application is deployed as a Docker container on the Posit Connect Cloud platform.", br(),
          "It is automatically deployed when a new version of the app is pushed to GitHub.")),
      card(
        class = "border",
        card_header("Domains"),
        p("Domain names have been registered, with DNS configuration.")),
      card(
        class = "border",
        card_header("Flexibility"),
        p("The application is designed to allow multiple users/profiles in the future."))),

  )
  
}
