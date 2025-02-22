


profile_career_path <- function(experiences){
  
  # -- compute xp
  xp <- unlist(lapply(profile$experiences, function(x) x$start))
  xp <- min(as.Date(paste0(xp, "/01")))
  xp <- floor(as.numeric(difftime(Sys.Date(), xp, unit="weeks")) / 52.25)
  
  # -- helper
  helper <- function(x){
    tags$li(
      class = "mb-3",
      span(style = "font-weight: bold;", x$role), br(),
      span(style = "font-style: italic;", paste(x$company, "|", x$start, "-", x$end)), br(),
      HTML(x$summary))}
  
  # -- return
  tagList(
    
    # -- title
    h4(paste0("Career path (", xp, "y. XP)")),
    
    # -- list
    tags$ul(
      lapply(experiences, helper)))
  
}
