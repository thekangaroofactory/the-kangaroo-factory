

project_modal_p2 <- function(path){
  
  # -- add resource path
  my_path <- file.path(path, "philippeperet/portfolio/p2")
  addResourcePath(prefix = "project_media", directoryPath = my_path)
  
  # -- return wrapper
  tagList(
    
    # -- Project header section
    h1("Kitems"),
    p("R Framework to Manage Dataframe Items"),
    
    
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
                                 title = "Code",
                                 value = "2,6k",
                                 p("Lines of code")),
                       
                       value_box(class = "tkf-bg-camel border",
                                 showcase = icon("unlock"),
                                 theme = value_box_theme(bg = "#726d67", fg = "#d9cec2"),
                                 title = "Visibility",
                                 value = "Public",
                                 p("Package & repository are open"))),
    
    
    # -- About section
    h2(class = "section",
       "Motivations"),
    p("When working on a tool that performs operations based on tabular data, the first milestone in the project is to enable standard data processing.", br(),
      "In many cases, it involves to write code that allows to handle the same set of operations but for different objects, which makes this code hard to reuse in another project."),
    p("The purpose of kitems is to wrap those standard operations into a package that is not dependent on the type of item -", tags$span(style = "font-style: italic;", "something that is part of a list or group of things"), "- to manage."),
    
    # -- Features section
    h2(class = "section",
       "Features"),
    layout_column_wrap(
      width = "300px",
      
      card(class = "border",
           fill = FALSE,
           card_header("Data model"),
           p("The data model contains the specifications of the items to manage."),
           p("Attribute information"),
           tags$ul(
             tags$li("name"),
             tags$li("type"),
             tags$li("default value"),
             tags$li("visibility"),
             tags$li("ordering"))),
      
      card(class = "border",
           fill = FALSE,
           card_header("Items"),
           p("Items are stored in a table that fits with the data model rules."),
           p("All functions related to item management are performing their task in the context of the data model.")),
      
      card(class = "border",
           fill = FALSE,
           card_header("Filtering"),
           p("The module server has smart filtering capabilities that enable different layers (saving computation time):"),
           tags$ul(
             tags$li("pre-filtering layer dedicated to high level filters"),
             tags$li("main layer dedicated to user filters"))),
      
      card(class = "border",
           fill = FALSE,
           card_header("Workflows"),
           p("To support multiple implementation patterns, the module server implements back-end workflows that can be called programmatically."),
           tags$ul(
             tags$li("CRUD operations"),
             tags$li("Filtering operations"))),
      
      card(class = "border",
           fill = FALSE,
           card_header("Inputs & outputs"),
           p("A set of UI components is avaible to interact with the framework directly from an app."),
           p("Components"),
           tags$ul(
             tags$li("Item table view"), 
             tags$li("Date range input"), 
             tags$li("Standard buttons (create, update, delete)"))),
      
      card(class = "border",
           fill = FALSE,
           card_header("Admin console"),
           p("An admin console is delivered as a standalone app."),
           p("The reason is that in most cases, it’s not recommended to have the data model(s) management accessible from within an application."))),
    
    
    # -- Architecture section
    h2(class = "section",
       "Architecture"),
    
    p("The framework is delivered as a Shiny module that can be instanciated inside a Shiny server (or even a module server).", br(),
    "It makes it very flexible to use & allows multiple implementations."),
  
    
    # -- Technical stack sub-section
    card(
      class = "tkf-bg-camel mt-5",
      h3("Technical Stack"),
      layout_column_wrap(
        card(class = "border",
             fill = FALSE,
             card_header("Framework"),
             p("R Package"),
             tags$ul(
               tags$li("R"),
               tags$li("Shiny, Shinydashboard"),
               tags$li("ShinyWidgets, DT"),
               tags$li("dplyr"))),
        card(class = "border",
             fill = FALSE,
             card_header("Admin console"),
             p("Standelone shiny app"),
             tags$ul(
               tags$li("R"),
               tags$li("Shiny"),
               tags$li("Shinydashboard, ShinyWidgets"))),
        card(class = "border",
             fill = FALSE,
             card_header("CI / CD"),
             p("Documentation & testing"),
             tags$ul(
               tags$li("Testthat"),
               tags$li("Quarto"))))),
    
    
    # -- Deliverable section
    h2(class = "section",
       "Deliverables"),
    layout_column_wrap(
      card(class = "border",
           fill = FALSE,
           card_header("Package"),
           p("The package is published on GitHub."),
           p("It can be installed using the", a(href = "https://remotes.r-lib.org/reference/install_github.html", target = "_blank", "install_github"), "function from {remotes} package.")),
      card(class = "border",
           fill = FALSE,
           card_header("Testing"),
           p("QA automation has been delivered through GitHub actions & Codecov.")),
      card(class = "border",
           fill = FALSE,
           card_header("Documentation"),
           p(a(href = "https://thekangaroofactory.github.io/kitems/", target = "_blank", "Documentation"), "& articles are delivered through the GitHub pages mechanism (with automation)."))),
    
    
    # -- Document section
    card(class = "border",
         card_header("Communication supports"),
         p("Multiple presentations have been delivered to support the communication around the package.", br(),
           "As an example, the roadmap is included in the documentation", a(href = "https://thekangaroofactory.github.io/kitems/articles/roadmap.html", target = "_blank", "page."))),
    
    
    # -- Links section
    card(
      class = "tkf-bg-camel section",
      h2("Links"),
      layout_column_wrap(
        card(fill = FALSE,
             card_header("Repository"),
             p("The GitHub", icon("github"), "repository of the project"),
             tags$a(
               'data-value' = "link_p2_github",
               "kitems",
               target = "_blank",
               href = "https://github.com/thekangaroofactory/kitems")),
        
        card(fill = FALSE,
             card_header("Documentation & articles"),
             p("The GitHub page of the package"),
             tags$a(
               'data-value' = "link_p2_github_page",
               "kitems",
               target = "_blank",
               href = "https://thekangaroofactory.github.io/kitems/"))))
    
  )
  
}
