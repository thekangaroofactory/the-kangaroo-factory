

loader <- function(id, label){

  div(id = id,
    p(id = paste(id, "label", sep = "-"), label),
    span(class = "loader"))
    
}
