

#' Create user
#'
#' @param name the name of the user
#' @param path the path where to create user data (should be path$data)
#'
#' @export
#'
#' @examples

new_user <- function(name, path){
  
  # -- Create user folders
  dir.create(path = file.path(path, name))
  dir.create(path = file.path(path, name, "portfolio"))
  
}
