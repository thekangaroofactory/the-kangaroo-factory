

#' Profile Summary
#'
#' @param summary a dataframe with column p
#'
#' @returns a list of html tags
#'
#' @examples

profile_summary <- function(summary, language = c("en", "fr")){
  
  # -- return
  tagList(
    
    # -- title
    h4(ifelse(language == "en", "Summary", "Présentation")),
    
    # -- content
    lapply(summary$p, function(x) p(HTML(x))))
  
}
