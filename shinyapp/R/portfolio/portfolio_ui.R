

portfolio_ui <- function(){
  
  tagList(
    
    # title
    hero_section(title = "Projects", 
                 description = "Data-driven projects that showcase the power and flexibility of open source approaches."),
    
    div(class = "section-container",
        h2("Featured"),
        p("These are key projects, either used to valide the packages or work on specific domain of interest.")),
    
    # container where to insert cards
    div(id = "project-placeholder",
        class="cards-container"))
  
}