


key_takeaways <- function(profile, path = NULL, language = c("en", "fr"), full = FALSE, export = FALSE, printable = FALSE){
  
  if(DEBUG)
    cat("[key_takeaways] \n")
  
  # -- check argument
  language <- match.arg(language)
  
  # -- add resource path
  if(full){
    my_path <- file.path(path, "philippeperet/profile")
    addResourcePath(prefix = "profile_media", directoryPath = my_path)}
  
  # -- return
  card(
    class = paste("border-radius bg-contrast", ifelse(export, ifelse(full, "mt-5", "mt-0"), "mt-5 p-3")),
    
    # -- title
    card_header(
      class = "border-bottom-0",
      
      if(!export)
        profile_title(title = profile$title)
      
      else
        tagList(
          h3(ifelse(language == "en", "Key Takeaways", "Points Clés")),
          p(style ="font-style: italic; font-weight: normal; margin-bottom: 0rem", 
            ifelse(language == "en", 
                   "One-page profile summary", 
                   "Résumé du profil en une page")))),
    
    
    # -- content
    layout_columns(
      
      # -- left
      card(
        class = ifelse(printable, "border-0", "bg-bg"),
        
        profile_summary(profile$summary, language = language),

      
      # -- middle
      tagList(
        
        if(!full)
          profile_career_path(profile$experiences, language = language)
        
        else {
          
          tagList(
            h4(ifelse(language == "en", "Career path (20+ XP)", "Parcours professionnel (20 ans d'expérience)")),  
            card(
              fill = FALSE,
              img(src = paste0("profile_media/career_path_en", ifelse(printable, "_printable", ''), ".png"))
  
            ))}
        
      )),
      
      if(!export)
        profile_itemize(profile$takeaways)
      else
        layout_column_wrap(width = 1/2, !!!profile_itemize(profile$takeaways))
      
    ))
  
}
