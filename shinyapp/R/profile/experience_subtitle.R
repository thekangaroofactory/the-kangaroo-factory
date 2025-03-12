

#' Experience Subtitle
#'
#' @param experience a list
#'
#' @returns a character vector
#'
#' @examples

experience_subtitle <- function(experience, language = c("en", "fr")){
  
  # -- return
  paste(experience$company, paste0("(", ifelse(experience$end == "NA", paste(ifelse(language == "en", "Since", "Depuis"), experience$start), paste(experience$start, "-", experience$end)), ")"))
  
}
