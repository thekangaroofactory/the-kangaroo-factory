

experience_geodis <- function(){
  
  # -- return
  tagList(
    
    # -- header card
    card(
      class = "bg-contrast",
      div(
        h3("CSR Data Project Manager"),
        p(style ="font-style: italic;", "GEODIS / Oct.2022 - 2023"),
        p("Within the Corporate Digital & Technology organization, dedicated to
          the strategic CSR activities around the CO", tags$sub("2", , .noWS = c("before")), "emission calculation & Science Based Target Initiative."),
        div(class = "badge tag", "CSR"),
        div(class = "badge tag", "Logistic"))),
    
    
    # -- main content (2 columns)
    layout_column_wrap(
      
      # -- left colum
      tagList(
        h4("Mission & Responsibilities"),
        p("Functional"),
        tags$ul(
          tags$li("Support CSR & Business Teams around the technical usage of the APIs"),
          tags$li("Monitor data flow & CO", tags$sub("2", , .noWS = c("before")), "emission calculation infrastructure"),
          tags$li("Capture technical needs around emission calculation (ex: low carbon offers)"),
          tags$li("Follow-up meetings with the teams & external supplier")),
        p("Project Management"),
        tags$ul(
          tags$li("Catpure the CO", tags$sub("2", , .noWS = c("before")), "calculation flow into the Datalake"),
          tags$li("Deliver a dashboard to monitor the quality of the CO", tags$sub("2", , .noWS = c("before")), "computations"),
          tags$li("Define and implement a common architecture around the CO", tags$sub("2", , .noWS = c("before")), "calculation services"),
          tags$li("Build roadmap & budget, organize follow-up meetings, streering comittees, workshops")),
        p("Data & Analysis"),
        tags$ul(
          tags$li("Act as a proxy Data Owner, on behalf of the CSR Organization"),
          tags$li("Write datalake ingestion validation script"),
          tags$li("Perform data analysis to support the businesses and CSR teams"),
          tags$li("Participate to governance data catalog initiative"))),
      
      # -- right column
      tagList(
        card(
          class = "border border-light",
          card_header("Specific"),
          card_body(
            tags$ul(
              tags$li("24 x 7 x 365 data flow"),
              tags$li("High management attention (comex)")))),
        
        # -- sub-columns
        layout_column_wrap(
          
          card(
            class = "border border-light",
            card_header("Key figures"),
            card_body(
              tags$span(
                div(class = "badge tag", "56M CO", tags$sub("2", , .noWS = c("before")), "calculation / year"),
                div(class = "badge tag", "5 lines of Business"),
                div(class = "badge tag", "4 regions"),
                div(class = "badge tag", "10 systems connected"),
                div(class = "badge tag", "4 computation streams")))),
          
          card(
            class = "border border-light",
            card_header("Stack & tools"),
            card_body(
              tags$span(
                div(class = "badge tag", "Cloudera"),
                div(class = "badge tag", "HIVE"),
                div(class = "badge tag", "SQL"),
                div(class = "badge tag", "Porwer.BI"),
                div(class = "badge tag", "Azure"),
                div(class = "badge tag", "API"),
                div(class = "badge tag", "R"),
                div(class = "badge tag", "Data Galaxy"),
                div(class = "badge tag", "EcoTransIT"))))),
        
        # -- deliverables
        card(
          class = "border border-light",
          card_header("Deliverables"),
          card_body(
            p("Datalake & Dashboard"),
            tags$ul(
              tags$li("CSR Datalake (100k to 300k ingestions daily)"),
              tags$li("CSR Data Quality Dashboard (errors & anomalies)")),
            p("Architecture & Tools"),
            tags$ul(
              tags$li("Target Architecture (REST API Portal)"),
              tags$li("2 Tools (Service monitoring, Carbon Compensation Cost)"),
              tags$li("1 API (low carbon offers support)")),
            p("Data Analysis & Governance"),
            tags$ul(
              tags$li("Shipment calculation flow analysis (800k dataset)"),
              tags$li("Data lineage in Data Galaxy")))))))
  
}
