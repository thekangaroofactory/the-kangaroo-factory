


key_takeaways <- function(profile, path = NULL, language = c("en", "fr"), full = FALSE, export = FALSE, printable = FALSE, DEBUG = FALSE){
  
  if(DEBUG)
    cat("[key_takeaways] \n")
  
  # -- check argument
  language <- match.arg(language)
  
  # -- add resource path
  if(full){
    my_path <- file.path(path, "philippeperet/profile")
    addResourcePath(prefix = "profile_media", directoryPath = my_path)}
  
  # -- return
  tagList(
    #class = paste("border-radius tkf-bg-camel color-dark", ifelse(export, ifelse(full, "mt-5", "mt-0"), "mt-5 p-3")),
    
    if(!export)
      profile_title(title = profile$title),
    
    # # -- title
    # card_header(
    #   class = "border-bottom-0",
    #   
    # 
    #   
    #   else
    #     tagList(
    #       h3(ifelse(language == "en", "Key Takeaways", "Points Clés")),
    #       p(style ="font-style: italic; font-weight: normal; margin-bottom: 0rem", 
    #         ifelse(language == "en", 
    #                "One-page profile summary", 
    #                "Résumé du profil en une page")))),
    
    
    # -- content
    layout_columns(
      class = "mt-5",
      
      # -- left
      # card(
      #   class = ifelse(printable, "border-0", "tkf-bg-dark"),
        
      tagList(
        profile_summary(profile$summary, language = language),

      tagList(
        
        if(!full && !isRunning())
          profile_career_path(profile$experiences, language = language)
        
        else {
          
          tagList(
            h3(ifelse(language == "en", "Career path (25 XP)", "Parcours professionnel (25 ans d'expérience)")),  
            img(src = paste0("profile_media/career_path_en", ifelse(printable, "_printable", ''), ".png")))}
        
      )),
      
      if(!export && !isRunning())
        profile_itemize(profile$takeaways)
      else
        layout_column_wrap(width = 1/2,
                           heights_equal = "row",
                           !!!profile_itemize(profile$takeaways))
      
    ))
  
}
