

#' Profile Summary
#'
#' @param summary a dataframe with column p
#'
#' @returns a list of html tags
#'
#' @examples

profile_summary <- function(summary){
  
  # -- return
  tagList(
    
    # -- title
    h4("Summary"),
    
    # -- content
    lapply(summary$p, function(x) p(HTML(x))))
  
}
