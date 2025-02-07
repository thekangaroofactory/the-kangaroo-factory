

profile_links <- function(){
  
  layout_column_wrap(
    width = "30px",
    fixed_width = TRUE,
    
    # tooltip(
    #   tags$a(
    #     'data-value' = "link_p3_app_shinyio",
    #     icon(style="font-size: 36px; color: #726d67;", "arrow-up-right-from-square"),
    #     target = "_blank",
    #     href ="http://google.com"),
    #   "See full resume"),
    
    tooltip(
      tags$a(
        'data-value' = "link_profile_linkedin",
        icon(style="font-size: 36px; color: #726d67;", "linkedin"),
        target = "_blank",
        href = "https://www.linkedin.com/in/philippeperet/"),
      "Visit my LinkedIn profile"),
    
    tooltip(
      tags$a(
        'data-value' = "link_profile_github",
        icon(style="font-size: 36px; color: #726d67;", "github"),
        target = "_blank",
        href = "https://github.com/thekangaroofactory"),
      "Explore my GitHub repository"),
    
    # tooltip(
    #   tags$a(
    #     'data-value' = "link_p3_app_shinyio",
    #     icon(style="font-size: 36px; color: #726d67;", "briefcase"),
    #     target = "_blank",
    #     href = "https://www.google.com/"),
    #   "See my portfolio"),
    
  )
  
}
