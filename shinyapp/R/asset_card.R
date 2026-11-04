

asset_card <- function(title, description, type, icon, footer, tag){
  
  div(
    class = "custom-card",
    
    # left (image)
    div(
      class = "hero-image"),
    
    # right (content)
    div(
      class = "card-content-section",
      
      # body
      div(
        class = "card-body",
        div(class = "card-header-meta", div(class = "icon-wrapper", icon), type),
        h3(title),
        div(class = "card-description", description)),
      
      # footer
      div(
        class = "card-footer-meta",
        div(class = "card-footer-left", footer),
        div(class = "card-footer-right card-ranking-tag", tag))))
  
}
