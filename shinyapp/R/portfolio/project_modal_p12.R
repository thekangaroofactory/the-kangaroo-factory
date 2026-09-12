

project_modal_p12 <- function(path){
  
  # -- add resource path
  my_path <- file.path(path, "p12")
  addResourcePath(prefix = "project_media", directoryPath = my_path)
  
  # -- return wrapper
  tagList(
    
    # -- Project header section
    h1("ktools"),
    p("R package wrapping various utility tools."),
    
    
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
                                 value = "91%",
                                 p("Code coverage")),
                       
                       value_box(class = "tkf-bg-camel border",
                                 showcase = icon("unlock"),
                                 theme = value_box_theme(bg = "#726d67", fg = "#d9cec2"),
                                 title = "Visibility",
                                 value = "Public",
                                 p("Package & repository are open"))),
    
    
    # -- About section
    h2(class = "section",
       "The foundation to any ecosystem"),
    p("Any organization that wants to build a development", tags$span(style = "font-style: italic;", "ecosystem"), 
      "needs a utility package where to wrap various tools - most of them being shared among many projects."),
    
    # -- Features section
    h2(class = "section",
       "Features"),
    layout_column_wrap(
      width = "300px",
      
      card(class = "border",
           fill = FALSE,
           card_header("Environment, traces & debug"),
           tags$ul(
             tags$li("traces mechanism"),
             tags$li("code scanning"),
             tags$li("app environment"))),
      
      card(class = "border",
           fill = FALSE,
           card_header("Date & time"),
           tags$ul(
             tags$li("timestamp, uuid"),
             tags$li("find date"),
             tags$li("filter date range"))),
      
      card(class = "border",
           fill = FALSE,
           card_header("Shiny"),
           tags$ul(
             tags$li("output wrapper function"),
             tags$li("complex instructions")))),
  
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
           p(tags$a(id = "portoflio-p12_link_ktools_doc", class = "ktag", href = "https://thekangaroofactory.github.io/ktools", target = "_blank", "Documentation"), 
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
               "ktools",
               target = "_blank",
               href = "https://github.com/thekangaroofactory/ktools")),
        
        card(fill = FALSE,
             card_header("Documentation & articles"),
             p("The GitHub page of the package"),
             tags$a(id = "portfolio-p12-link_github_page",
                    class = "ktag",
                    href = "https://thekangaroofactory.github.io/ktools/",
                    target = "_blank",
                    "ktools"))))
    
  )
  
}
