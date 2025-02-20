

profile_itemize <- function(content){
  
  # -- helper
  helper <- function(x){

    # -- return
    tagList(
      
      # -- title
      h4(style = "margin-top: 0.5rem;", names(x)),
      
      # -- list
      tags$ul(
        lapply(x[[1]]$item, tags$li)))}
  
  
  # -- apply helper & return
  lapply(1:length(content), function(x) helper(content[x]))
  
}
