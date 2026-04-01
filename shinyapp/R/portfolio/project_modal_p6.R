

project_modal_p6 <- function(path){

  # -- add resource path
  my_path <- file.path(path, "p6")
  addResourcePath(prefix = "project_media", directoryPath = my_path)
  
  # -- return wrapper
  tagList(
    
    # -- Project header section
    h1("GitHub Client"),
    p("Project follow-up application"),
    
    
    # -- Project info section
    layout_column_wrap(class = "mt-5",
                       value_box(class = "tkf-bg-camel border",
                                 showcase = icon("window-restore"),
                                 theme = value_box_theme(bg = "#726d67", fg = "#d9cec2"),
                                 title = "Project Type",
                                 value = "Web App",
                                 p("R / Shiny")),
                       
                       value_box(class = "tkf-bg-camel border",
                                 showcase = icon("file"),
                                 theme = value_box_theme(bg = "#726d67", fg = "#d9cec2"),
                                 title = "Challenge",
                                 value = "Performance",
                                 p("GitHub cache synchronization")),
                       
                       value_box(class = "tkf-bg-camel border",
                                 showcase = icon("lock"),
                                 theme = value_box_theme(bg = "#726d67", fg = "#d9cec2"),
                                 title = "Visibility",
                                 value = "Private",
                                 p("The application is private"))),
    
    
    # -- About section
    h2(class = "section",
       "About the Project"),

    # -- text
    p("GitHub is widely used by developers & companies as a software development platform.", br(),
      "While it offers some project management capabilities, it's difficult to organize & follow them across repositories."),
    p("This application gathers GitHub resources (repos, milestones & issues) into projects.", br(),
      "It offers a global view over all the repositories to organize & prioritorize actions.", br(),
      "It also enables mixed resources as some tasks do not require code delivery."),
  
    card(
      card_image(
        class = "p-3",
        src = "project_media/screenshot_1.jpg",
        alt = "Screenshot")),
    
    
    # -- Features section
    h2(class = "section",
       "Features"),

    p("The focus is defined by two main axis:"),
    tags$ul(
      tags$li("Automate priority management, project status, roadmap follow-up"),
      tags$li("Reduce backlog debt")),
    
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

    p("For performance reason, a smart cache system has been developped based on scheduled calls to the GitHub API.", br(),
      "The frequency of the calls depends on parameters like project status."),
    p("The application smart cache system relies on the back-end capabilities of the {", tags$a(id = "portfolio-p6-link_kitems_doc", class = "ktag", href = "https://thekangaroofactory.github.io/kitems/", target = "_blank", "kitems"), "} package."),
    
    # -- Technical stack sub-section
    card(
      class = "tkf-bg-camel mt-5",
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
