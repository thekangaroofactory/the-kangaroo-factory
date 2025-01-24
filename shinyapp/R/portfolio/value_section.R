

#' Value Box Section
#'
#' @param values a data.frame to feed to value_box function
#'
#' @returns a value_box object if the input has a single row, a list of tags otherwise
#'
#' @examples

value_section <- function(values){
  
  cat("[value_section] input size =", nrow(values), "\n")
  
  # -- helper function
  helper <- function(x){

    str(x)
    
    # -- cast to list (input is a vector)
    x <- as.list(x)
    
    # -- eval & rename ...
    x$"..." <- eval(parse(text = x$"..."))
    names(x)[names(x) %in% "..."] <- ""
    
    # -- manage icon
    if("showcase" %in% names(x))
      x$showcase <- icon(x$showcase)
    
    # -- call function
    do.call(value_box, args = x)
    
  }
  
  # -- apply helper & remove names
  # they come from the data.frame row names converted from json
  boxes <- apply(values, MARGIN = 1, helper, simplify = F)
  names(boxes) <- NULL
  
  # -- wrap & return
  if(length(boxes) > 1)
    do.call(layout_column_wrap, c(list(class = "mt-5"), boxes))
  else
    boxes
  
}
