

# ------------------------------------------------------------------------------
# This is the ui / server logic of the Shiny web application.
# ------------------------------------------------------------------------------

# -- Dependencies
library(shiny)
library(bslib)


# -- Set options & privacy level
full_resume <- F
anonymous <- F
contact <- T

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
profile <- read_profile(path = file.path(path$data, "philippeperet", "profile"))


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
  
  # header = tags$head(
  #   
  #   # -- css
  #   tags$link(rel = "stylesheet", type = "text/css", href = "./css/base.css"),
  #   tags$link(rel = "stylesheet", type = "text/css", href = "./css/color_web.css")),
  
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
      profile_links()
    
  ),
  
  # -- one pager ---------------------------------------------------------------
  key_takeaways(profile = profile, path = "../../data",  export = export, printable = printable),
  
  
  # -- Experiences -------------------------------------------------------------
  if(full_resume)
    
    tagList(
      
      # -- Geodis
      div(
        class = "pt-5",
        style = "page-break-before: always;",
        experience_geodis()),
      
      # -- Freelance
      div(
        class = "pt-5",
        style = "page-break-before: always;",
        experience_freelance()),
      
      # -- DS QA
      div(
        class = "pt-5",
        style = "page-break-before: always;",
        experience_ds_qa()),
      
      # -- DS Support
      div(
        class = "pt-5",
        style = "page-break-before: always;",
        experience_ds_support())),
  
  
  # -- footer ------------------------------------------------------------------
  p(class = "footer", "© 2025 - This document has been generated with R"),
  
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
