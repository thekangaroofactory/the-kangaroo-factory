
next_steps <- function(){
  
  div(class = "next-steps-container",
           
           # En-tête de section
           div(class = "section-main-title", 
                    tags$i(class = "fa-solid fa-chart-line"), "Next Steps"
           ),
           
           div(class = "next-steps-grid",
                    
                    # COLONNE GAUCHE : Jump back in
                    div(class = "steps-column",
                             tags$h3("Jump back in"),
                             div(class = "steps-list",
                                      
                                      # Item 1 : Benchmark Draft
                                      div(class = "step-item clickable",
                                               onclick = "Shiny.setInputValue('jump_action', 'benchmark', {priority: 'event'});",
                                               div(class = "step-avatar-wrapper",
                                                        div(class = "step-avatar", tags$i(class = "fa-solid fa-kiwi-bird")), # Remplacement de l'icône kangourou
                                                        div(class = "step-badge", tags$i(class = "fa-solid fa-code"))
                                               ),
                                               div(class = "step-content",
                                                        div(class = "step-title", "Benchmark Draft Task"),
                                                        div(class = "step-subtitle", "Your notebook has been viewed 21 times")
                                               ),
                                               div(class = "step-action-zone",
                                                        span(class = "fork-badge", tags$i(class = "fa-solid fa-caret-up"), "1 forks this week")
                                               )
                                      ),
                                      
                                      # Item 2 : Transfer Learning
                                      div(class = "step-item clickable",
                                               onclick = "Shiny.setInputValue('jump_action', 'transfer_learning', {priority: 'event'});",
                                               div(class = "step-avatar-wrapper",
                                                        div(class = "step-avatar", tags$i(class = "fa-solid fa-images")),
                                                        div(class = "step-badge", tags$i(class = "fa-solid fa-code"))
                                               ),
                                               div(class = "step-content",
                                                        div(class = "step-title", "Transfer Learning Image Classification"),
                                                        div(class = "step-subtitle", "Your notebook has been viewed 145 times")
                                               ),
                                               div(class = "step-action-zone",
                                                        div(class = "resume-link", tags$i(class = "fa-solid fa-arrow-right"), "Resume editing")
                                               )
                                      ),
                                      
                                      # Item 3 : Coffee Images
                                      div(class = "step-item clickable",
                                               onclick = "Shiny.setInputValue('jump_action', 'coffee_images', {priority: 'event'});",
                                               div(class = "step-avatar-wrapper",
                                                        div(class = "step-avatar", tags$i(class = "fa-solid fa-kiwi-bird")),
                                                        div(class = "step-badge", tags$i(class = "fa-solid fa-table-cells"))
                                               ),
                                               div(class = "step-content",
                                                        div(class = "step-title", "coffee-images-test"),
                                                        div(class = "step-subtitle", "Usability Rating: 1.88 • Last Updated 3 years ago")
                                               ),
                                               div(class = "step-action-zone",
                                                        div(class = "resume-link", tags$i(class = "fa-solid fa-arrow-right"), "Resume editing")
                                               )
                                      )
                                      
                             )
                    ),
                    
                    # COLONNE DROITE : More things to do
                    div(class = "steps-column",
                             tags$h3("More things to do"),
                             div(class = "steps-list",
                                      
                                      # Item 1 : Join conversation
                                      div(class = "step-item",
                                               div(class = "step-avatar-wrapper",
                                                        div(class = "step-avatar", tags$i(class = "fa-regular fa-comment-dots"))
                                               ),
                                               div(class = "step-content",
                                                        div(class = "step-title", "Join a conversation"),
                                                        div(class = "step-subtitle", 
                                                                 HTML("Make your first comment! Visit the <a href='#'>forums</a> or explore discussions on <a href='#'>datasets</a>.")
                                                        )
                                               ),
                                               div(class = "step-action-zone",
                                                        tags$button(class = "btn-close-item", 
                                                                    onclick = "Shiny.setInputValue('todo_close', 'join_conversation', {priority: 'event'}); window.event.stopPropagation();",
                                                                    tags$i(class = "fa-solid fa-xmark")
                                                        )
                                               )
                                      ),
                                      
                                      # Item 2 : Competition submission
                                      div(class = "step-item",
                                               div(class = "step-avatar-wrapper",
                                                        div(class = "step-avatar", tags$i(class = "fa-solid fa-trophy"))
                                               ),
                                               div(class = "step-content",
                                                        div(class = "step-title", "Make a competition submission"),
                                                        div(class = "step-subtitle", 
                                                                 HTML("Follow our guide to make your first submission to the <a href='#'>Titanic competition</a>.")
                                                        )
                                               ),
                                               div(class = "step-action-zone",
                                                        tags$button(class = "btn-close-item", 
                                                                    onclick = "Shiny.setInputValue('todo_close', 'competition_submission', {priority: 'event'}); window.event.stopPropagation();",
                                                                    tags$i(class = "fa-solid fa-xmark")
                                                        )
                                               )
                                      )
                                      
                             )
                    )
                    
           )
  )
  
}
