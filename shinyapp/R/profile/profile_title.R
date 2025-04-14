

#' Profile Title
#'
#' @param title a named list of shape list(main = "foo", subtitle = "bar")
#'
#' @returns a list of html tags
#'
#' @examples

profile_title <- function(title){
  
  # -- return
  tagList(
    
    h1(tools::toTitleCase(title$main)),
    
    if(!is.null(title$subtitle))
      p(class = "subtitle", ktools::toupperfirst(title$subtitle)))
  
}
