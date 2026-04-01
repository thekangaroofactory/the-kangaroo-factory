

service_ui <- function(id){
  
  # -- namespace
  ns <- NS(id)
  
  # -- return
  tagList(
    
    h1("Technical-Functional Data Services"),
    p(class="subtitle", "Backed by", as.numeric(format(Sys.Date(), "%Y")) - 2001, "years of data experience."),
    
    # -- contact me
    div(
      class = "mt-5",
      actionButton(
        class = "ktag",
        inputId = ns("switch_contact"),
        label = "Contact me")),
    
    # -- intro
    p(class = "mt-5", "Services are organized into three main axes — each of them involves a combination of technical-functional skills."),
    
    
    # //////////////////////////////////////////////////////////////////////////
    # main layout
    
    layout_column_wrap(
      class = "mt-5",
      
      # -- functional ----------------------------------------------------------
      tagList(
        h2("Functional Services"),
        
        tags$ul(
          tags$li("Data Project Management"),
          tags$li("Architecture (portfolio, apps, data flow)"),
          tags$li("Quality Assessment"),
          tags$li("Transformation")),
        
        # -- link to projects
        div(
          class = "mt-3",
          style = "display: inline-block;",
          actionButton(
            class = "ktag",
            inputId = ns("switch_project"),
            label = "See projects")),
        
        # -- camel card
        card(
          class = "border-radius tkf-bg-camel color-dark p-3",
          card_header("Specificities"),
          p("Technical-functional approach"),
          tags$ul(
            tags$li("Speak same language as both business & technical teams"),
            tags$li("Perform technical tasks if/when necessary"),
            tags$li("Team management experience"))),
        
        # -- camel card
        card(
          class = "border-radius tkf-bg-camel color-dark p-3",
          card_header("Reliable systems"),
          p("Strong experience in"),
          tags$ul(
            tags$li("Data quality"),
            tags$li("Reproducible pipelines (collection, cleaning, transformation)")))),
      
      
      # -- mentoring -----------------------------------------------------------
      tagList(
        h2("Mentoring Services"),
        
        tags$ul(
          tags$li("Coaching & mentoring"),
          tags$li("Training development"),
          tags$li("Capitalization"),
          tags$li("Content creation")),
        
        # -- link to projects
        div(
          class = "mt-3",
          style = "display: inline-block;",
          actionButton(
            class = "ktag",
            inputId = ns("switch_blog"),
            label = "See blog"),
          actionButton(
            class = "ktag",
            inputId = ns("switch_wiki"),
            label = "See wiki")),
        
        # -- camel card
        h4("References"),
        tags$ul(
          tags$li("OpenClassrooms", 
                  tags$a(href = "https://openclassrooms.com/paths/1040-data-analyst", target = "_blank", "Data Analyst"), "program (Mentor)"),
          tags$li(tags$a(id = "services-link_shinyconf", class = "ktag", href = "https://www.shinyconf.com/", target = "_blank", "ShinyConf2025"), "(Speaker)"),
          tags$li(tags$a(id = "services-link_ebook", class = "ktag", href = "https://thekangaroofactory.github.io/communication-between-shiny-modules/", target = "_blank", "Mastering Communication Between Shiny Modules"),
                  "eBook (Author)"))),
      
      
      # -- technical -------------------------------------------------------
      tagList(
        h2("Technical Services"),
        
        tags$ul(
          tags$li("Data analysis & visualizations"),
          tags$li("APIs, dashboards & web applications"),
          tags$li("Packages & documentation"),
          " "),
        
        # -- link to portfolio
        div(
          class = "mt-5",
          style = "display: inline-block;",
          actionButton(
            class = "ktag",
            inputId = ns("switch_lab"),
            label = "See lab")),
        
        # -- apps & tools
        card(
          class = "border-radius tkf-bg-camel color-dark p-3",
          fill = FALSE,
          card_header("R Package"),
          p("The {", span(style = "font-weight: bold;", "kitems"), "} package provides a framework to manage data frame items within R / Shiny apps."),
          p("Visit the", tags$a(id = "services-link_kitems_doc", class = "ktag", style = "color:var(--tkf-color-dark);", href = "https://thekangaroofactory.github.io/kitems/", target = "_blank", "website.")))))
    
  )
  
}
