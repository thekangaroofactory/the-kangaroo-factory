

project_modal_p9 <- function(path){

  # -- add resource path
  my_path <- file.path(path, "philippeperet/portfolio/p9")
  addResourcePath(prefix = "project_media", directoryPath = my_path)
  
  # -- return wrapper
  tagList(
    
    # -- Project header section ------------------------------------------------
    h1("CSR Datalake"),
    p("A data layer to centralize CO₂ emission calculation data"),
    
    
    # -- Project info section
    layout_column_wrap(class = "mt-5",
                       value_box(class = "bg-tkf border border-light",
                                 showcase = icon("window-restore"),
                                 theme = value_box_theme(bg = "#726d67", fg = "#d9cec2"),
                                 title = "Project Type",
                                 value = "Datalake",
                                 p("Cloudera CDP")),
                       
                       value_box(class = "bg-tkf border border-light",
                                 showcase = icon("database"),
                                 theme = value_box_theme(bg = "#726d67", fg = "#d9cec2"),
                                 title = "Big data",
                                 value = "~ 150k",
                                 p("Daily ingestions")),
                       
                       value_box(class = "bg-tkf border border-light",
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
      p("The CSR datalake was primarily built to serve data to the CSR Dashboard.", br(),
        "It also allows to query and extract datasets to perform data analysis and provide insight to the business teams.")),
    

    # -- Features section ------------------------------------------------------
    h2(class = "section",
       "Features"),
    
    p("The data are captured from the CO₂ emission calculation flow (toward an external API)."),
    
    layout_column_wrap(
      
      card(class = "border border-light",
           fill = FALSE,
           card_header("Ingestion"),
           p("Scheduled jobs perform the capture & ingestions as the computation flow runs 24 x 7 x 365.")),
      
      card(class = "border border-light",
           fill = FALSE,
           card_header("Transformation"),
           p("The data are going through a classic set of raw / technical / functional tables."))),
    
    
    # -- Background section ----------------------------------------------------
    h2(class = "section",
       "Background"),
    
    # -- Technical stack sub-section
    h3(class = "mt-5 mb-3",
       "Architecture"),
    p("The datalake runs on a Cloudera CDP plateform."),
    
    # -- Technical stack sub-section
    card(
      class = "bg-tkf mt-5",
      h3("Technical Stack"),
      layout_column_wrap(
        card(
          card_header("Datalake"),
          p("Ingestions"),
          tags$ul(
            tags$li("Cloudera CDP"),
            tags$li("Kafka"))),
        card(
          card_header("Datalake"),
          p("Validation"),
          tags$ul(
            tags$li("Cloudera CDP"),
            tags$li("Hive (SQL)"),
            tags$li("R"))))),
    
    
    # -- Deliverable section ---------------------------------------------------
    h2(class = "section",
       "Deliverables"),
    layout_column_wrap(
      card(
        class = "border border-light",
        card_header("CSR Dalalake"),
        p("The data layer delivered on the Cloudera CDP plateform.")),
      card(
        class = "border border-light",
        card_header("Validation Scripts"),
        p("R scripts to run on SQL extracts as User Acceptance Tests.")),
      card(
        class = "border border-light",
        card_header("Data Analysis"),
        p("An analysis performed with R on a 800k rows dataset."))),
    
  )
  
}
