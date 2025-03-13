

#' Profile Experience
#'
#' @param experience a list of objects
#'
#' @returns a list of tags
#'
#' @examples

profile_experience <- function(experience, language = c("en", "fr")){

  if(DEBUG)
    cat("[profile_experience] \n")
    
  # -- check argument
  language <- match.arg(language)
  
  # -- return
  div(
    class = "pt-5",
    style = "page-break-before: always;",
    
    # -- header section
    card(
      class = "bg-contrast",
      div(
        
        # -- header content
        h3(experience$role),
        p(class = "subtitle", experience_subtitle(experience, language)),
        p(HTML(experience$pitch)),
        keywords(experience$tags))),
    
    
    # -- body section (2 columns)
    layout_column_wrap(
      
      # -- left column
      tagList(
        h4(ifelse(language == "en", "Mission & Responsibilities", "Mission & Responsabilités")),
        profile_itemize(experience$details)),
      
      # -- right column
      tagList(
        
        # -- 1st row
        card(
          class = "border border-light",
          card_header(ktools::toupperfirst(names(experience$frames[1]))),
          card_body(
            profile_itemize(experience$frames[1], skip = T))),
        
        # -- 2nd row (sub-columns)
        layout_column_wrap(
          
          # -- left
          card(
            class = "border border-light",
            card_header(ktools::toupperfirst(names(experience$frames[2]))),
            card_body(
              tags$span(keywords(experience$frames[[2]])))),
          
          # -- right
          card(
            class = "border border-light",
            card_header(ktools::toupperfirst(names(experience$frames[3]))),
            card_body(
              tags$span(keywords(experience$frames[[3]]))))),
        
        # -- 3rd row
        card(
          class = "border border-light",
          card_header(ktools::toupperfirst(names(experience$frames[4]))),
          card_body(
            profile_itemize(experience$frames[[4]]))))))
  
}
