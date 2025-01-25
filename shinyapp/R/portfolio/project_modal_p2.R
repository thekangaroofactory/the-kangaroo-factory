

project_modal_p2 <- function(){
  
  # -- add resource path
  my_path <- "E:/Portfolio/R/Projects/the-kangaroo-factory/data/philippeperet/portfolio/p2"
  addResourcePath(prefix = "project_media", directoryPath = my_path)
  
  # -- return wrapper
  tagList(
    
    # -- Project header section
    h1("Kitems"),
    p("R Framework to Manage Dataframe Items"),
    
    
    # -- Project info section
    layout_column_wrap(class = "mt-5",
                       value_box(class = "border border-light",
                                 showcase = icon("box-archive"),
                                 theme = "purple",
                                 title = "Project Type",
                                 value = "Package",
                                 p("R Package available on GitHub")),
                       
                       value_box(class = "border border-light",
                                 showcase = icon("file-code"),
                                 theme = "purple",
                                 title = "Code",
                                 value = "1,6k",
                                 p("Lines of code")),
                       
                       value_box(class = "border border-light",
                                 showcase = icon("unlock"),
                                 theme = "purple",
                                 title = "Visibility",
                                 value = "Public",
                                 p("Package & repository are open"))),
    
    
    # -- About section
    h2(class = "mt-5 mb-3",
       "About the Project / Motivations"),
    p("When working on a R Shiny project that performs operations based on tabular data, whether it is for data analysis or data visualization, the first milestone in the project is to enable standard data processing.", br(),
      "In many cases, it involves to write code that allows to handle the same set of operations but for different objects, which makes this code hard to reuse in another project."),
    p("The purpose of kitems is to wrap those standard operations into a package that is not dependent on the type of item -", tags$span(style = "font-style: italic;", "something that is part of a list or group of things"), "- to manage."),
    
    # -- Features section
    h2(class = "mt-5 mb-3",
       "Features"),
    layout_column_wrap(
      card(class = "border border-light",
           fill = FALSE,
           card_header(class = "card-header bg-primary",
                       "Data model"),
           p("The data model contains the specifications of the items to manage."),
           p("For each attribute, the data model carries information like its name and type, but also a method to determine its default value and logical values to indicate if it should be skipped in forms, filtered from the table view or used to sort the data.")),
      
      card(class = "border border-light",
           fill = FALSE,
           card_header(class = "card-header bg-primary",
                       "Items"),
           p("Items are stored in a data frame that fits with the data model rules."),
           p("That means the data model is implemented in all functions related to item management.")),
      
      card(class = "border border-light",
           fill = FALSE,
           card_header(class = "card-header bg-primary",
                       "Inputs & outputs"),
           p("A set of UI components is avaible to interact with the framework directly from the app."),
           tags$ul(
             tags$li("Item view: it displays the items in a data table"), 
             tags$li("Date slider: if a date attribute exists, an input it automatically generated"), 
             tags$li("Standard buttons: create, update, delete (contextual to the selection in the data table)"))),
      
      card(class = "border border-light",
           fill = FALSE,
           card_header(class = "card-header bg-primary",
                       "Admin console"),
           p("An admin console is delivered as a standalone Shiny app."),
           p("The reason is that in most cases, it’s not recommended to have the data model(s) management accessible from within the application."))),
    
    
    # -- Background section
    h2(class = "mt-5 mb-3",
       "Background"),
    
    # -- Architecture sub-section
    h3("Architecture"),
    p("The framework is delivered as a Shiny module that can be instanciated inside a Shiny server (or even as sub-module of a Shiny module server).", br(),
    "It makes it very flexible to use & allows multiple implementations since the module server returns a list of objects that can be used outside of it."),
  
    
    # -- Technical stack sub-section
    h3(class = "mt-5 mb-3",
       "Technical Stack"),
    layout_column_wrap(
      card(class = "border border-light",
           fill = FALSE,
           card_header(class = "card-header bg-primary",
                       "Framework"),
           p("R Package"),
           tags$ul(
             tags$li("R"),
             tags$li("Shiny"),
             tags$li("Shinydashboard, ShinyWidgets"),
             tags$li("DT, dplyr, ..."))),
      card(class = "border border-light",
           fill = FALSE,
           card_header(class = "card-header bg-primary",
                       "Admin console"),
           p("Standelone shiny app"),
           tags$ul(
             tags$li("R"),
             tags$li("Shiny"),
             tags$li("Shinydashboard, ShinyWidgets"))),
      card(class = "border border-light",
           fill = FALSE,
           card_header(class = "card-header bg-primary",
                       "CI / CD"),
           p("Documentation & testing"),
           tags$ul(
             tags$li("Testing: Testthat, Codecov, GitHub actions"),
             tags$li("Documentation: Quarto, GitHub Pages")))),
    
    
    # -- Deliverable section
    h2(class = "mt-5 mb-3",
       "Deliverables"),
    layout_column_wrap(
      card(class = "border border-light",
           fill = FALSE,
           card_header(class = "card-header bg-primary",
                       "Package"),
           p("The package is published on GitHub."),
           p("It can be installed using the install_github function from devtools package")),
      card(class = "border border-light",
           fill = FALSE,
           card_header(class = "card-header bg-primary",
                       "Documentation"),
           p("Documentation & articles are delivered through the GitHub pages mechanism (with automation).")),
      card(class = "border border-light",
           fill = FALSE,
           card_header(class = "card-header bg-primary",
                       "Communication"),
           p("A visual identity (logo & color scheme) as well as a set of presentations have been delivered to support the communication around the package (LinkedIn posts)."))),
    
    
    # -- Document section
    card(class = "border border-light",
         card_header("Project Presentation (one out of seven)"),
         tags$iframe(style="height:600px; width:100%", src = "project_media/motivations.pdf")),
    
    
    # -- Links section
    h2(class = "mt-5 mb-3",
       "Links"),
    layout_column_wrap(
      card(class = "border border-light",
           fill = FALSE,
           card_header("Repository"),
           p("The GitHub", icon("github"), "repository of the project"),
           tags$a(
             "kitems",
             target = "_blank",
             href = "https://github.com/thekangaroofactory/kitems")),
      
      card(class = "border border-light",
           fill = FALSE,
           card_header("Documentation & articles"),
           p("The GitHub page of the package"),
           tags$a(
             "kitems",
             target = "_blank",
             href = "https://thekangaroofactory.github.io/kitems/")))
    
  )
  
}
