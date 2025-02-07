

# ------------------------------------------------------------------------------
# This is the ui / server logic of the Shiny web application.
# ------------------------------------------------------------------------------

# -- Dependencies
library(shiny)
library(bslib)


# -- Declare app theme
app_theme <- bs_theme(
  version = 5,
  bg = "#2d3037",
  fg = "#fff",
  primary = "#e9dfc7",
  secondary = "#ececec",
  base_font = font_google("Quicksand"))


# -- Set privacy level
anonymous <- F
contact <- F


# -- Define UI logic
ui <- page_fluid(
  
  theme = app_theme,
  class = "p-5",
  
  # -- Include shared css
  # because the app is not at the root level
  includeCSS("../www/css/tkf.css"),
  
  # -- Header
  layout_columns(
    col_widths = c(6, 3, 3),
    fillable = F,
    
    # -- Title
    profile_title(),
    
    # -- identity
    profile_identity(anonymous = anonymous, contact = contact),
    
    # -- links
    if(!anonymous)
      profile_links()),
  
  # -- One pager
  one_pager(path = "../../data"),
  
  # -- footer ------------------------------------------------------------------
  p(style = "font-size:9pt;margin-top:20px;", "© 2025 - This document has been generated with R"),
  
)


# -- Run the application 
shinyApp(ui = ui, server = function(input, output) {})
