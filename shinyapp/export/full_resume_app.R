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
  
  # -- header
  layout_columns(
    col_widths = c(6, 3, 3),
    fillable = F,
    
    # -- title
    profile_title(),
    
    # -- identity
    profile_identity(anonymous = anonymous, contact = contact),
    
    # -- links
    if(!anonymous)
      profile_links()
    
  ),
  
  # -- one pager ---------------------------------------------------------------
  one_pager(),
  
  
  # -- Experiences -------------------------------------------------------------
  
  # -- geodis
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
    experience_ds_support()),
  
  
  # -- footer ------------------------------------------------------------------
  p(style = "font-size:9pt;margin-top:20px;", "© 2025 - This document has been generated with R"),
  
  
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  
}

# Run the application 
shinyApp(ui = ui, server = server)
