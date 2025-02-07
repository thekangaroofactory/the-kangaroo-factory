

# ------------------------------------------------------------------------------
# This is the user-interface definition of the Shiny web application.
# ------------------------------------------------------------------------------

# -- Declare app theme
app_theme <- bs_theme(
  bg = "#2d3037",
  fg = "#fff",
  primary = "#e9dfc7",
  secondary = "#ececec",
  base_font = font_google("Quicksand"))


# -- Define UI
page_navbar(
  
  # -- id to observe
  id = "navbar",
  
  # -- Theme
  theme = app_theme,
  
  # -- Title
  title = "Philippe Peret",
  fillable = FALSE,
  
  # -- header
  header = tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "./css/tkf.css"),
    tags$script(src = "./js/google_tag.js")),
  
  # -- footer
  footer = p(style = "font-size:9pt;margin-top:20px;", "© 2025 TheKangarooFactory"),
 
  
  # ----------------------------------------------------------------------------
  # Tabs (nav_panel)
  # ----------------------------------------------------------------------------
  
  # -- Portfolio
  nav_panel(class = "p-5",
            title = "Portfolio", 

            h1("Portfolio"),
            portfolio_ui("portfolio")),
  
  
  # -- Service
  nav_panel(class = "p-5",
            title = "Services", 
            
            service_ui("service")),
  
  
  # -- Profile
  nav_panel(class = "p-5",
            title = "Profile", 
            
            profile_ui("profile")),
  
  
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
            h4(class = "section",
               "Visit my profiles on other platforms"),
            link_ui("contact"))
  
) # page_navbar
