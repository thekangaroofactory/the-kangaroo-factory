

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
            
            portfolio_ui("portfolio")
            
            ),
  
  
  # -- Profile
  nav_panel(class = "p-5",
            title = "Profile", 
            
            img(src = "./img/career_path.png",
                style = "width: 60%;"),
            
            htmlOutput('pdfviewer')),
  
  
  # -- Contact
  nav_panel(class = "p-5",
            title = "Contact", 
            
            h1("Contacts"),
            
            tags$a(href = "https://www.linkedin.com/in/philippeperet/", 
                   target = "_blank",
                   "LinkedIn"),
            
            tags$a(href = "https://github.com/thekangaroofactory",
                   target = "_blank",
                   "GitHub"),
            
            tags$a(href = "https://orcid.org/0009-0003-9666-7490",
                   target = "_blank",
                   "ORCID"))
  
) # page_navbar
