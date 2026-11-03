
next_steps <- function(){
  
  tags$div(class = "next-steps-container",
           
           # En-tête de section
           tags$div(class = "section-main-title", 
                    tags$i(class = "fa-solid fa-chart-line"), "Next Steps"
           ),
           
           tags$div(class = "next-steps-grid",
                    
                    # COLONNE GAUCHE : Jump back in
                    tags$div(class = "steps-column",
                             tags$h3("Jump back in"),
                             tags$div(class = "steps-list",
                                      
                                      # Item 1 : Benchmark Draft
                                      tags$div(class = "step-item clickable",
                                               onclick = "Shiny.setInputValue('jump_action', 'benchmark', {priority: 'event'});",
                                               tags$div(class = "step-avatar-wrapper",
                                                        tags$div(class = "step-avatar", tags$i(class = "fa-solid fa-kiwi-bird")), # Remplacement de l'icône kangourou
                                                        tags$div(class = "step-badge", tags$i(class = "fa-solid fa-code"))
                                               ),
                                               tags$div(class = "step-content",
                                                        tags$div(class = "step-title", "Benchmark Draft Task"),
                                                        tags$div(class = "step-subtitle", "Your notebook has been viewed 21 times")
                                               ),
                                               tags$div(class = "step-action-zone",
                                                        tags$span(class = "fork-badge", tags$i(class = "fa-solid fa-caret-up"), "1 forks this week")
                                               )
                                      ),
                                      
                                      # Item 2 : Transfer Learning
                                      tags$div(class = "step-item clickable",
                                               onclick = "Shiny.setInputValue('jump_action', 'transfer_learning', {priority: 'event'});",
                                               tags$div(class = "step-avatar-wrapper",
                                                        tags$div(class = "step-avatar", tags$i(class = "fa-solid fa-images")),
                                                        tags$div(class = "step-badge", tags$i(class = "fa-solid fa-code"))
                                               ),
                                               tags$div(class = "step-content",
                                                        tags$div(class = "step-title", "Transfer Learning Image Classification"),
                                                        tags$div(class = "step-subtitle", "Your notebook has been viewed 145 times")
                                               ),
                                               tags$div(class = "step-action-zone",
                                                        tags$div(class = "resume-link", tags$i(class = "fa-solid fa-arrow-right"), "Resume editing")
                                               )
                                      ),
                                      
                                      # Item 3 : Coffee Images
                                      tags$div(class = "step-item clickable",
                                               onclick = "Shiny.setInputValue('jump_action', 'coffee_images', {priority: 'event'});",
                                               tags$div(class = "step-avatar-wrapper",
                                                        tags$div(class = "step-avatar", tags$i(class = "fa-solid fa-kiwi-bird")),
                                                        tags$div(class = "step-badge", tags$i(class = "fa-solid fa-table-cells"))
                                               ),
                                               tags$div(class = "step-content",
                                                        tags$div(class = "step-title", "coffee-images-test"),
                                                        tags$div(class = "step-subtitle", "Usability Rating: 1.88 • Last Updated 3 years ago")
                                               ),
                                               tags$div(class = "step-action-zone",
                                                        tags$div(class = "resume-link", tags$i(class = "fa-solid fa-arrow-right"), "Resume editing")
                                               )
                                      )
                                      
                             )
                    ),
                    
                    # COLONNE DROITE : More things to do
                    tags$div(class = "steps-column",
                             tags$h3("More things to do"),
                             tags$div(class = "steps-list",
                                      
                                      # Item 1 : Join conversation
                                      tags$div(class = "step-item",
                                               tags$div(class = "step-avatar-wrapper",
                                                        tags$div(class = "step-avatar", tags$i(class = "fa-regular fa-comment-dots"))
                                               ),
                                               tags$div(class = "step-content",
                                                        tags$div(class = "step-title", "Join a conversation"),
                                                        tags$div(class = "step-subtitle", 
                                                                 HTML("Make your first comment! Visit the <a href='#'>forums</a> or explore discussions on <a href='#'>datasets</a>.")
                                                        )
                                               ),
                                               tags$div(class = "step-action-zone",
                                                        tags$button(class = "btn-close-item", 
                                                                    onclick = "Shiny.setInputValue('todo_close', 'join_conversation', {priority: 'event'}); window.event.stopPropagation();",
                                                                    tags$i(class = "fa-solid fa-xmark")
                                                        )
                                               )
                                      ),
                                      
                                      # Item 2 : Competition submission
                                      tags$div(class = "step-item",
                                               tags$div(class = "step-avatar-wrapper",
                                                        tags$div(class = "step-avatar", tags$i(class = "fa-solid fa-trophy"))
                                               ),
                                               tags$div(class = "step-content",
                                                        tags$div(class = "step-title", "Make a competition submission"),
                                                        tags$div(class = "step-subtitle", 
                                                                 HTML("Follow our guide to make your first submission to the <a href='#'>Titanic competition</a>.")
                                                        )
                                               ),
                                               tags$div(class = "step-action-zone",
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
