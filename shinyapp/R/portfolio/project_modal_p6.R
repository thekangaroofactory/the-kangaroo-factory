

project_modal_p6 <- function(path){

  # -- add resource path
  my_path <- file.path(path, "philippeperet/portfolio/p6")
  addResourcePath(prefix = "project_media", directoryPath = my_path)
  
  # -- return wrapper
  tagList(
    
    # -- Project header section
    h1("GitHub Client"),
    p("Project follow-up application"),
    
    
    # -- Project info section
    layout_column_wrap(class = "mt-5",
                       value_box(class = "bg-tkf border border-light",
                                 showcase = icon("window-restore"),
                                 theme = value_box_theme(bg = "#726d67", fg = "#d9cec2"),
                                 title = "Project Type",
                                 value = "Web App",
                                 p("R / Shiny")),
                       
                       value_box(class = "bg-tkf border border-light",
                                 showcase = icon("file"),
                                 theme = value_box_theme(bg = "#726d67", fg = "#d9cec2"),
                                 title = "Cache",
                                 value = "Performance",
                                 p("GitHub cache sync")),
                       
                       value_box(class = "bg-tkf border border-light",
                                 showcase = icon("lock"),
                                 theme = value_box_theme(bg = "#726d67", fg = "#d9cec2"),
                                 title = "Visibility",
                                 value = "Private",
                                 p("The application is private"))),
    
    
    # -- About section
    h2(class = "section",
       "About the Project"),

    # -- text
    tagList(
      p("The application gathers GitHub resources (repos, milestones & issues) into projects.", br(),
        "It also offers a global view over all the repositories to organize & prioritorize actions.")),
        
    card(
      card_image(
        class = "p-3",
        src = "project_media/screenshot_1.jpg",
        alt = "Screenshot")),
    
    
    # -- Features section
    h2(class = "section",
       "Features"),

    layout_column_wrap(
      card(
        card_header("Roadmap"),
        p("A roadmap is automatically build based on GitHub milestone's target date."),
        card_image(src = "project_media/screenshot_2.jpg",
                   alt = "Screenshot")),
      card(
        card_header("Ecosystem"),
        p("The ecosystem view shows all projects grouped by type & state."),
        card_image(src = "project_media/screenshot_3.jpg",
                   alt = "Screenshot"))),
        

    # -- Background section
    h2(class = "section",
       "Background"),

    p("For performance reason, a smart cache system has been developped based on scheduled calls to the GitHub API."),
    
    # -- Technical stack sub-section
    card(
      class = "bg-tkf mt-5",
      h3("Technical Stack"),
      layout_column_wrap(
        card(
          card_header("App"),
          tags$ul(
            tags$li("R"),
            tags$li("Shiny"),
            tags$li("bslib"))),
        card(
          card_header("GitHub Sync"),
          tags$ul(
            tags$li("RCurl"),
            tags$li("dplyr"),
            tags$li("kitems")))))
    
  )
  
}
