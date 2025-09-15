

contact_ui <- function(id){
  
  card(
    class = "border-radius tkf-bg-camel p-3 mt-5",
    
    # -- layout
    layout_columns(
      col_widths = c(4, 8),
      
      # -- text
      p("Contact me with an email or a message on LinkedIn."),
      
      # -- cards
      layout_column_wrap(
        class = "mt-5",
        
        card(
          class = "border border-light",
          card_header("Email"),
          div("Drop me an", a(href="mailto:philippe.peret@hotmail.com", "email"))),
        
        card(
          class = "border border-light",
          card_header("LinkedIn"),
          div("Visit my", a(href="https://www.linkedin.com/in/philippeperet/", target = "_blank", "profile"))),
        
      )))
  
}
