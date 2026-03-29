

about_ui <- function(id){
  
  # -- namespace
  ns <- NS(id)
  
  # -- wrap & return
  tagList(
    
    h1("About me"),
    
    div(
      class = "mb-5",
      layout_columns(
        tagList(
          p(class = "mt-5", "I am a Senior Data Project Manager with a technical-functional background."),
          p("Since 2001, it has always been about data projects and technical-functional roles:", br(),
            "From Data Management, Exchanges & Transformation to Data Analysis & BI."),
          p("I enjoy working with complex data pipelines & carefully designed dashboards."),
          p("I do photography as a hobby", a(href = "https://www.thediamondbay.fr/", target = "_blank", "www.thediamondbay.fr"), "and I traveled around the world for a year.")),
        
        tags$image(width = "200px", src = "./img/profile.png", alt = "Avatar"))),
    
    # -- grid
    layout_column_wrap(    
      card(
        class = "border-radius tkf-bg-camel color-dark p-3",
        h4(style = "margin-top: 0.5rem;", "Specific Domains"),
        tags$ul(
          tags$li("Transportation & logistic"),
          tags$li("CSR"))),
      card(
        class = "border-radius tkf-bg-camel color-dark p-3",
        h4(style = "margin-top: 0.5rem;", "Specific skills"),
        tags$ul(
          tags$li("Speak same language as tech. teams"),
          tags$li("Agile & problem solver mindset"))),
      card(
        class = "border-radius tkf-bg-camel color-dark p-3",
        h4(style = "margin-top: 0.5rem;", "Languages"),
        tags$ul(
          tags$li("French (native)"),
          tags$li("English (fluent / C1)")))),
    
    
    # -- Resume ----------------------------------------------------------------
    h2(class = "section",
       "Stack"),
    
    p(class = "mt-5",
      "Here you can find the key (i.e. not exhaustive) tools I'm using in", paste0(format(Sys.Date(), "%Y"), "."), br(),
      "Note that I mainly use R for my own developments & Python on the Data Analyst program & for AI."), br(),
    
    # -- badges
    layout_column_wrap(
      
      # -- badge group
      card(
        class = "border",
        fill = FALSE,
        card_header("App & dashboard"),
        card_body(
          tags$span(
            div(class = "badge tag tkf-bg-accent color-dark", "Shiny"),
            div(class = "badge tag tkf-bg-accent color-dark", "bslib")))),
      
      # -- badge group
      card(
        class = "border",
        fill = FALSE,
        card_header("Data engineering"),
        card_body(
          tags$span(
            div(class = "badge tag tkf-bg-accent color-dark", "dplyr"),
            div(class = "badge tag tkf-bg-accent color-dark", "data.table")))),
      
      # -- badge group
      card(
        class = "border",
        fill = FALSE,
        card_header("Data visualization"),
        card_body(
          tags$span(
            div(class = "badge tag tkf-bg-accent color-dark", "ggplot2"),
            div(class = "badge tag tkf-bg-accent color-dark", "leaflet"),
            div(class = "badge tag tkf-bg-accent color-dark", "Power.BI"),
            div(class = "badge tag tkf-bg-accent color-dark", "Tableau")))),
      
      # -- badge group
      card(
        class = "border",
        fill = FALSE,
        card_header("API & database"),
        card_body(
          tags$span(
            div(class = "badge tag tkf-bg-accent color-dark", "plumber"),
            div(class = "badge tag tkf-bg-accent color-dark", "RCurl"),
            div(class = "badge tag tkf-bg-accent color-dark", "DBI"),
            div(class = "badge tag tkf-bg-accent color-dark", "RPostgres")))),
      
      # -- badge group
      card(
        class = "border",
        fill = FALSE,
        card_header("Database"),
        card_body(
          tags$span(
            div(class = "badge tag tkf-bg-accent color-dark", "SQL"),
            div(class = "badge tag tkf-bg-accent color-dark", "PostgreSQL")))),
      
      # -- badge group
      card(
        class = "border",
        fill = FALSE,
        card_header("Test & documentation"),
        card_body(
          tags$span(
            div(class = "badge tag tkf-bg-accent color-dark", "testthat"),
            div(class = "badge tag tkf-bg-accent color-dark", "quarto"),
            div(class = "badge tag tkf-bg-accent color-dark", "pkgdown")))),
      
      # -- badge group
      card(
        class = "border",
        fill = FALSE,
        card_header("Machine Learning"),
        card_body(
          tags$span(
            div(class = "badge tag tkf-bg-accent color-dark", "tensorflow"),
            div(class = "badge tag tkf-bg-accent color-dark", "keras")))),
      
      # -- badge group
      card(
        class = "border",
        fill = FALSE,
        card_header("Clouds"),
        card_body(
          tags$span(
            div(class = "badge tag tkf-bg-accent color-dark", "Azure"),
            div(class = "badge tag tkf-bg-accent color-dark", "Cloudera"),
            div(class = "badge tag tkf-bg-accent color-dark", "Posit Connect"),
            div(class = "badge tag tkf-bg-accent color-dark", "Supabase"))))),
      
    
    
    # -- Resume ----------------------------------------------------------------
    h2(class = "section",
       "Resume"),
    
    p("In case you'd like to know more about my career path, here's my full resume."), br(),
    uiOutput(ns("resume")),
    
    
    # -- Certifications & Degrees ----------------------------------------------
    h2(class = "section",
       "Certifications & Degree"),
    
    card(
      class = "border-radius tkf-bg-camel p-3",
      
      layout_column_wrap(
        
        card(
          card_header("Latest"),
          tags$ul(
            tags$li("Generative AI with LLMs (2024)"),
            tags$li("Introduction to REACT (2026)"))),
        
        card(
          card_header("2023"),
          tags$ul(
            tags$li("AI For Good (Public Health & Climate Change)"))),
        
        card(
          card_header("2020 / 2021 (660h)"),
          tags$ul(
            tags$li("Data Science | Johns Hopkins University"),
            tags$li("Machine Learning | Stanford University"))),
        
        card(
          card_header("2000"),
          tags$ul(
            tags$li("Automotive Engineer | ESTACA"))))),
    
  )
  
}
