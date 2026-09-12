

project_modal_p14 <- function(path){
  
  # -- add resource path
  my_path <- file.path(path, "p14")
  addResourcePath(prefix = "project_media", directoryPath = my_path)
  
  # -- return wrapper
  tagList(
    
    # -- Project header section
    h1("kwidgets"),
    p("HTML Widgets for R Shiny."),
    
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
                                 title = "Lifecycle",
                                 value = "Experimental",
                                 p("Package is in early development")),
                       
                       value_box(class = "tkf-bg-camel border",
                                 showcase = icon("unlock"),
                                 theme = value_box_theme(bg = "#726d67", fg = "#d9cec2"),
                                 title = "Visibility",
                                 value = "Public",
                                 p("Package & repository are open"))),
    
    
    # -- About section
    h2(class = "section",
       "Motivation"),
    p("This package wraps a set of SVG/HTML widgets. The goal behind using SVG is to allow update 
      with css animation while the widget itself won't be rendered again"),
    
    # -- Features section
    h2(class = "section",
       "Features"),
    layout_column_wrap(
      width = "300px",
      
      card(class = "border",
           fill = FALSE,
           card_header("JavaScript Dependencies"),
           p("Automated JS dependency!")),
      
      card(class = "border",
           fill = FALSE,
           card_header("Widgets"),
           tags$ul(
             tags$li("gauge"),
             tags$li("progress")))),
  
    # -- Technical stack sub-section
    card(
      class = "tkf-bg-camel mt-5",
      h3("Technical Stack"),
      layout_column_wrap(
        card(class = "border",
             fill = FALSE,
             card_header("Stack"),
             tags$ul(
               tags$li("R"),
               tags$li("JavaScript"))),
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
           p(tags$a(id = "portoflio-p14_link_kwidgets_doc", class = "ktag", href = "https://thekangaroofactory.github.io/kwidgets", target = "_blank", "Documentation"), 
             "& articles are delivered through the GitHub pages mechanism (with automation)."))),
    
    # -- Links section
    card(
      class = "tkf-bg-camel section",
      h2("Links"),
      layout_column_wrap(
        card(fill = FALSE,
             card_header("Repository"),
             p("The GitHub", icon("github"), "repository of the project"),
             tags$a(id = "portfolio-p14-link_github_repo",
                    class = "ktag",
               "kwidgets",
               target = "_blank",
               href = "https://github.com/thekangaroofactory/kwidgets")),
        
        card(fill = FALSE,
             card_header("Documentation & articles"),
             p("The GitHub page of the package"),
             tags$a(id = "portfolio-p14-link_github_page",
                    class = "ktag",
                    href = "https://thekangaroofactory.github.io/kwidgets/",
                    target = "_blank",
                    "kwidgets"))))
    
  )
  
}
