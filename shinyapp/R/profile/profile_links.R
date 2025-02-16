

profile_links <- function(){
  
  # -- layout
  layout_column_wrap(
    width = "30px",
    fixed_width = TRUE,
    
    # -- portfolio
    tooltip(
      tags$a(
        'data-value' = "link_profile_tkf",
        icon(style="font-size: 36px; color: #726d67;", "file"),
        target = "_blank",
        href = "https://www.thekangaroofactory.com/?user=philippeperet&nav=profile"),
      "See online version"),
    
    # -- linkedin
    tooltip(
      tags$a(
        'data-value' = "link_profile_linkedin",
        icon(style="font-size: 36px; color: #726d67;", "linkedin"),
        target = "_blank",
        href = "https://www.linkedin.com/in/philippeperet/"),
      "Visit my LinkedIn profile"),
    
    # -- portfolio
    tooltip(
      tags$a(
        'data-value' = "link_portfolio_tkf",
        icon(style="font-size: 36px; color: #726d67;", "briefcase"),
        target = "_blank",
        href = "https://www.thekangaroofactory.com/?user=philippeperet&nav=portfolio"),
      "Visit my portfolio"),
    
    # -- github
    tooltip(
      tags$a(
        'data-value' = "link_profile_github",
        icon(style="font-size: 36px; color: #726d67;", "github"),
        target = "_blank",
        href = "https://github.com/thekangaroofactory"),
      "Explore my GitHub repository")
    
  )
  
}
