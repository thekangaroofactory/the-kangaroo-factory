

step_item <- function(id, title, subtitle, action = "Go to", nav, icon = NULL){
  
  div(class = "step-item clickable",
      onclick = sprintf("Shiny.setInputValue('jump_action', {nav: '%s', id: '%s'}, {priority: 'event'});",
                        nav, id),
      div(class = "step-avatar-wrapper",
          div(class = "step-avatar", if(is.null(icon)) icon("arrow-right") else icon)),
      div(class = "step-content",
          div(class = "step-title", title),
          div(class = "step-subtitle", subtitle)),
      div(class = "step-action-zone",
          span(class = "step-action", tags$i(class = "fa-solid fa-arrow-right"), action)))
  
}
