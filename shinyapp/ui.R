

# ------------------------------------------------------------------------------
# This is the user-interface definition of the Shiny web application.
# ------------------------------------------------------------------------------

# -- Declare theme
app_theme <- bs_theme(
  bg = "#2d3037",
  fg = "#fff",
  primary = "#e9dfc7",
  secondary = "#ececec",
  base_font = font_google("Quicksand"))


# -- Define application UI
page_navbar(
  
  # -- To observe selected tab
  id = "navbar",
  
  # -- Theme
  theme = app_theme,
  
  # -- Title
  title = "Philippe Peret",
  
  # -- header
  header = tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "./css/tkf.css"),
    includeHTML("./html/google-analytics.html"),
    tags$script(src = "./js/google_tag.js")),
  
  # -- footer
  fillable = FALSE,
  footer = p(style = "font-size:9pt;margin-top:20px;", "© 2025 TheKangarooFactory"),
 
  
  # ----------------------------------------------------------------------------
  # Tabs (nav_panel)
  # ----------------------------------------------------------------------------
  
  # -- Portfolio
  nav_panel(class = "p-5",
            value = "portfolio",
            title = "Portfolio", 

            h1("Portfolio"),
            portfolio_ui("portfolio")),
  
  
  # -- Service
  nav_panel(class = "p-5",
            value = "service",
            title = "Services", 
            
            service_ui("service")),
  
  
  # -- Profile
  nav_panel(class = "p-5",
            value = "profile",
            title = "Profile", 
            
            profile_ui("profile")),
  
  
  # -- Stack
  nav_panel(class = "p-5",
            value = "stack",
            title = "Technical Stack", 
            
            h1("Technical Stack"),
            stack_ui("stack")),
  
  
  # -- Contact
  nav_panel(class = "p-5",
            value = "contact",
            title = "Contacts & Links", 
            
            h1("Contacts & Links"),
            contact_ui("contact"),
            
            h4(class = "section",
               "Links to other platforms"),
            link_ui("contact"))
  
) # page_navbar
