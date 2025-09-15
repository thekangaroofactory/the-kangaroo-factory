

project_modal_p8 <- function(path){

  # -- add resource path
  my_path <- file.path(path, "philippeperet/portfolio/p8")
  addResourcePath(prefix = "project_media", directoryPath = my_path)
  
  # -- return wrapper
  tagList(
    
    # -- Project header section ------------------------------------------------
    h1("CSR Dashboard"),
    p("CO₂ emission calculation quality dashboard"),
    
    
    # -- Project info section
    layout_column_wrap(class = "mt-5",
                       value_box(class = "tkf-bg-camel border border-light",
                                 showcase = icon("window-restore"),
                                 theme = value_box_theme(bg = "#726d67", fg = "#d9cec2"),
                                 title = "Project Type",
                                 value = "Dashboard",
                                 p("Power.BI dashboard deployed on Azure")),
                       
                       value_box(class = "tkf-bg-camel border border-light",
                                 showcase = icon("calculator"),
                                 theme = value_box_theme(bg = "#726d67", fg = "#d9cec2"),
                                 title = "Big data",
                                 value = "56 M",
                                 p("CO₂ calculation per year")),
                       
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
      p("The goal of this dashboard is to monitor the quality of the CO₂ calculation flow for the shipments.", br(),
        "It is part of an emission reduction strategy, based on the", a(href = "https://sciencebasedtargets.org/", 
                                                                        target = "_blank", "SBTi"), "framework.")),
    

    # -- Features section ------------------------------------------------------
    h2(class = "section",
       "Features"),
    
    p("The dashboard delivers views based on the business unit of the user.", br(),
      "Detailed tables can be downloaded to study a specific subset of the data."),
    
    layout_column_wrap(
      
      card(class = "border border-light",
           fill = FALSE,
           card_header("Errors"),
           p("First objective is to track calculation errors, allowing to identify areas for improvement with top errors and trends.")),
      
      card(class = "border border-light",
           fill = FALSE,
           card_header("Anomalies"),
           p("A second objective is to detect anomalies, to improve the overall quality of the calculation."))),
    
    
    # -- Background section ----------------------------------------------------
    h2(class = "section",
       "Background"),
    
    # -- Technical stack sub-section
    h3(class = "mt-5 mb-3",
       "Architecture"),
    p("The dashboard is delivered as a web application available on Azure.", br(),
      "It is refreshed on daily basis."),
    
    # -- Technical stack sub-section
    card(
      class = "tkf-bg-camel mt-5",
      h3("Technical Stack"),
      layout_column_wrap(
        card(
          card_header("Front-end"),
          p("Dashboard"),
          tags$ul(
            tags$li("Power.BI"),
            tags$li("Azure"))),
        card(
          card_header("Back-end"),
          p("Dataset"),
          tags$ul(
            tags$li("Cloudera CDP"),
            tags$li("Spark"))))),
    
    
    # -- Deliverable section ---------------------------------------------------
    h2(class = "section",
       "Deliverables"),
    layout_column_wrap(
      card(
        class = "border border-light",
        card_header("Dashboard"),
        p("The dashboard with errors & anomalies, delivered on the Azure cloud platform.")),
      card(
        class = "border border-light",
        card_header("Documents"),
        p("Specs, mockup and communication documents have been created with the CSR business & Power.BI teams to support the project."))),

  )
  
}
