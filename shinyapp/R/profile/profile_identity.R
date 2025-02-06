

profile_identity <- function(anonymous = FALSE, contact = TRUE){
  
  # -- check params
  if(anonymous)
    contact <- FALSE
  
  # -- return
  tagList(
    
    h1("Philippe", if(!anonymous) "PERET"),
    
    if(contact)
      p("06.10.48.30.14", br(),
        "philippe.peret@hotmail.com")
    
  )
  
}
