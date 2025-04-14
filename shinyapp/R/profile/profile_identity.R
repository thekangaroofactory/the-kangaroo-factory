

#' Profile Identity
#'
#' @param person a list of named values
#' @param anonymous whether the output should mask lastname, phone & email. Default is FALSE
#' @param contact whether the contact info should be displayed. Default is TRUE
#'
#' @returns a list of html tags
#'
#' @examples

profile_identity <- function(person, anonymous = FALSE, contact = TRUE){
  
  # -- check parameters
  if(anonymous)
    contact <- FALSE
  
  # -- return
  tagList(
    
    # -- names
    h1(tools::toTitleCase(person$firstname), if(!anonymous) toupper(person$lastname)),
    
    # -- location
    p(class = "subtitle", person$location),
    
    # -- contacts
    if(contact)
      p(person$phone, br(),
        person$email))
  
}
