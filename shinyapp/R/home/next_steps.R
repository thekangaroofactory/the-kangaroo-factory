

next_steps <- function(steps){
  
  div(class = "next-steps-container",
      
      # header
      div(class = "section-main-title", 
          tags$i(class = "fa-solid fa-chart-line"), "Latest trend"),
      
      # grid (2 columns)
      div(class = "next-steps-grid",
          
          # left : trend
          div(class = "steps-column",
              
              h3("Jump in"),
              div(class = "steps-list",
                  
                  apply(steps, MARGIN = 1, \(x) step_item(id = x[['id']],
                                                          title = x[['title']], 
                                                          subtitle = x[['subtitle']],
                                                          action = x[['action']],
                                                          nav = x[['type']])))),
          
          # right : more things to do
          div(class = "steps-column",
              
              h3("More things to do"),
              div(class = "steps-list",
                  
                  # Item 1 :
                  # >> it will require an id to be able to drop it from the action button
                  div(class = "step-item",
                      div(class = "step-avatar-wrapper",
                          div(class = "step-avatar", tags$i(class = "fa-brands fa-youtube"))),
                      div(class = "step-content",
                          
                          # >> same here as below
                          div(class = "step-title", "Not yet familiar with {kitems}?"),
                          
                          # >> needs to be improved
                          # the function should take the description as an argument (most probably a df)
                          div(class = "step-subtitle", 
                              "Watch the", 
                              actionLink("things-1", "package", 
                                         onclick = sprintf("Shiny.setInputValue('jump_action', {nav: '%s', id: '%s'}, {priority: 'event'});",
                                                           "package", "package-2")), 
                              HTML("introduction <a href='https://youtu.be/8cHWTo-a63c' target='_blank'>video</a> on YouTube."))),
                      
                      # >> action is commented as not implemented yet!
                      # div(class = "step-action-zone",
                      #     tags$button(class = "btn-close-item", 
                      #                 onclick = "Shiny.setInputValue('todo_close', 'join_conversation', {priority: 'event'}); window.event.stopPropagation();",
                      #                 tags$i(class = "fa-solid fa-xmark")))
                      
                  ),
                  
                  # Item 2 :
                  div(class = "step-item",
                      div(class = "step-avatar-wrapper",
                          div(class = "step-avatar", tags$i(class = "fa-solid fa-trophy"))),
                      div(class = "step-content",
                          div(class = "step-title", "Master modular apps"),
                          div(class = "step-subtitle", 
                              "Follow the",
                              actionLink("things-2", "guide", 
                                         onclick = sprintf("Shiny.setInputValue('jump_action', {nav: '%s', id: '%s'}, {priority: 'event'});",
                                                           "guide", "guides-1")), 
                              "about communication between modules.")),
                      
                      # div(class = "step-action-zone",
                      #     tags$button(class = "btn-close-item", 
                      #                 onclick = "Shiny.setInputValue('todo_close', 'competition_submission', {priority: 'event'}); window.event.stopPropagation();",
                      #                 tags$i(class = "fa-solid fa-xmark")))
                      
                  )
                  
              )
          )
          
      )
  )
  
}
