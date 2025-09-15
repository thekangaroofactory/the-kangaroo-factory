

keywords <- function(tags, dark = FALSE){

  # -- manage multiple tags
  tags <- trimws(unlist(strsplit(tags, ",", fixed = TRUE)))
  
  # -- check param
  class <- ifelse(dark, "badge tag tkf-bg-dark color-light fw-normal", "badge tag tkf-bg-accent color-dark")
  
  # -- return
  lapply(tags, div, class = class)
  
}
