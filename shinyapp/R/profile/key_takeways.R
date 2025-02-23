


key_takeaways <- function(profile, path = NULL, export = FALSE, printable = FALSE){
  
  # -- add resource path
  if(!export){
    my_path <- file.path(path, "philippeperet/profile")
    addResourcePath(prefix = "profile_media", directoryPath = my_path)}
  
  # -- return
  card(
    class = paste("border-radius bg-contrast", ifelse(export, "mt-5", "mt-5 p-3")),

    # -- title
    card_header(
      class = "border-bottom-0",
      
      if(export)
        profile_title(title = profile$title)
      
      else
        tagList(
          h3("Key Takeaways"),
          p(style ="font-style: italic; font-weight: normal;", "One-page profile summary"))),
    
    
    # -- content
    layout_columns(
      col_widths = ifelse(export, c(8, 4), c(6, 6)),
      
      # -- left
      card(
        class = ifelse(printable, "border-0", ''),
        
        profile_summary(profile$summary),

      
      # -- middle
      tagList(
        
        if(export)
          profile_career_path(profile$experiences)
        
        else {
          
          tagList(
            h4("Career path (20+ XP)"),  
            card(
              fill = FALSE,
              img(src = paste0("profile_media/career_path_en", ifelse(printable, "_printable", ''), ".png"))
  
            ))}
        
      )),
      
      if(export)
        profile_itemize(profile$takeaways)
      else
        layout_column_wrap(width = 1/2, !!!profile_itemize(profile$takeaways))
      
    ))
  
}
