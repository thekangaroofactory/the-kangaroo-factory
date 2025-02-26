

profile_links <- function(){
  
  # -- layout
  layout_column_wrap(
    width = "30px",
    fixed_width = TRUE,
    
    # -- portfolio
    tooltip(
      tags$a(
        'data-value' = "link_profile_tkf",
        icon(class="icon color-contrast", "file"),
        target = "_blank",
        href = "https://www.thekangaroofactory.com/?user=philippeperet&nav=profile"),
      "See online version"),
    
    # -- linkedin
    tooltip(
      tags$a(
        'data-value' = "link_profile_linkedin",
        icon(class="icon color-contrast", "linkedin"),
        target = "_blank",
        href = "https://www.linkedin.com/in/philippeperet/"),
      "Visit my LinkedIn profile"),
    
    # -- portfolio
    tooltip(
      tags$a(
        'data-value' = "link_portfolio_tkf",
        icon(class="icon color-contrast", "briefcase"),
        target = "_blank",
        href = "https://www.thekangaroofactory.com/?user=philippeperet&nav=portfolio"),
      "Visit my portfolio"),
    
    # -- github
    tooltip(
      tags$a(
        'data-value' = "link_profile_github",
        icon(class="icon color-contrast", "github"),
        target = "_blank",
        href = "https://github.com/thekangaroofactory"),
      "Explore my GitHub repository")
    
  )
  
}
