

custom_modal <- function(content = NULL){
  
  # -- component
  tags$div(
    id = "modal-overlay",
    class = "custom-modal-overlay",
    
    tags$div(
      class = "custom-modal-content",
      
      # Close
      tags$button("×", id = "close_modal", class = "custom-close-btn"),
      
      # Placeholder
      div(id = "custom-modal-placeholder", content)
      ))
  
}
