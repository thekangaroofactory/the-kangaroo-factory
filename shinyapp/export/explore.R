

# -- Dependencies
library(shiny)
library(bslib)

printable <- T

# -- Declare app theme
app_theme <- bs_theme(
  version = 5,
  bg = ifelse(printable, "#fff", "#2d3037"),
  fg = ifelse(printable, "#000", "#fff"),
  primary = ifelse(printable, "#000", "#e9dfc7"),
  secondary = ifelse(printable, "#000", "#ececec"),
  base_font = font_google("Quicksand"))


ui <- page_fluid(
  
  theme = app_theme,
  class = "p-5",
  
  if(printable)
    includeScript("../www/js/update_css_var.js"),
  
  # -- include shared css
  # because the app is not at the root level
  includeCSS("../www/css/tkf.css"),
  
  key_takeaways(path = "../../data", printable = FALSE)
  
)




server <- function(input, output, session){
  
  
  writeLines(HTML(as.character(ui)), con = file("test.html"))
  
  print(ui)
  
  pagedown::chrome_print(input = "test.html",
                         output = "test.pdf",
                         format = "pdf")
  
}


# -- Run the application
shinyApp(ui = ui, server = server)

