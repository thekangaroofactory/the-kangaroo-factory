

guide_ui <- function(){
  
  div(class = "section-container",
      
      h2("Guides"),
      p("These online books address specific challenges and provide in-depth knowledge.", br(),
        "They usually come along with materials (templates, GitHub repo)."),
      
      div(
        id = "guide-placeholder",
        class = "cards-container"))
  
}
