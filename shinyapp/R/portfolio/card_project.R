

#' Project Card
#'
#' @param x a data.frame of the project's info
#' @param ns the namespace function
#' @param input the input object reference
#' @param path_portfolio the path to the user portfolio
#'
#' @returns a card object
#'
#' @examples


card_project <- function(x, ns, input, path_portfolio){
  
  cat("[card_project] Build card, project =", x$name, "\n")
  
  # -- card
  card(
    id = ns(paste0("project_", x$id)),
    class = "border border-light",
    fill = FALSE,
    full_screen = TRUE,
    
    # -- card content
    # adding an explicit card_body with padding 0 otherwise an implicit one
    # is added with some padding around the image.
    card_body(
      class = "p-0",
      
      # -- dynamic content (preview vs full screen)
      renderUI({
        
        # -- check if card is full screen
        if(isFALSE(input[[paste0("project_", x$id, "_full_screen")]]))
          
          # -- preview
          tagList(
            card_image(
              file = file.path(path_portfolio, paste0("p", x$id), "preview.jpg"),
              alt = "Project preview image"),
            card_body(
              card_title(x$name),
              p(x$type, br(), x$summary)))
        
        else
          
          # -- full screen
          tagList(
            h1(x$name),
            p("This is the full screen mode content."),
            p(x$type, br(), x$summary))
        
      }) # renderUI
    ) # card_body
  ) # card
  
}
