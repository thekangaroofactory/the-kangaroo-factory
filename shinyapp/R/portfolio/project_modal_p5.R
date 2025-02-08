

project_modal_p5 <- function(path){

  # -- add resource path
  my_path <- file.path(path, "philippeperet/portfolio/p5")
  addResourcePath(prefix = "project_media", directoryPath = my_path)
  
  # -- return wrapper
  tagList(
    
    # -- Project header section
    h1("The Diamond Bay"),
    p("Website"),
    
    
    # -- Project info section
    layout_column_wrap(class = "mt-5",
                       value_box(class = "border border-light",
                                 showcase = icon("window-restore"),
                                 theme = value_box_theme(bg = "#726d67", fg = "#d9cec2"),
                                 title = "Project Type",
                                 value = "Website",
                                 p("Static website")),
                       
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
      p("The website is a photography portfolio. It's made of a unique landing page.")),
    

    # -- Features section
    h2(class = "section",
       "Features"),
    layout_column_wrap(
      
      card(class = "border border-light",
           fill = FALSE,
           card_header("Services"),
           p("The service page shows available consultant services."))),
    
    
    # -- Background section
    h2(class = "section",
       "Background"),

    # -- Technical stack sub-section
    card(
      class = "bg-contrast mt-5",
      h3("Technical Stack"),
      layout_column_wrap(
        card(
          card_header("UX"),
          p("App design:"),
          tags$ul(
            tags$li("HTML / css"),
            tags$li("Javascript"))))),
    
    
    # -- Deliverable section
    h2(class = "section",
       "Deliverables"),
    layout_column_wrap(
      card(
        class = "border border-light",
        card_header("Website"),
        p("The website is deployed on Render cloud plateform as a static website.")),
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
          card_header("Website"),
          p("The Diamond Bay"),
          tags$a(
            'data-value' = "link_p5_****",
            "project",
            target = "_blank",
            href = "https://www.data.gouv.fr/fr/reuses/carte-interactive-des-resultats-des-elections/"))))
    
  )
  
}
