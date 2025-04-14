

download_filename <- function(user, type, options){
  
  paste0(ktools::toupperfirst(user$firstname),
         if(!"Anonymous" %in% options) paste0("_", toupper(user$lastname)),
         paste0("_", type),
         if("Printable" %in% options) "_printable", 
         ".pdf")
  
}
