

project_modal_p11 <- function(path){

  # -- add resource path
  my_path <- file.path(path, "philippeperet/portfolio/p11")
  addResourcePath(prefix = "project_media", directoryPath = my_path)
  
  # -- return wrapper
  tagList(
    
    # -- Project header section ------------------------------------------------
    h1("Data Analyst Mentor"),
    p("As part of a certified program at OpenClassrooms"),
    
    
    # -- Project info section
    layout_column_wrap(class = "mt-5",
                       value_box(class = "tkf-bg-camel border border-light",
                                 showcase = icon("window-restore"),
                                 theme = value_box_theme(bg = "#726d67", fg = "#d9cec2"),
                                 title = "Project Type",
                                 value = "Mentoring",
                                 p("Since 2022")),
                       
                       value_box(class = "tkf-bg-camel border border-light",
                                 showcase = icon("graduation-cap"),
                                 theme = value_box_theme(bg = "#726d67", fg = "#d9cec2"),
                                 title = "Students",
                                 value = "3",
                                 p("One-year support")),
                       
                       value_box(class = "tkf-bg-camel border border-light",
                                 showcase = icon("unlock"),
                                 theme = value_box_theme(bg = "#726d67", fg = "#d9cec2"),
                                 title = "Visibility",
                                 value = "Public",
                                 p("The program is available online"))),
    
    
    # -- About section ---------------------------------------------------------
    h2(class = "section",
       "About the Project"),
    
    # -- text
    tagList(
      p("The mentoring activity is performed as part of the Data Analyst program delivered by OpenClassrooms.", br(),
        "It's a one-year (~800h) certified program (RNCP level 6).")),
    

    # -- Features section ------------------------------------------------------
    h2(class = "section",
       "Activities"),
    layout_column_wrap(
      
      card(class = "border border-light",
           fill = FALSE,
           card_header("Projects"),
           p("Support students in working on practical data analysis projects.")),
      
      card(class = "border border-light",
           fill = FALSE,
           card_header("Exams"),
           p("Support students during the preparation phase of the exams at the end of each project."))),
    
    
    # -- Background section ----------------------------------------------------
    h2(class = "section",
       "Background"),
    
    p("The program involves working with various tools to cover popular skills required by companies."),
    
    # -- Technical stack sub-section
    card(
      class = "tkf-bg-camel mt-5",
      h3("Technical Stack"),
      layout_column_wrap(
        card(
          card_header("Languages"),
          tags$ul(
            tags$li("Python"),
            tags$li("R"),
            tags$li("SQL"))),
        card(
          card_header("Workflows & BI"),
          tags$ul(
            tags$li("Power.BI"),
            tags$li("Tableau"),
            tags$li("KNIME"))))),
    
    
    # -- Links section ---------------------------------------------------------
    card(
      class = "tkf-bg-camel section",
      h2("Links"),
      layout_column_wrap(
        card(card_header("Program"),
             p("The page of the program on OpenClassrooms."),
             tags$a(
               'data-value' = "link_p11_oc",
               "Data Analyst",
               target = "_blank",
               href = "https://openclassrooms.com/paths/1040-data-analyst")),
        card(card_header("Certification"),
             p("The official RNCP certification."),
             tags$a(
               'data-value' = "link_p11_rncp",
               "RNCP Certification",
               target = "_blank",
               href = "https://www.francecompetences.fr/recherche/rncp/37837/"))))

  )
  
}
