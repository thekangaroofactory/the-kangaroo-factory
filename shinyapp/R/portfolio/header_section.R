

#' Header Section
#'
#' @param header a list of key-value to be added to the section
#'
#' @returns a list of tags
#'
#' @examples

header_section <- function(header){
  
  cat("[header_section] input size =", length(header), "\n")
  
  # -- return
  tagList(
    
    h1(header$title),
    p(header$subtitle),
    
  )
  
}
