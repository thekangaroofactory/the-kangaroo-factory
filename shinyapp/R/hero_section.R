
hero_section <- function(title, description, actions = NULL){
  
  # -- prepare button params
  primary <- list(inputId = actions$primary$id,
                  label = actions$primary$label,
                  icon = actions$primary$icon)
  if(!is.null(actions$primary$link))
    primary <- append(primary,
                      list(onclick = sprintf("window.open('%s', '_blank').focus();", actions$primary$link)))
  
  # -- prepare button params
  secondary <- list(inputId = actions$secondary$id,
                    label = actions$secondary$label,
                    icon = actions$secondary$icon)
  if(!is.null(actions$secondary$link))
    secondary <- append(secondary,
                        list(onclick = sprintf("window.open('%s', '_blank').focus();", actions$secondary$link)))
  
  # -- return
  div(class = "custom-hero-block",
      
      # left
      div(class = "hero-content",
          
          # text
          div(class = "hero-title", title),
          div(class = "hero-description", description),
          
          # buttons
          if(!is.null(actions))
            div(class = "hero-buttons",
                if(!is.null(actions$primary))
                  do.call(actionButton, c(list(class = "btn btn-main"), primary)),
                if(!is.null(actions$secondary))
                  do.call(actionButton, c(list(class = "btn-secondary-custom"), secondary))
            )),
      
      # right (image)
      div(class = "hero-image"))
  
}
