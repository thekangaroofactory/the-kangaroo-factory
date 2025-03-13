

profile_career_path <- function(experiences, language = c("en", "fr")){
  
  # -- compute xp
  xp <- unlist(lapply(experiences, function(x) x$start))
  xp <- min(as.Date(if(language == "en") paste0(xp, "/01") else paste0("01/", xp), format = ifelse(language == "en", "%Y/%m/%d", "%d/%m/%Y")))
  xp <- floor(as.numeric(difftime(Sys.Date(), xp, unit="weeks")) / 52.25)
  
  # -- helper
  helper <- function(x){
    tags$li(
      class = "mb-3",
      span(style = "font-weight: bold;", x$role),
      span(paste("|", x$company, paste0("(", ifelse(x$end == "NA", paste(ifelse(language == "en", "Since", "Depuis"), x$start), paste(x$start, "-", x$end)), ")"))), br(),
      HTML(x$summary))}
  
  # -- return
  tagList(
    
    # -- title
    h4(ifelse(language == "en", 
              paste0("Career path (", xp, "y. XP)"),
              paste0("Parcours professionnel (", xp, "ans d'expérience)"))),
    
    # -- list
    tags$ul(
      lapply(experiences, helper)))
  
}
