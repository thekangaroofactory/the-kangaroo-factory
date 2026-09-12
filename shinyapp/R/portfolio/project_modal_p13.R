

project_modal_p13 <- function(path){
  
  # -- add resource path
  my_path <- file.path(path, "p13")
  addResourcePath(prefix = "project_media", directoryPath = my_path)
  
  # -- return wrapper
  tagList(
    
    # -- Project header section
    h1("iker"),
    p("Iker is your Data Scribe."),
    
    # -- Project info section
    layout_column_wrap(class = "mt-5",
                       value_box(class = "tkf-bg-camel border",
                                 showcase = icon("box-archive"),
                                 theme = value_box_theme(bg = "#726d67", fg = "#d9cec2"),
                                 title = "Project Type",
                                 value = "Package",
                                 p("R Package available on GitHub")),
                       
                       value_box(class = "tkf-bg-camel border",
                                 showcase = icon("file-code"),
                                 theme = value_box_theme(bg = "#726d67", fg = "#d9cec2"),
                                 title = "QA",
                                 value = "99%",
                                 p("Code coverage")),
                       
                       value_box(class = "tkf-bg-camel border",
                                 showcase = icon("unlock"),
                                 theme = value_box_theme(bg = "#726d67", fg = "#d9cec2"),
                                 title = "Visibility",
                                 value = "Public",
                                 p("Package & repository are open"))),
    
    
    # -- About section
    h2(class = "section",
       "Motivation"),
    p("Data driven projects are often deeply dependent on data", tags$span(style = "font-style: italic;", "sources"), 
      "The motivation behind this package is to encapsulate data I/O operations outside projects so that they don't
      need to worry about where the data come from."),
    
    # -- Features section
    h2(class = "section",
       "Features"),
    layout_column_wrap(
      width = "300px",
      
      card(class = "border",
           fill = FALSE,
           card_header("CSV File"),
           p("At this time, CSV file is the only supported connector."))),
  
    # -- Technical stack sub-section
    card(
      class = "tkf-bg-camel mt-5",
      h3("Technical Stack"),
      layout_column_wrap(
        card(class = "border",
             fill = FALSE,
             card_header("CI/CD"),
             p("QA is automated with:"),
             tags$ul(
               tags$li("Testthat"),
               tags$li("GitHub actions"),
               tags$li("Codecov"))),
        card(class = "border",
             fill = FALSE,
             card_header("CI / CD"),
             p("Documentation"),
             tags$ul(
               tags$li("Quarto"),
               tags$li("Pkgdown"))))),
    
    
    # -- Deliverable section
    h2(class = "section",
       "Deliverables"),
    layout_column_wrap(
      card(class = "border",
           fill = FALSE,
           card_header("Package"),
           p("The package is published on GitHub."),
           p("It can be installed using the", tags$a(href = "https://remotes.r-lib.org/reference/install_github.html", target = "_blank", "install_github"), "function from {remotes} package.")),
      card(class = "border",
           fill = FALSE,
           card_header("Testing"),
           p("QA automation has been delivered through GitHub actions & Codecov.")),
      card(class = "border",
           fill = FALSE,
           card_header("Documentation"),
           p(tags$a(id = "portoflio-p12_link_iker_doc", class = "ktag", href = "https://thekangaroofactory.github.io/iker", target = "_blank", "Documentation"), 
             "& articles are delivered through the GitHub pages mechanism (with automation)."))),
    
    # -- Links section
    card(
      class = "tkf-bg-camel section",
      h2("Links"),
      layout_column_wrap(
        card(fill = FALSE,
             card_header("Repository"),
             p("The GitHub", icon("github"), "repository of the project"),
             tags$a(id = "portfolio-p12-link_github_repo",
                    class = "ktag",
               "iker",
               target = "_blank",
               href = "https://github.com/thekangaroofactory/iker")),
        
        card(fill = FALSE,
             card_header("Documentation & articles"),
             p("The GitHub page of the package"),
             tags$a(id = "portfolio-p12-link_github_page",
                    class = "ktag",
                    href = "https://thekangaroofactory.github.io/iker/",
                    target = "_blank",
                    "iker"))))
    
  )
  
}
