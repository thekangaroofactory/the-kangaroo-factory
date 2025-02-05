

project_modal_p3 <- function(){

  # -- add resource path
  my_path <- "E:/Portfolio/R/Projects/the-kangaroo-factory/data/philippeperet/portfolio/p3"
  addResourcePath(prefix = "project_media", directoryPath = my_path)
  
  # -- return wrapper
  tagList(
    
    # -- Project header section
    h1("France Election"),
    p("Dynamic Election Data Visualization"),
    
    
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
                                 p("Application & repository are open"))),
    
    
    # -- About section
    h2(class = "section",
       "About the Project"),
    
    # -- columns
    layout_columns(
      col_widths = c(7,5),
      
      tagList(
        p("The application displays the performances of a candidate / list on a map.", br(),
          "User can select the election type, year, turn and the electoral boundaries on which the data should be projected."),
        p("The datasets have been collected on the", 
          tags$a(
            "data.gouv.fr",
            target = "_blank",
            href = "https://data.gouv.fr"),
          "platform on which the official election results are published by the French Government.")),
      
      card(class = "border border-light",
           card_header("Data.gouv.fr Page"),
           card_image(
             src = "project_media/screenshot_datagouv.png",
             alt = "Project image"))),
    
    
    # -- Features section
    h2(class = "section",
       "Features"),
    layout_column_wrap(
      
      card(class = "border border-light",
           fill = FALSE,
           card_header("Supported elections"),
           p("The application supports different types of election (one or two-turn)."),
           p("Election types"),
           tags$ul(
             tags$li("Presidential"),
             tags$li("Legislative"),
             tags$li("Municipal")),
           p("Two electoral boundary types are available."),
           p("Boundary types"),
           tags$ul(
             tags$li("Municipality"),
             tags$li("Legislative district")),
           p("User also selects the list of departements to display for better performances.")),
      
      card(class = "border border-light",
           fill = FALSE,
           card_header("Data cleaning & transformation"),
           p("The raw datasets are quite clean (they are prepared by the team) but still require some cleaning."),
           p("In particular, the department & city code formats are not homogenized through the different election types (this is even more true for the remote territories)."),
           p("The transformation involves matching the election results with the selected electoral boundaries. This is done through the use of geographical data.")),
      
      card(class = "border border-light",
           fill = FALSE,
           card_header("Map"),
           card_image(
             src = "project_media/opacity_animation.gif",
             alt = "Project image"),
           p("The application projects the election results for a given candidate / list on selected electoral boundaries."),
           p("Options are available to tune the performance color and opacity.", br(),
             "Also a search input is available to navigate the map (it's plugged on the Google API)"))),
    
    
    # -- Background section
    h2(class = "section",
       "Background"),
    
    # -- Technical stack sub-section
    h3(class = "mt-5 mb-3",
       "Architecture"),
    p("The application has a standard client / server architecture which relies on several module servers (map, elections, boundaries...)."),
    
    # -- Technical stack sub-section
    card(
      class = "bg-contrast mt-5",
      h3("Technical Stack"),
      layout_column_wrap(
        card(
          card_header("Data Engineering"),
          p("Cleaning & transformation:"),
          tags$ul(
            tags$li("R"))),
        card(
          card_header("Web application"),
          p("Client & server:"),
          tags$ul(
            tags$li("R"),
            tags$li("Shiny"),
            tags$li("Shinydashboard & ShinyWidgets"),
            tags$li("Google Analytics"))),
        card(
          card_header("Map"),
          p("Display & search:"),
          tags$ul(
            tags$li("R"),
            tags$li("Leaflet"),
            tags$li("Openstreetmap API"))))),
    
    
    # -- Deliverable section
    h2(class = "section",
       "Deliverables"),
    layout_column_wrap(
      card(
        class = "border border-light",
        card_header("Application"),
        p("The web application is deployed on the Shinyapps.io cloud platform.")),
      card(
        class = "border border-light",
        card_header("Page"),
        p("The application is registered on the data.gouv.fr plateform, so that it can be found from the list of reuses as well as the election and boundaries datasets."))),
    
    
    # -- Links section
    card(
      class = "bg-contrast section",
      h2("Links"),
      layout_column_wrap(
        card(
          card_header("Page"),
          p("The description page of the application on the data.gouv.fr platform"),
          tags$a(
            "carte-interactive-des-resultats-des-elections",
            target = "_blank",
            href = "https://www.data.gouv.fr/fr/reuses/carte-interactive-des-resultats-des-elections/")),
        card(
          card_header("Application"),
          p("A public instance of the application", br(),
            "(cold start may create a delay at startup)"),
          tags$a(
            "election-map",
            target = "_blank",
            href = "https://kangaroo-ai.shinyapps.io/election-map/")),
        card(
          card_header("Repository"),
          p("The GitHub", icon("github"), "repository of the Application"),
          tags$a(
            "france-elections",
            target = "_blank",
            href = "https://github.com/thekangaroofactory/france-elections"))))
    
  )
  
}
