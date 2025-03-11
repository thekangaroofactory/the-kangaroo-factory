

#' Read User Profile
#'
#' @param path a character string with the path where to read the json
#'
#' @returns an R object, output of jsonlite::fromJSON or NULL is path is not found
#'
#' @examples

read_profile <- function(path, language = c("en", "fr")){
  
  # -- check path & return
  if(dir.exists(path))
    jsonlite::fromJSON(file.path(path, paste0("profile_", language, ".json")))
  else
    NULL
  
}
