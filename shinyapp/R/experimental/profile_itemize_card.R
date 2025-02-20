

profile_itemize_card <- function(content){
  
  # -- helper
  helper <- function(x){
    
    # -- return
    card(
      
      # -- title
      card_header(names(x)),
      
      # -- list
      tags$ul(
        lapply(x[[1]]$item, tags$li)))}
  
  
  # -- apply helper & return
  lapply(1:length(content), function(x) helper(content[x]))
  
}
