
hero_section <- function(title, description){
  
  div(class = "custom-hero-block",
      
      # Côté gauche : Textes et Boutons
      div(class = "hero-content",
          div(class = "hero-title", title),
          div(class = "hero-description", description),
      
          # buttons
          div(class = "hero-buttons",
              # Bouton principal avec flèche dropdown
              div(class = "btn-split-container dropdown",
                  tags$button(class = "btn btn-main", type = "button", id = "new_notebook",
                              icon("plus"), " New Notebook")),
              # Bouton secondaire
              actionButton("your_work", "Your Work", class = "btn-secondary-custom")
          )
      ),
      
      # Côté droit : Image d'illustration
      div(class = "hero-image")
  )
  
}
