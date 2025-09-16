

# ------------------------------------------------------------------------------
# This is the user-interface definition of the Shiny web application.
# ------------------------------------------------------------------------------

# -- Declare theme
app_theme <- bs_theme(
  version = 5,
  bg = "#2d3037",
  fg = "#ececec",
  primary = "#c09f7f",
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
  window_title = "Philippe PERET | TheKangarooFactory",
  
  # -- header
  header = tags$head(
    
    # -- meta tags
    tags$meta(charset="UTF-8"),
    tags$meta(name="description", content="Data project portfolio and data science services. 
              Power your business with automated data pipelines and carefully designed dashboards & apps."),
    tags$meta(name="robots", content="all"),
    
    # -- favicon
    tags$link(rel="shortcut icon", href="./img/favicon_196x196.png"),
    
    # -- css
    tags$link(rel = "stylesheet", type = "text/css", href = "./css/base.css"),
    tags$link(rel = "stylesheet", type = "text/css", href = "./css/color_web.css"),
    
    # -- Google Analytics
    if(GTAG){
      tagList(
        includeHTML("./www/html/google-analytics.html"),
        tags$script(src = "./js/google_tag.js"))}),
  
  # -- footer
  fillable = FALSE,
  footer = p(class = "footer", "© 2025 TheKangarooFactory"),
  
  
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
            value = "services",
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
  
  
  # -- Blog
  nav_panel(class = "p-5",
            value = "blog",
            title = "Blog", 
            
            blog_ui()),
  
  
  # -- Wiki
  nav_panel(class = "p-5",
            value = "wiki",
            title = "Wiki",
            
            wiki_ui()),
  
  
  # -- Contact
  nav_panel(class = "p-5",
            value = "contact",
            title = "Contacts & Links", 
            
            h1("Contacts & Links"),
            contact_ui("contact"),
            
            h4(class = "section",
               "Links to other platforms"),
            link_ui("contact")),
  
  # -- Spacing
  nav_spacer(),
  
  # -- Links (on the right)
  nav_item(
    tags$a(
      class = "external-link nav-link",
      'data-value' = "linkedin",
      href = "https://www.linkedin.com/in/philippeperet/",
      target = "_blank",
      icon("linkedin", class = "fa-xl"))),
  
  nav_item(
    tags$a(
      class = "external-link nav-link",
      'data-value' = "github",
      href = "https://github.com/thekangaroofactory",
      target = "_blank",
      icon("github", class = "fa-xl"))),
  
  nav_item(
    tags$a(
      class = "external-link nav-link",
      'data-value' = "youtube",
      href = "https://www.youtube.com/@TheKangarooFactory",
      target = "_blank",
      icon("youtube", class = "fa-xl")))
  
) # page_navbar
