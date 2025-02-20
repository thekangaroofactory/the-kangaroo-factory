

#' Build Resume
#'
#' @param profile a list object, resulting from reading the json profile
#'
#' @returns an html ui
#'
#' @examples

build_resume <- function(profile, full = FALSE, anonymous = FALSE, contact = TRUE){

  # -- return
  page_fluid(
    
    # -- apply specific style
    includeCSS(path = "./export.css"),
    
    
    # -- header ----------------------------------------------------------------
    
    # -- identity
    profile_identity(person = profile$person,
                     anonymous = anonymous,
                     contact = contact),
    
    # -- links
    if(!anonymous)
      p(profile$links[profile$links$name == "linkedin"]$href),

    
    # -- one pager -------------------------------------------------------------
    key_takeaways(profile, export = TRUE),
    #key_takeaways_portrait(profile),

    # -- footer 
    p(style = "font-size:9pt;margin-top:20px;", "This document has been generated with R"),
    
    
    # -- Experiences -----------------------------------------------------------
    if(full)
      
      tagList(
        
        # -- Geodis
        div(
          class = "pt-5",
          style = "page-break-before: always;",
          experience_geodis()),
        
        # -- Freelance
        div(
          class = "pt-5",
          style = "page-break-before: always;",
          experience_freelance()),
        
        # -- DS QA
        div(
          class = "pt-5",
          style = "page-break-before: always;",
          experience_ds_qa()),
        
        # -- DS Support
        div(
          class = "pt-5",
          style = "page-break-before: always;",
          experience_ds_support()))
    
  )
}
