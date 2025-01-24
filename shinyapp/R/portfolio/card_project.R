

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
    class = "border border-light",
    fill = FALSE,
    
    # -- preview
    card_image(
      file = file.path(path_portfolio, paste0("p", x$id), "preview.jpg"),
      alt = "Project preview image"),
    
    # -- summary
    card_body(
      card_title(x$name),
      p(x$type, br(), x$summary)),
    
    # -- expand
    card_footer(
      tooltip(
        actionButton(inputId = paste0("open_p", x$id),
                     label = NULL,
                     icon = icon("up-right-and-down-left-from-center"),
                     class = "rounded-pill btn-sm btn-outline-light float-end",
                     onclick = sprintf('Shiny.setInputValue(\"%s\", this.id, {priority: \"event\"})', 
                                       ns("open_project"))),
        "Open project",
        placement = "left")))
  
}
