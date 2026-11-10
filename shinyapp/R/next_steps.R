

next_steps <- function(steps){
  
  div(class = "next-steps-container",
      
      # header
      div(class = "section-main-title", 
          tags$i(class = "fa-solid fa-chart-line"), "Latest trend"),
      
      # grid (2 columns)
      div(class = "next-steps-grid",
          
          # left
          div(class = "steps-column",
              
              h3("Jump in"),
              div(class = "steps-list",
                  
                  apply(steps, MARGIN = 1, \(x) step_item(id = x[['id']],
                                                          title = x[['title']], 
                                                          subtitle = x[['subtitle']],
                                                          action = x[['action']],
                                                          nav = x[['type']]))
                  
                  
                  
                  
                  
                  # # Item 1 :
                  # div(class = "step-item clickable",
                  #     onclick = "Shiny.setInputValue('jump_action', 'benchmark', {priority: 'event'});",
                  #     div(class = "step-avatar-wrapper",
                  #         div(class = "step-avatar", tags$i(class = "fa-solid fa-kiwi-bird"))),
                  #     div(class = "step-content",
                  #         div(class = "step-title", "Kitems"),
                  #         div(class = "step-subtitle", "A new version is available!")),
                  #     div(class = "step-action-zone",
                  #         span(class = "step-action", tags$i(class = "fa-solid fa-arrow-right"), "Go to package"))),
                  # 
                  # # Item 2 :
                  # div(class = "step-item clickable",
                  #     onclick = "Shiny.setInputValue('jump_action', 'transfer_learning', {priority: 'event'});",
                  #     div(class = "step-avatar-wrapper",
                  #         div(class = "step-avatar", tags$i(class = "fa-solid fa-images"))),
                  #     div(class = "step-content",
                  #         div(class = "step-title", "Octobre newsletter"),
                  #         div(class = "step-subtitle", "A new blog post is available.")),
                  #     div(class = "step-action-zone",
                  #         div(class = "step-action", tags$i(class = "fa-solid fa-arrow-right"), "Read post"))),
                  # 
                  # # Item 3 :
                  # div(class = "step-item clickable",
                  #     onclick = "Shiny.setInputValue('jump_action', 'coffee_images', {priority: 'event'});",
                  #     div(class = "step-avatar-wrapper",
                  #         div(class = "step-avatar", tags$i(class = "fa-solid fa-kiwi-bird"))),
                  #     div(class = "step-content",
                  #         div(class = "step-title", "AI Benchmark"),
                  #         div(class = "step-subtitle", "Updated yesterday • 2/3 tasks OK")),
                  #     div(class = "step-action-zone",
                  #         div(class = "step-action", tags$i(class = "fa-solid fa-arrow-right"), "See leaderboard")))
                  
              )
          ),
          
          # COLONNE DROITE : More things to do
          div(class = "steps-column",
              
              h3("More things to do"),
              div(class = "steps-list",
                  
                  # Item 1 : Join conversation
                  div(class = "step-item",
                      div(class = "step-avatar-wrapper",
                          div(class = "step-avatar", tags$i(class = "fa-regular fa-comment-dots"))),
                      div(class = "step-content",
                          div(class = "step-title", "Join a conversation"),
                          div(class = "step-subtitle", 
                              HTML("Make your first comment! Visit the <a href='#'>forums</a> or explore discussions on <a href='#'>datasets</a>."))),
                      div(class = "step-action-zone",
                          tags$button(class = "btn-close-item", 
                                      onclick = "Shiny.setInputValue('todo_close', 'join_conversation', {priority: 'event'}); window.event.stopPropagation();",
                                      tags$i(class = "fa-solid fa-xmark")))),
                  
                  # Item 2 : Competition submission
                  div(class = "step-item",
                      div(class = "step-avatar-wrapper",
                          div(class = "step-avatar", tags$i(class = "fa-solid fa-trophy"))),
                      div(class = "step-content",
                          div(class = "step-title", "Make a competition submission"),
                          div(class = "step-subtitle", 
                              HTML("Follow our guide to make your first submission to the <a href='#'>Titanic competition</a>."))),
                      div(class = "step-action-zone",
                          tags$button(class = "btn-close-item", 
                                      onclick = "Shiny.setInputValue('todo_close', 'competition_submission', {priority: 'event'}); window.event.stopPropagation();",
                                      tags$i(class = "fa-solid fa-xmark"))))
                  
              )
          )
          
      )
  )
  
}
