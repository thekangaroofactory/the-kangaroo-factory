

project_modal_p7 <- function(path){

  # -- add resource path
  my_path <- file.path(path, "philippeperet/portfolio/p7")
  addResourcePath(prefix = "project_media", directoryPath = my_path)
  
  # -- return wrapper
  tagList(
    
    # -- Project header section ------------------------------------------------
    h1("Mastering Communication between Shiny Modules"),
    p("Research & book"),
    
    
    # -- Project info section
    layout_column_wrap(class = "mt-5",
                       value_box(class = "tkf-bg-camel border border-light",
                                 showcase = icon("book"),
                                 theme = value_box_theme(bg = "#726d67", fg = "#d9cec2"),
                                 title = "Project Type",
                                 value = "Book",
                                 p("Available online")),
                       
                       value_box(class = "tkf-bg-camel border border-light",
                                 showcase = icon("github"),
                                 theme = value_box_theme(bg = "#726d67", fg = "#d9cec2"),
                                 title = "Resources",
                                 value = "16",
                                 p("Code templates delivered")),
                       
                       value_box(class = "tkf-bg-camel border border-light",
                                 showcase = icon("unlock"),
                                 theme = value_box_theme(bg = "#726d67", fg = "#d9cec2"),
                                 title = "Visibility",
                                 value = "Public",
                                 p("The access is public"))),
    
    
    # -- About section ---------------------------------------------------------
    h2(class = "section",
       "About the Project"),
    
    # -- text
    tagList(
      p("This book was written based on research work around the communication between R / Shiny modules.", br(),
        "It has built the foundation architecture used in the {", a(href = "https://thekangaroofactory.github.io/kitems/", target = "_blank", "kitems"), "} package.")),
    

    # -- Features section ------------------------------------------------------
    h2(class = "section",
       "Parts"),
    layout_column_wrap(
      
      card(class = "border border-light",
           fill = FALSE,
           card_header("Communication"),
           p("The first part of the book deals with the flows of communication."),
           card_image(
             src = "project_media/screenshot_1.jpg",
             alt = "Screenshot")),
      
      card(class = "border border-light",
           fill = FALSE,
           card_header("Architecture"),
           p("The book also delivers a proposal to be used as a base architecture for data oriented applications."),
           card_image(
             src = "project_media/screenshot_2.jpg",
             alt = "Screenshot"))),
    
    
    # -- Background section ----------------------------------------------------
    h2(class = "section",
       "Background"),
    
    # -- Technical stack sub-section
    h3(class = "mt-5 mb-3",
       "Architecture"),
    p("The layout is based on Quarto and has embedded R code.", br(),
      "It's built and published automatically based on GitHub actions."),
    
    # -- Technical stack sub-section
    card(
      class = "tkf-bg-camel mt-5",
      h3("Technical Stack"),
      layout_column_wrap(
        card(
          card_header("Book"),
          p("Layout"),
          tags$ul(
            tags$li("Quarto"),
            tags$li("R"))),
        card(
          card_header("CI/CD"),
          p("Automated tasks"),
          tags$ul(
            tags$li("Quarto"),
            tags$li("GitHub actions"),
            tags$li("GitHub pages"))))),
    
    
    # -- Deliverable section ---------------------------------------------------
    h2(class = "section",
       "Deliverables"),
    layout_column_wrap(
      card(
        class = "border border-light",
        fill = FALSE,
        card_header("Book"),
        p("The book is available online.")),
      card(
        class = "border border-light",
        card_header("Templates"),
        p("A GitHub repository is also delivered with all the code examples used in the book."),
        card_image(
          src = "project_media/screenshot_3.jpg",
          alt = "Screenshot"))),
    
    
    # -- Links section ---------------------------------------------------------
    card(
      class = "tkf-bg-camel section",
      h2("Links"),
      layout_column_wrap(
        card(card_header("Book"),
             p("Online version of the book."),
             tags$a(
               'data-value' = "link_p7_book",
               "Mastering Communication between Shiny Modules",
               target = "_blank",
               href = "https://thekangaroofactory.github.io/communication-between-shiny-modules/")),
        card(card_header("Templates"),
             p("The code examples used in the book."),
             tags$a(
               'data-value' = "link_p7_templates",
               "Code templates",
               target = "_blank",
               href = "https://github.com/thekangaroofactory/template-r-shiny-communication"))))

  )
  
}
