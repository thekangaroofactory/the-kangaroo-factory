

keywords <- function(tags){

  # -- manage multiple tags
  tags <- trimws(unlist(strsplit(tags, ",", fixed = TRUE)))
  
  # -- return
  lapply(tags, div, class = "badge tag")
  
}
