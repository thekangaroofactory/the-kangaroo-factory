#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#

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


# -- set privacy level
anonymous <- F
contact <- F


# -- Add resource path
# because the app is not at the root level
addResourcePath(prefix = "img", directoryPath = "../www/img")


# Define UI for application that draws a histogram
ui <- page_fluid(
  
  theme = app_theme,
  class = "p-5",
  
  # -- include shared css
  # because the app is not at the root level
  includeCSS("../www/css/tkf.css"),
  
  # -- content
  layout_columns(
    col_widths = c(6, 3, 3),
    fillable = F,
    
    # -- header
    profile_title(),
    profile_identity(anonymous = anonymous, contact = contact),
    if(!anonymous)
      profile_links()
    
  ),
  
  # -- one pager
  one_pager(),
  
  p(style = "font-size:9pt;margin-top:20px;", "© 2025 - This document has been generated with R"),
  
  
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  
}

# Run the application 
shinyApp(ui = ui, server = server)
