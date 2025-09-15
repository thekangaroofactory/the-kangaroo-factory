

keywords <- function(tags, dark = FALSE){

  # -- manage multiple tags
  tags <- trimws(unlist(strsplit(tags, ",", fixed = TRUE)))
  
  # -- check param
  class <- ifelse(dark, "badge tag bg-bg color-bg", "badge tag bg-accent color-bg")
  
  # -- return
  lapply(tags, div, class = class)
  
}
