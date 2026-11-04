

package_ui <- function(){
  
  tags$div(class = "section-container",
    
    h2("Packages"),
    p("Public packages published to R-universe"),
    
    tags$div(
      class = "cards-container",
      
      # --- CARTE 1 ---
      tags$div(
        class = "custom-card",
        tags$div(
          class = "hero-image"),
        tags$div(
          class = "card-content-section",
          tags$div(
            class = "card-body",
            tags$div(class = "card-header-meta", tags$div(class = "icon-wrapper", tags$i(class = "fa-solid fa-code")), "Package"),
            tags$h3("Kitems"),
            tags$div(class = "card-description", "A framework to manipulate tabular items.")),
          tags$div(
            class = "card-footer-meta",
            tags$div(class = "card-footer-left", tags$span(icon("laptop")), "Web page"),
            tags$div(class = "card-footer-right card-ranking-tag", "v0.8.1")))),
      
      # --- CARTE 2 ---
      tags$div(
        class = "custom-card",
        tags$div(
          class = "hero-image"),
        tags$div(
          class = "card-content-section",
          tags$div(
            class = "card-body",
            tags$div(class = "card-header-meta", tags$div(class = "icon-wrapper", tags$i(class = "fa-solid fa-code")), "Package"),
            tags$h3("Kitems"),
            tags$div(class = "card-description", "A framework to manipulate tabular items.")),
          tags$div(
            class = "card-footer-meta",
            tags$div(class = "card-footer-left", tags$span(icon("laptop")), "Web page"),
            tags$div(class = "card-footer-right card-ranking-tag", "v0.8.1"))))))
  
}
