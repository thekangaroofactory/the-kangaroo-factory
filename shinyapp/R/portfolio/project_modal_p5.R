

project_modal_p5 <- function(path){

  # -- add resource path
  my_path <- file.path(path, "philippeperet/portfolio/p5")
  addResourcePath(prefix = "project_media", directoryPath = my_path)
  
  # -- return wrapper
  tagList(
    
    # -- Project header section
    h1("The Diamond Bay"),
    p("Photography portfolio"),
    
    
    # -- Project info section
    layout_column_wrap(class = "mt-5",
                       value_box(class = "border border-light",
                                 showcase = icon("window-restore"),
                                 theme = value_box_theme(bg = "#726d67", fg = "#d9cec2"),
                                 title = "Project Type",
                                 value = "Website",
                                 p("Static website deployed on the cloud")),
                       
                       value_box(class = "border border-light",
                                 showcase = icon("file"),
                                 theme = value_box_theme(bg = "#726d67", fg = "#d9cec2"),
                                 title = "Page",
                                 value = "1",
                                 p("Single landing page")),
                       
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
      p("The project is a photography portfolio.", br(),
        "It's made of a unique landing page (static website), but is meant to become a web application in a future version.")),
    

    # -- Features section
    h2(class = "section",
       "Features"),
    layout_column_wrap(
      
      card(class = "border border-light",
           fill = FALSE,
           card_header("Landing page"),
           p("The first version has been delivered as a single-page static website.")),
      
      card(class = "border border-light",
           fill = FALSE,
           card_header("Portfolio"),
           p("The portfolio displays a grid of previews that can be opened in a modal window."))),
    
    
    # -- Background section
    h2(class = "section",
       "Background"),

    # -- Technical stack sub-section
    card(
      class = "bg-contrast mt-5",
      h3("Technical Stack"),
      layout_column_wrap(
        card(
          card_header("Website"),
          p("Front-end"),
          tags$ul(
            tags$li("HTML"),
            tags$li("css"),
            tags$li("Javascript"))))),
    
    
    # -- Deliverable section
    h2(class = "section",
       "Deliverables"),
    layout_column_wrap(
      card(
        class = "border border-light",
        card_header("Website"),
        p("The website is deployed on Render cloud platform as a static website.")),
      card(
        class = "border border-light",
        card_header("Domain"),
        p("A domain name is registered at OVH and redirects to the cloud platform."))),
    
    
    # -- Links section
    card(
      class = "bg-contrast section",
      h2("Links"),
      layout_column_wrap(
        card(
          card_header("Website"),
          p("Link to the website"),
          tags$a(
            'data-value' = "link_p5_website",
            "www.thediamondbay.fr",
            target = "_blank",
            href = "https://www.thediamondbay.fr/"))))
    
  )
  
}
