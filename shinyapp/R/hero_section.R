

hero_section <- function(title, description, actions = NULL){
  
  div(class = "custom-hero-block",
      
      # left
      div(class = "hero-content",
          
          # text
          div(class = "hero-title", title),
          div(class = "hero-description", description),
          
          # buttons
          if(!is.null(actions))
            div(class = "hero-buttons",
                actionButton(inputId = actions$primary$id, 
                             label = actions$primary$label,
                             icon = actions$primary$icon, 
                             class = "btn btn-main"),
                if(!is.null(actions$secondary))
                  actionButton(inputId = actions$secondary$id, 
                               label = actions$secondary$label, 
                               class = "btn-secondary-custom"))),
      
      # right (image)
      div(class = "hero-image"))
  
}
