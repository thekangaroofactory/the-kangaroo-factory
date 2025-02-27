

#' Build Resume
#'
#' @param profile a list object, resulting from reading the json profile
#'
#' @returns an html ui
#'
#' @examples

build_resume <- function(profile, full = FALSE, anonymous = FALSE, contact = TRUE, printable = FALSE, www = "./"){
  
  # -- return
  page_fluid(

    # -- header ----------------------------------------------------------------
    
    # -- identity
    profile_identity(person = profile$person,
                     anonymous = anonymous,
                     contact = contact),
    
    # -- links
    if(!anonymous)
      p(profile$links[profile$links$name == "linkedin"]$href),

    
    # -- one pager -------------------------------------------------------------
    key_takeaways(profile, export = TRUE, printable = printable),

    # -- footer 
    p(style = "font-size:9pt;margin-top:20px;", "This document has been generated with R"),
    
    
    # -- Experiences -----------------------------------------------------------
    if(full)
      lapply(profile$experiences, profile_experience)
      
  )
}
