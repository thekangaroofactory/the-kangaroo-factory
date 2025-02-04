

template_experience <- function(){
  
  tagList(
    
    # -- Template experience
    card(
      class = "d-flex bg-light",
      div(
        class = "flex-column",
        h3("Role description"),
        p(style ="font-style: italic;", "Quick description")),
      p(
        class = "ms-auto",
        "Start - End")),
    
    # -- main content
    layout_column_wrap(
      
      tagList(
        h4("Mission & Responsibilities"),
        p("Section"),
        tags$ul(
          tags$li("do this"),
          tags$li("do that")),
        p("Section"),
        tags$ul(
          tags$li("do this"),
          tags$li("do that")),
        p("Section"),
        tags$ul(
          tags$li("do this"),
          tags$li("do that"))),
      
      tagList(
        card(
          class = "border border-light",
          card_header("Specific"),
          card_body(
            tags$ul(
              tags$li("24x7x365 data flow"),
              tags$li("high management attention (comex)")))),
        card(
          class = "border border-light",
          card_header("Key figures"),
          card_body(
            tags$span(
              div(class = "badge tag", "56M CO2 computations"),
              div(class = "badge tag", "5 businesses"),
              div(class = "badge tag", "10 systems connected")))),
        card(
          class = "border border-light",
          card_header("Deliverables"),
          card_body(
            tags$ul(
              tags$li("this"),
              tags$li("that")))),
        card(
          class = "border border-light",
          card_header("Stack & tools"),
          card_body(
            tags$span(
              div(class = "badge tag", "Porwer.BI"),
              div(class = "badge tag", "Cloudera"),
              div(class = "badge tag", "Azure")))))))
  
}
