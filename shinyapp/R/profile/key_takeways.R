

key_takeaways <- function(profile, path = NULL, export = FALSE, shiny = isRunning()){
  
  # -- add resource path
  if(shiny){
    my_path <- file.path(path, "philippeperet/profile")
    addResourcePath(prefix = "profile_media", directoryPath = my_path)}
  
  # -- return
  card(
    class = paste("border-radius bg-contrast", ifelse(export, "mt-5", "mt-5 p-3")),
    
    # -- title
    card_header(
      class = "border-bottom-0",
      
      if(export)
        profile_title(title = profile$title$main, subtitle = profile$title$subtitle)
      
      else
        tagList(
          h3("Key Takeaways"),
          p(style ="font-style: italic; font-weight: normal;", "One-page profile summary"))),
    
      # class = "d-flex border-bottom-0",
      # div(
      #   class = "flex-column",
      #   h2("Key Takeaways"),
      #   p(style ="font-style: italic; font-weight: normal;", "One-page profile summary"))),
    
    
    # -- content
    layout_columns(
      col_widths = c(8, 4),
      
      # -- left
      card(
        
        profile_summary(profile$summary),
        
        # h4("Presentation"),
        # p("Since 2001, it has always been about data projects and technical-functional roles:", br(),
        #   "From Data Management, then Data Exchanges & Transformation to Data Analysis & Visualization"),
        # p("I enjoy working with complex data pipelines & carefully designed dashboards."),
        
        
        if(export)
          profile_career_path(profile$experiences)
        
        else {
          
          tagList(
            h4("Career path (20+ XP)"),  
            card(
              fill = FALSE,
              #img(src = "profile_media/career_path_en.png")
              p("image goes here")
            ))}
        
      ),
      
      # layout_column_wrap(
      #   heights_equal = "row",
      #   !!!profile_itemize(profile$takeaways))
      
      profile_itemize(profile$takeaways)
      
      # # -- middle
      # tagList(
      #   
      #   h4("Data Expertise"),
      #   tags$ul(
      #     tags$li("Management & Governance"),
      #     tags$li("Quality"),
      #     tags$li("Pipelines & Transformation"),
      #     tags$li("Analysis & Visualization")),
      #   
      #   h4("Specific skills"),
      #   tags$ul(
      #     tags$li("Collect & advocate business needs"),
      #     tags$li("Full-Stack data approach"),
      #     tags$li("Speak same language as tech. teams"),
      #     tags$li("Problem solver")),
      #   
      #   h4("Specific domains"),
      #   tags$ul(
      #     tags$li("Transportation & logistic"),
      #     tags$li("CSR")),
      #   
      #   h4("Team management"),
      #   tags$ul(
      #     tags$li("35 people"))),
      # 
      # # -- right
      # tagList(
      #   
      #   h4("Key stack"),
      #   tags$ul(
      #     tags$li("R / Python"),
      #     tags$li("SQL")),
      #   
      #   h4("Key tools"),
      #   tags$ul(
      #     tags$li("Power.BI"),
      #     tags$li("Data Galaxy")),
      #   
      #   h4("Latest training"),
      #   tags$ul(
      #     tags$li("Generative AI with LLMs")),
      #   
      #   h4("Certifications & Degrees"),
      #   tags$ul(
      #     tags$li("Data Science & Machine Learning"),
      #     tags$li("Automotive Engineer (ESTACA)")),
      #   
      #   h4("Languages"),
      #   tags$ul(
      #     tags$li("French (native)"),
      #     tags$li("English (fluent)")))
      
    ))
  
  
}