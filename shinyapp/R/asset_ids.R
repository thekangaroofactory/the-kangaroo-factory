

asset_ids <- function(config){
  
  # saving names as they will be lost
  nm <- names(config)
  
  # looping on 1st level entries
  new <- lapply(seq_along(config), function(x) {
    
    type <- names(config[x])
    x <- config[[x]]
    
    # return unchanged if not a list
    # so 1st level entries are not modified
    if(is.list(x)){

      # loop over nested list (guides, projects)      
      lapply(seq_along(x), \(idx) c(x[[idx]], list(id = paste(type, idx, sep = "-"))))
      
    } else x
    
  })
  
  # setting back names
  rlang::set_names(new, nm)
  
}
