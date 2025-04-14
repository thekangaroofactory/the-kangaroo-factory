

# ------------------------------------------------------------------------------
# This is the ui / server logic of the Shiny web application.
# ------------------------------------------------------------------------------

# -- Dependencies
library(shiny)
library(bslib)


# -- Set options & privacy level
full_resume <- T
anonymous <- F
contact <- T
language <- "en"

# -- set output options
export <- T
printable <- F


# -- Declare app theme
app_theme <- bs_theme(
  version = 5,
  bg = ifelse(printable, "#fff", "#2d3037"),
  fg = ifelse(printable, "#000", "#fff"),
  primary = ifelse(printable, "#000", "#e9dfc7"),
  secondary = ifelse(printable, "#000", "#ececec"),
  base_font = font_google("Quicksand"))


# -- read user profile
profile <- read_profile(path = file.path(path$data, "philippeperet", "profile"), language = language)


# -- Build UI
ui <- page_fluid(
  
  theme = app_theme,
  class = "p-5",
  
  if(printable)
    includeScript("../www/js/update_css_var.js"),
  
  # -- include shared css
  # because the app is not at the root level
  includeCSS("../www/css/base.css"),
  includeCSS("../www/css/color_web.css"),
  
  # -- header
  layout_columns(
    col_widths = c(6, 3, 3),
    fillable = F,
    
    # -- title
    profile_title(title = profile$title),
    
    # -- identity
    profile_identity(person = profile$person, anonymous = anonymous, contact = contact),
    
    # -- links
    if(!anonymous)
      profile_links(language = language)
    
  ),
  
  # -- one pager ---------------------------------------------------------------
  key_takeaways(profile = profile, path = "../../data", language = language, full = full_resume, export = export, printable = printable),
  
  
  # -- Experiences -------------------------------------------------------------
  if(full_resume)
      lapply(profile$experiences, profile_experience, language),
  
  
  # -- footer ------------------------------------------------------------------
  # p(class = "footer", "© 2025 - This document has been generated with R"),
  
)


# -- Server
server <- function(input, output, session){
  
  # -- set printable
  if(printable){
    
    cat("Set printable \n")
    colors <- list(dark = "#000", light = "#fff")
    session$sendCustomMessage("set_printable", colors)}
  
}


# -- Run the application
shinyApp(ui = ui, server = server)
