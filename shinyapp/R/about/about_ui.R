

about_ui <- function(id){
  
  # -- namespace
  ns <- NS(id)
  
  # -- wrap & return
  tagList(
    
    hero_section(title = "About", description = "A few words about me."),
    
    div(
      class = "mb-5",
      layout_columns(
        tagList(
          p(class = "mt-5", "I am a Senior Data Project Manager with a technical-functional background."),
          p("Since 2001, it has always been about data projects and technical-functional roles:", br(),
            "From Data Management & Exchanges to Data Analysis & Visualization."),
          p("I enjoy working with complex data pipelines & carefully designed dashboards."),
          p("I do photography as a hobby", tags$a(id = "about-link_thediamondbay", class = "ktag", href = "https://www.thediamondbay.fr/", target = "_blank", "www.thediamondbay.fr"), "and I traveled around the world for a year.")),
        
        tags$image(width = "200px", src = "./img/profile.png", alt = "Avatar"))),
    

    
 
    
  )
  
}
