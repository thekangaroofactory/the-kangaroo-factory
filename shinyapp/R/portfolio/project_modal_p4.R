

project_modal_p4 <- function(path){

  # -- add resource path
  my_path <- file.path(path, "philippeperet/portfolio/p4")
  addResourcePath(prefix = "project_media", directoryPath = my_path)
  
  # -- return wrapper
  tagList(
    
    # -- Project header section
    h1("TheKangarooFactory.com"),
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
                                 showcase = icon("check-to-slot"),
                                 theme = value_box_theme(bg = "#726d67", fg = "#d9cec2"),
                                 title = "Views",
                                 value = "9,8k",
                                 p("Source: data.gouv.fr")),
                       
                       value_box(class = "border border-light",
                                 showcase = icon("unlock"),
                                 theme = value_box_theme(bg = "#726d67", fg = "#d9cec2"),
                                 title = "Visibility",
                                 value = "Public",
                                 p("The website is public"))),
    
    
    # -- About section
    h2(class = "section",
       "About the Project"),
    
    # -- text
    tagList(
      p("The website is a portfolio application to navigate projects & explore profile.")),
    

    # -- Features section
    h2(class = "section",
       "Features"),
    layout_column_wrap(
      
      card(class = "border border-light",
           fill = FALSE,
           card_header("Portfolio"),
           p("The portfolio module helps to explore the projects.")),
      
      card(class = "border border-light",
           fill = FALSE,
           card_header("Profile & Stack"),
           p("Detailed profile & technical stack.")),
      
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
    p("The application has a standard client / server architecture which relies on several module servers (portfolio, profile, etc...)."),
    
    # -- Technical stack sub-section
    card(
      class = "bg-contrast mt-5",
      h3("Technical Stack"),
      layout_column_wrap(
        card(
          card_header("Web application"),
          p("Front & Back-end:"),
          tags$ul(
            tags$li("R"),
            tags$li("Shiny"),
            tags$li("bslib"))),
        card(
          card_header("UX"),
          p("App design:"),
          tags$ul(
            tags$li("Graphic Charter"),
            tags$li("Mockup"))))),
    
    
    # -- Deliverable section
    h2(class = "section",
       "Deliverables"),
    layout_column_wrap(
      card(
        class = "border border-light",
        card_header("Application"),
        p("The web application is deployed on the Google cloud platform (GCP).")),
      card(
        class = "border border-light",
        card_header("Design"),
        p("The app look & feel document is published on Behance."))),
    
    
    # -- Links section
    card(
      class = "bg-contrast section",
      h2("Links"),
      layout_column_wrap(
        card(
          card_header("Behance"),
          p("The UX blablabla"),
          tags$a(
            'data-value' = "link_p4_****",
            "project",
            target = "_blank",
            href = "https://www.data.gouv.fr/fr/reuses/carte-interactive-des-resultats-des-elections/"))))
    
  )
  
}
