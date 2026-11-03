

loader <- function(id, label){

  tags$div(id = id,
    p(label),
    tags$span(class = "loader"))
    
}
