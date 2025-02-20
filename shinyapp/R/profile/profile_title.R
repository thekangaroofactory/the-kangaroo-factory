

#' Profile Title
#'
#' @param title a character string 
#' @param subtitle an optional character string
#'
#' @returns a list of html tags
#'
#' @examples

profile_title <- function(title, subtitle = NULL){
  
  # -- return
  tagList(
    
    h1(tools::toTitleCase(title)),
    
    if(!is.null(subtitle))
      p(class = "subtitle", firstup(subtitle)))
  
}
