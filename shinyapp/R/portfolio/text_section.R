

#' Text Section
#'
#' @param content a list to build the section
#'
#' @returns a list of tags
#'
#' @examples

text_section <- function(content){
  
  cat("[text_section] input size =", length(content), "\n")
  
  # -- return
  tagList(
    
    # -- title
    h2(class = "mt-5 mb-3", content$title),
    
    # -- body
    eval(parse(text = content$"...")))
  
}
