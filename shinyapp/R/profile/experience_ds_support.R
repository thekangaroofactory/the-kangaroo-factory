

experience_ds_support <- function(){
  
  # -- return
  tagList(
    
    # -- header card
    card(
      class = "bg-contrast",
      div(
        h3("Technical Support (Engineer, then Manager)"),
        p(style ="font-style: italic;", "Dassault Systèmes / 2002 - 2015"),
        p("Within the R&D Technical Customer Support, dedicated to Data Management (as an Engineer), 
        then Data Transition & Exchanges products (as a Manager) and assigned to production deployment projects."),
        div(class = "badge tag", "Data Management"),
        div(class = "badge tag", "Data Quality"),
        div(class = "badge tag", "Data Exchange"),
        div(class = "badge tag", "Deployment"))),
    
    
    # -- main content (2 columns)
    layout_column_wrap(
      
      # -- left column
      tagList(
        h4("Mission & Responsibilities"),
        p("Functional"),
        tags$ul(
          tags$li("Create customer references"),
          tags$li("Participate in customer workshops to collect business needs"),
          tags$li("Manage backlog to ensure technical convergence"),
          tags$li("Participate, then lead a transversal task force to drive product convergence efforts")),
        p("Project & Deployment"),
        tags$ul(
          tags$li("Participate, then lead follow-up meetings (internal and client)"),
          tags$li("Manage customer critical situations"),
          tags$li("Build convergence & recovery plans"),
          tags$li("Advocate customer & user views to the development teams")),
        p("Data Management"),
        tags$ul(
          tags$li("Implement data extraction, preparation & processing (transfer & migration)"),
          tags$li("Setup data processing strategies"),
          tags$li("Ensure data quality & lifecycle"),
          tags$li("Analyze and improve performances of the data pipelines"))),
      
      # -- right column
      tagList(
        card(
          class = "border border-light",
          card_header("Specificities"),
          card_body(
            tags$ul(
              tags$li("Product convergence"),
              tags$li("High management attention (comex)")))),
        
        # -- sub-columns
        layout_column_wrap(
          
          card(
            class = "border border-light",
            card_header("Key figures"),
            card_body(
              tags$span(
                div(class = "badge tag", "7 years as Engineer"),
                div(class = "badge tag", "7 years as Manager")))),
          
          card(
            class = "border border-light",
            card_header("Stack & tools"),
            card_body(
              tags$span(
                div(class = "badge tag", "ENOVIA"),
                div(class = "badge tag", "Oracle"),
                div(class = "badge tag", "SQL"))))),
        
        # -- deliverables
        card(
          class = "border border-light",
          card_header("Deliverables"),
          card_body(
            p("Products"),
            tags$ul(
              tags$li("Technical convergence (maturity)"),
              tags$li("Documentation of best practices")),
            p("Data Exchanges"),
            tags$ul(
              tags$li("3 references (Alstom, Claas, Miele)"),
              tags$li("Annual dashboard (areas for improvement)")),
            p("Data Management"),
            tags$ul(
              tags$li("1 reference customer (BMW)"),
              tags$li("Weekly code delivery")))))))
  
}
