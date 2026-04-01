

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
  
  # -- return project card
  card(
    id = ns(paste0("project_", x$id)),
    class = "border",
    fill = FALSE,
    
    # -- preview
    card_image(
      file = file.path(path_portfolio, paste0("p", x$id), "preview.jpg"),
      alt = "Project preview image"),
    
    # -- summary
    card_body(
      card_title(x$name),
      
      span(
        lapply(unlist(strsplit(x$type, split = " ")), div, class = "badge tag tkf-bg-accent color-dark")),
      
      p(x$summary)),
    
    # -- expand
    card_footer(
        actionButton(inputId = paste0("open_p", x$id),
                     label = "view project",
                     class = "rounded-pill btn-sm dimmed float-end ktag",
                     onclick = sprintf('Shiny.setInputValue(\"%s\", this.id, {priority: \"event\"})', 
                                       ns("open_project")))))
  
}
