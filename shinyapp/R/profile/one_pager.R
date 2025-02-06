

one_pager <- function(download = FALSE){
  
  # -- return
  card(
    class = "border-radius bg-contrast p-3 mt-2",
    
    # -- title
    card_header(
      class = "d-flex border-bottom-0",
      div(
        class = "flex-column",
        h2("Key Takeways"),
        p(style ="font-style: italic; font-weight: normal;", "One-page profile summary")),
      
      if(download)
        shiny::downloadLink(
          class = "ms-auto",
          outputId="download",
          label=tooltip(
            icon("file"),
            "Click to download Chart",
            placement = "right"))
      
      ),
    
    # -- content
    layout_columns(
      col_widths = c(6, 3, 3),
      
      # -- left
      card(
        
        h4("Presentation"),
        p("Since 2001, it has always been about data projects and technico-functional roles:", br(),
          "From Data Management, then Data Exchanges & Transformation to Data Analysis & Visualization", br(),
          "I enjoy working with complex data pipelines & carefully designed dashboards."),
        
        h4("Career path (20+ XP)"),
        card(
          fill = FALSE,
          img(src = "img/career_path_en.png"))),
      
      
      # -- middle
      tagList(
        
        h4("Data Expertise"),
        tags$ul(
          tags$li("Management & Governance"),
          tags$li("Quality"),
          tags$li("Pipelines & Transformation"),
          tags$li("Analysis & Visualization")),
        
        h4("Specific skills"),
        tags$ul(
          tags$li("Collect & advocate business needs"),
          tags$li("Full-Stack data approach"),
          tags$li("Speak same language as tech. teams"),
          tags$li("Problem solver")),
        
        h4("Specific domains"),
        tags$ul(
          tags$li("Transportation & logistic"),
          tags$li("CSR")),
        
        h4("Team management"),
        tags$ul(
          tags$li("35 people"))),
      
      # -- right
      tagList(
        
        h4("Key stack"),
        tags$ul(
          tags$li("R / Python"),
          tags$li("SQL")),
        
        h4("Key tools"),
        tags$ul(
          tags$li("Power.BI"),
          tags$li("Data Galaxy")),
        
        h4("Latest training"),
        tags$ul(
          tags$li("Generative AI with LLMs")),
        
        h4("Certifications & Degrees"),
        tags$ul(
          tags$li("Data Science & Machine Learning"),
          tags$li("Automotive Engineer (ESTACA)")),
        
        h4("Languages"),
        tags$ul(
          tags$li("French (native)"),
          tags$li("English (fluent)")))
      
    ))
  
  
}