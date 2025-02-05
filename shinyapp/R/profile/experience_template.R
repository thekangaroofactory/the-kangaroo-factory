

experience_template <- function(){
  
  # -- return
  tagList(
    
    # -- header card
    card(
      class = "bg-light",
      div(
        h3("xxx"),
        p("2016 - 2019"),
        p(style ="font-style: italic;", "xxx."),
        div(class = "badge tag", "xxx"),
        div(class = "badge tag", "xxx"))),
    
    
    # -- main content (2 columns)
    layout_column_wrap(
      
      # -- left column
      tagList(
        h4("Mission & Responsibilities"),
        p("Functional"),
        tags$ul(
          tags$li("xxx"),
          tags$li("xxx"),
          tags$li("xxx"),
          tags$li("xxx")),
        p("Project Management"),
        tags$ul(
          tags$li("xxx"),
          tags$li("xxx"),
          tags$li("xxx"),
          tags$li("xxx")),
        p("Data & Analysis"),
        tags$ul(
          tags$li("xxx"),
          tags$li("xxx"),
          tags$li("xxx"),
          tags$li("xxx"))),
      
      # -- right column
      tagList(
        card(
          class = "border border-light",
          card_header("Specific"),
          card_body(
            tags$ul(
              tags$li("xxx"),
              tags$li("xxx")))),
        
        # -- sub-columns
        layout_column_wrap(
          
          card(
            class = "border border-light",
            card_header("Key figures"),
            card_body(
              tags$span(
                div(class = "badge tag", "xxx"),
                div(class = "badge tag", "xxx"),
                div(class = "badge tag", "xxx")))),
          
          card(
            class = "border border-light",
            card_header("Stack & tools"),
            card_body(
              tags$span(
                div(class = "badge tag", "xxx"),
                div(class = "badge tag", "xxx"),
                div(class = "badge tag", "xxx"))))),
        
        # -- deliverables
        card(
          class = "border border-light",
          card_header("Deliverables"),
          card_body(
            p("xxx"),
            tags$ul(
              tags$li("xxx"),
              tags$li("xxx")),
            p("xxx"),
            tags$ul(
              tags$li("xxx"),
              tags$li("xxx")),
            p("xxx"),
            tags$ul(
              tags$li("xxx"),
              tags$li("xxx")))))))
  
}
