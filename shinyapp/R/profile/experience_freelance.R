

experience_freelance <- function(){
  
  # -- return
  tagList(
    
    # -- header card
    card(
      class = "bg-contrast",
      div(
        h3("Technical Data Expert"),
        p(style ="font-style: italic;", "Freelance / Since 2020"),
        p("As a freelance worker, to maintain a transversal data knowledge that can support both functional & technical sides of complex data projects."),
        div(class = "badge tag", "data quality"),
        div(class = "badge tag", "data analysis"),
        div(class = "badge tag", "data visualization"))),
    
    
    # -- main content (2 columns)
    layout_column_wrap(
      
      # -- left column
      tagList(
        h4("Mission & Responsibilities"),
        p("Coaching & Training"),
        tags$ul(
          tags$li("Mentorship @OpenClassrooms on the Data Analyst program"),
          tags$li("Support students with projects & exams"),
          tags$li("Advocate data culture within business organizations")),
        p("Data pipelines"),
        tags$ul(
          tags$li("Automate data pipelines (collection, cleaning & transformation)"),
          tags$li("Design & develop APIs")),
        p("Tools & Dashboards"),
        tags$ul(
          tags$li("Produce data analysis & visualizations"),
          tags$li("Design & develop tools (Dashboards, Maps, Web apps)"),
          tags$li("Develop R packages"))),
      
      # -- right column
      tagList(
        card(
          class = "border border-light",
          card_header("Specificities"),
          card_body(
            tags$ul(
              tags$li("R / Shiny expert"),
              tags$li("Full-Stack data approach")))),
        
        # -- sub-columns
        layout_column_wrap(
          
          card(
            class = "border border-light",
            card_header("Key figures"),
            card_body(
              tags$span(
                div(class = "badge tag", "9.8K visits on data.gouv.fr"),
                div(class = "badge tag", "1 graduated student"),
                div(class = "badge tag", "40 GitHub repos.")))),
          
          card(
            class = "border border-light",
            card_header("Stack & tools"),
            card_body(
              tags$span(
                div(class = "badge tag", "R"),
                div(class = "badge tag", "Shiny"),
                div(class = "badge tag", "Python"),
                div(class = "badge tag", "SQL"),
                div(class = "badge tag", "Docker"),
                div(class = "badge tag", "GCP"),
                div(class = "badge tag", "AWS"))))),
        
        # -- deliverable
        card(
          class = "border border-light",
          card_header("Deliverables"),
          card_body(
            p("GEODIS"),
            tags$ul(
              tags$li("Datalake validation scripts"),
              tags$li("Monitoring tool (webapp)"),
              tags$li("CO",tags$sub("2", , .noWS = c("before")),"computation flow analysis")),
            p("Tools & Apps"),
            tags$ul(
              tags$li("Election data visualization tool"),
              tags$li("ML monitoring dashboard")),
            p("R Package"),
            tags$ul(
              tags$li("Tabular data management framework"),
              tags$li("Admin console, demo apps")))))))
  
}
