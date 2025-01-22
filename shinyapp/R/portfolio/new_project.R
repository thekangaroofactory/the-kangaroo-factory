

#' Create project
#'
#' @param name the name of the project
#' @param user the owner of the project
#' @param path the path where to create the project
#'
#' @export
#'
#' @examples

new_project <- function(name, user, path){
  
  # -- Create project folder
  dir.create(path = file.path(path, user, "portfolio", name))
  
  
}
