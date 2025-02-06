

experience_ds_qa <- function(){
  
  # -- return
  tagList(
    
    # -- header card
    card(
      class = "bg-contrast",
      div(
        h3("QA Leader & Transition Manager"),
        p(style ="font-style: italic;", "Dassault Systèmes / 2016 - 2019"),
        p("Within the R&D organization, as a QA Leader for Legacy Servers, Data Transition & Exchanges products and Team Manager."),
        div(class = "badge tag", "Data Management"),
        div(class = "badge tag", "Data Exchange"),
        div(class = "badge tag", "Quality"))),
    
    
    # -- main content (2 columns)
    layout_column_wrap(
      
      # -- left column
      tagList(
        h4("Mission & Responsibilities"),
        p("QA Leader"),
        tags$ul(
          tags$li("Be responsible for the quality of Data Management & Exchanges products"),
          tags$li("Build and deploy strategy to solve critical program convergence"),
          tags$li("Implement decision support tools to anticipate program drift"),
          tags$li("Plan and deploy test automation strategy (DevOps)")),
        p("Team Transformation"),
        tags$ul(
          tags$li("Transform mission & roles inside the team (to prepare for automation)"),
          tags$li("Career development (delegate, coach on communication)"),
          tags$li("Turn team & network culture towards a proactive approach")),
        p("Data Project"),
        tags$ul(
          tags$li("Analyse root causes why objectives and expectations were not met"),
          tags$li("Build and deploy a complete change of strategy"),
          tags$li("Setup a communication process to build support for the project"))),
      
      # -- right column
      tagList(
        card(
          class = "border border-light",
          card_header("Specific"),
          card_body(
            tags$ul(
              tags$li("Transformation")))),
        
        # -- sub-columns
        layout_column_wrap(
          
          card(
            class = "border border-light",
            card_header("Key figures"),
            card_body(
              tags$span(
                div(class = "badge tag", "35 people (France & India)"),
                div(class = "badge tag", "5 products")))),
          
          card(
            class = "border border-light",
            card_header("Stack & tools"),
            card_body(
              tags$span(
                div(class = "badge tag", "ENOVIA"),
                div(class = "badge tag", "BI"),
                div(class = "badge tag", "Python"),
                div(class = "badge tag", "SQL"),
                div(class = "badge tag", "Sikuli"))))),
        
        # -- deliverable
        card(
          class = "border border-light",
          card_header("Deliverables"),
          card_body(
            p("QA Leader"),
            tags$ul(
              tags$li("Product & data quality assessments"),
              tags$li("GO/NOGO for product delivery")),
            p("Team & Operations"),
            tags$ul(
              tags$li("2 Dashboards (Testers / Managers)"),
              tags$li("Methodology and KPIs to detect activity drift")),
            p("Automation"),
            tags$ul(
              tags$li("QA test automation framework")))))))
  
}
