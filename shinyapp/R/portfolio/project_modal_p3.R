

project_modal_p3 <- function(){
  
  # -- return wrapper
  tagList(
    
    # hero section
    hero_section(title = "GitHub Client",
                 description = "Building a cross repository follow-up application relying on the GitHub API."),
    
    # page content
    div(
      class = "section-container",
      
      # ------------------------------------------------------------------------
      # About section
      div(style = "position:relative;",
          h2(class = "section", "About the Project"),
          actionLink(inputId = "project-close-btn", label = "close tab", icon = icon("close"), class = "project-close",
                     onclick = "Shiny.setInputValue('close_tab', 'project-viewer', {priority: \"event\"})")),
      
      p("GitHub is widely used by developers & companies as a software development platform.", br(),
        "While it offers some project management capabilities, it is difficult to organize & follow them across repositories."),
      p("This application gathers GitHub resources (repos, milestones & issues) into projects.", br(),
        "It offers a global view over all the repositories to organize & prioritorize actions."),
      
      
      # ------------------------------------------------------------------------
      # Features section
      h2(class = "section", "Features"),
      
      layout_column_wrap(
        card(
          fill = FALSE,
          card_header("Smart cache"),
          p("For performance reason, a cache system has been developped based on scheduled calls to the GitHub API. 
          The frequency of the calls depends on the project status.")),
        
        card(
          fill = FALSE,
          card_header("Roadmap"),
          p("A roadmap is automatically built based on GitHub milestone's target date.")),
        
        card(
          fill = FALSE,
          card_header("Backlog"),
          p("Focus is set on reducing the backlog debt, thanks to dedicated KPIs."))),
      
      # -- image
      div(class = "project-image",
          img(src = "./img/projects/p3/screenshot_1.jpg"),
          div(class = "project-image-caption", "Dashboard | overview")),
      
      
      # ------------------------------------------------------------------------
      # Architecture section
      h2(class = "section", "Architecture"),
      
      p("The app is a client / server web applications served by a Docker container.", br(),
        "It connects to the GitHub API to sync the local cache."),
      
      # stack
      card(
        class = "tkf-bg-camel mt-5",
        h3("Technical Stack"),
        layout_column_wrap(
          card(
            card_header("App"),
            tags$ul(
              tags$li("R"),
              tags$li("Shiny"))),
          card(
            card_header("GitHub Sync"),
            tags$ul(
              tags$li("R"),
              tags$li("kitems, iker")))))
        
    )
    
  )
  
}
