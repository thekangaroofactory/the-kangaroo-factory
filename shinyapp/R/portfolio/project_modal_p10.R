

project_modal_p10 <- function(path){

  # -- add resource path
  my_path <- file.path(path, "philippeperet/portfolio/p10")
  addResourcePath(prefix = "project_media", directoryPath = my_path)
  
  # -- return wrapper
  tagList(
    
    # -- Project header section ------------------------------------------------
    h1("CSR API & Tools"),
    p("A set of tools to support CSR business needs at GEODIS"),
    
    
    # -- Project info section
    layout_column_wrap(class = "mt-5",
                       value_box(class = "tkf-bg-camel border border-light",
                                 showcase = icon("window-restore"),
                                 theme = value_box_theme(bg = "#726d67", fg = "#d9cec2"),
                                 title = "Project Type",
                                 value = "Tools",
                                 p("API & Web apps")),
                       
                       value_box(class = "tkf-bg-camel border border-light",
                                 showcase = icon("toolbox"),
                                 theme = value_box_theme(bg = "#726d67", fg = "#d9cec2"),
                                 title = "Tools",
                                 value = "3",
                                 p("1 API & 2 Apps")),
                       
                       value_box(class = "tkf-bg-camel border border-light",
                                 showcase = icon("lock"),
                                 theme = value_box_theme(bg = "#726d67", fg = "#d9cec2"),
                                 title = "Visibility",
                                 value = "Private",
                                 p("Based on company authentication"))),
    
    
    # -- About section ---------------------------------------------------------
    h2(class = "section",
       "About the Project"),
    
    # -- text
    tagList(
      p("This project was part of a one-year mission as a CSR Data Project Manager at", a(href = "https://geodis.com", target = "_blank", "GEODIS"), "."),
      p("These tools were delivered to support the businesses."),
    

    # -- Features section ------------------------------------------------------
    h2(class = "section",
       "Tools"),
    layout_column_wrap(
      
      card(class = "border border-light",
           fill = FALSE,
           card_header("REST API"),
           p("A REST API was delivered to support business needs around low carbon offers.")),
      
      card(class = "border border-light",
           fill = FALSE,
           card_header("Carbon Compensation"),
           p("A tool requested by one of the Business Unit to compute cost from CO₂ emissions.")),
      
      card(class = "border border-light",
           fill = FALSE,
           card_header("Service Monitoring"),
           p("To cover internal IT needs & help monitor the 24 x 7 x 365 service."))),
    
    
    # -- Background section ----------------------------------------------------
    h2(class = "section",
       "Background"),
    
    # -- Technical stack sub-section
    h3(class = "mt-5 mb-3",
       "Architecture"),
    
    # -- Technical stack sub-section
    card(
      class = "tkf-bg-camel mt-5",
      h3("Technical Stack"),
      layout_column_wrap(
        card(
          card_header("REST API"),
          tags$ul(
            tags$li("Python"),
            tags$li("Azure API Management"),
            tags$li("Postman"))),
        card(
          card_header("Service Monitoring"),
          tags$ul(
            tags$li("R"),
            tags$li("Shiny"))))),
    
    
    # -- Deliverable section ---------------------------------------------------
    h2(class = "section",
       "Deliverables"),
    
    p("In addition to the tools themselves."),
    
    layout_column_wrap(
      card(
        class = "border border-light",
        card_header("Architecture"),
        p("The API was delivered along with a target architecture to organize a portfolio of services.")),
      card(
        class = "border border-light",
        card_header("Communication"),
        p("Workshops were organized to mutualize needs (& cost) for the carbon compensation tool.")))
    
    )

  )
  
}
