

#' Experience Subtitle
#'
#' @param experience a list
#'
#' @returns a character vector
#'
#' @examples

experience_subtitle <- function(experience){
  
  # -- return
  paste(experience$company, "|", experience$start, "-", experience$end)
  
}
