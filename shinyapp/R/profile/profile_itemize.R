

#' Itemize Tag List
#'
#' @param content a list of data.frame objects (with an item column)
#' @param skip whether the title should be skipped
#'
#' @returns a list of html tags
#'
#' @details
#' When skip is FALSE (default), the names of the list are used
#' to put a title above the ul html tag.
#'
#' @examples

profile_itemize <- function(content, skip = FALSE){
  
  # -- helper
  helper <- function(x, title = NULL){
    
    # -- return
    tagList(
      
      # -- title
      if(!skip)
        h4(style = "margin-top: 0.5rem;", ktools::toupper_words(title)),
      
      # -- list
      tags$ul(
        lapply(x$item, tags$li)))}
  
  
  # -- apply helper & return
  lapply(names(content), function(x) helper(content[[x]], title = x))
  
}
