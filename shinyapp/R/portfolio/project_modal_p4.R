

project_modal_p4 <- function(path){

  # -- add resource path
  my_path <- file.path(path, "philippeperet/portfolio/p4")
  addResourcePath(prefix = "project_media", directoryPath = my_path)
  
  # -- return wrapper
  tagList(
    
    # -- Project header section
    h1("TheKangarooFactory"),
    p("Portfolio application"),
    
    
    # -- Project info section
    layout_column_wrap(class = "mt-5",
                       value_box(class = "border border-light",
                                 showcase = icon("window-restore"),
                                 theme = value_box_theme(bg = "#726d67", fg = "#d9cec2"),
                                 title = "Project Type",
                                 value = "WebApp",
                                 p("Web application deployed on the cloud")),
                       
                       value_box(class = "border border-light",
                                 showcase = icon("hourglass"),
                                 theme = value_box_theme(bg = "#726d67", fg = "#d9cec2"),
                                 title = "Workload",
                                 value = "30 days",
                                 p("Incl. UX design")),
                       
                       value_box(class = "border border-light",
                                 showcase = icon("unlock"),
                                 theme = value_box_theme(bg = "#726d67", fg = "#d9cec2"),
                                 title = "Visibility",
                                 value = "Public",
                                 p("The access is public"))),
    
    
    # -- About section
    h2(class = "section",
       "About the Project"),
    
    # -- text
    tagList(
      p("The website is a portfolio application to navigate projects & explore profile.", br(),
        "It's also meant to allow several users / profiles in the future.")),
    

    # -- Features section
    h2(class = "section",
       "Features"),
    layout_column_wrap(
      
      card(class = "border border-light",
           fill = FALSE,
           card_header("Portfolio"),
           p("The portfolio module helps to explore & showcase the projects with detailed descriptions.")),
      
      card(class = "border border-light",
           fill = FALSE,
           card_header("Profile & Stack"),
           p("Dedicated modules manage user profile & technical stack.", br(),
             "It allows to build & download different versions of resume.")),
      
      card(class = "border border-light",
           fill = FALSE,
           card_header("Services"),
           p("The service page shows available consultant services."))),
    
    
    # -- Background section
    h2(class = "section",
       "Background"),
    
    # -- Technical stack sub-section
    h3(class = "mt-5 mb-3",
       "Architecture"),
    p("The application has a standard client / server architecture which relies on several module servers (portfolio, profile, services)."),
    
    # -- Technical stack sub-section
    card(
      class = "bg-contrast mt-5",
      h3("Technical Stack"),
      layout_column_wrap(
        card(
          card_header("Front-end"),
          p("UI"),
          tags$ul(
            tags$li("R"),
            tags$li("Shiny"),
            tags$li("bslib"),
            tags$li("css, javascript"))),
        card(
          card_header("Back-end"),
          p("Server"),
          tags$ul(
            tags$li("R"),
            tags$li("Shiny"),
            tags$li("ggplot2"))))),
    
    
    # -- Deliverable section
    h2(class = "section",
       "Deliverables"),
    layout_column_wrap(
      card(
        class = "border border-light",
        card_header("Application"),
        p("The web application is deployed as a Docker container on the Google cloud platform (GCP).")),
      card(
        class = "border border-light",
        card_header("Domains"),
        p("Domain names have been registered at OVH.")),
      card(
        class = "border border-light",
        card_header("Design"),
        p("Application look & feel documents (Graphic Charter & Mockup) have been created and are published on Bēhance."))),
    
    
    # -- Links section
    card(
      class = "bg-contrast section",
      h2("Links"),
      layout_column_wrap(
        card(
          card_header("Bēhance"),
          p("The project is referenced on Bēhance."),
          tags$a(
            'data-value' = "link_p4_behance",
            "TheKangarooFactory",
            target = "_blank",
            href = "https://www.behance.net/philippe-peret"))))
    
  )
  
}
