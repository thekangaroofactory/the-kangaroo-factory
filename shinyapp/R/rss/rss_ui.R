

rss_ui <- function(id, description, url){
  
  tagList(
    
    hero_section(title = ktools::toupperfirst(id), description = description),
    
    div(class = "section-container",
        h1("Articles"),
        p("In case you need full text search or tag selection, see the quarto version", 
          a(href = url, target = "_blank", "here."))),
    
    div(id = paste(id, "placeholder", sep = "-"),
        class="cards-container"))
  
}
