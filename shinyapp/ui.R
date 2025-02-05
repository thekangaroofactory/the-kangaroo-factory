

# ------------------------------------------------------------------------------
# This is the user-interface definition of the Shiny web application.
# ------------------------------------------------------------------------------

# -- Define UI
page_navbar(
  
  # -- Theme
  theme = bs_theme(
    bg = "#2d3037",
    fg = "#FFF",
    primary = "#e9dfc7", # try A28E6A + blue #f4efe3 ffeaa8
    secondary = "#ececec",
    base_font = font_google("Quicksand")),
  
  # -- Title
  title = "Philippe Peret",
  fillable = FALSE,
  header = tags$link(rel = "stylesheet", type = "text/css", href = "./css/tkf.css"),
  footer = p(style = "font-size:9pt;margin-top:20px;", "© 2025 TheKangarooFactory"),
 
  
  # ----------------------------------------------------------------------------
  # Tabs (nav_panel)
  # ----------------------------------------------------------------------------
  
  # -- Portfolio
  nav_panel(class = "p-5",
            title = "Portfolio", 
            
            h1("Portfolio"),
            portfolio_ui("portfolio")),
  
  
  # -- Profile
  nav_panel(class = "p-5",
            title = "Profile", 
            
            profile_ui("profile"),
            
            htmlOutput('pdfviewer')),
  
  
  # -- Stack
  nav_panel(class = "p-5",
            title = "Technical Stack", 
            
            h1("Technical Stack"),
            stack_ui("stack")),
  
  
  # -- Contact
  nav_panel(class = "p-5",
            title = "Contacts & Links", 
            
            h1("Contacts & Links"),
            contact_ui("contact"),
            link_ui("contact"))
  
) # page_navbar
