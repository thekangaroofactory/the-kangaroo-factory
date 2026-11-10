

# ------------------------------------------------------------------------------
# This is the user-interface definition of the Shiny web application.
# ------------------------------------------------------------------------------

# -- Declare theme
# Comment some properties to support dark mode #104
app_theme <- bs_theme(
  version = 5,
  #bg = "#2d3037",
  #fg = "#ececec",
  primary = "#c09f7f",
  #secondary = "#ececec",
  base_font = font_google("Quicksand"),
  font_scale = 17/16)


# -- Define application UI
page_navbar(
  
  # -- To observe selected tab
  id = "navbar",
  
  # -- Theme
  theme = app_theme,
  
  # -- Title
  title = "TKF",
  window_title = "TheKangarooFactory",
  
  # -- header
  header = tags$head(
    
    # -- JavaScript
    shinyjs::useShinyjs(),
    
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
    tags$link(rel = "stylesheet", type = "text/css", href = "./css/stats.css"),
    tags$link(rel = "stylesheet", type = "text/css", href = "./css/next_steps.css"),
    tags$link(rel = "stylesheet", type = "text/css", href = "./css/hero.css"),
    tags$link(rel = "stylesheet", type = "text/css", href = "./css/loader.css"),
    tags$link(rel = "stylesheet", type = "text/css", href = "./css/pack.css"),
    tags$link(rel = "stylesheet", type = "text/css", href = "./css/custom_modal.css"),
    tags$link(rel = "stylesheet", type = "text/css", href = "./css/bot.css"),
    
    # -- js
    tags$script(src = "./js/custom_modal.js"),
    tags$script(src = "./js/bot.js"),
    tags$script(src = "./js/scroll.js"),
    
    # -- js
    tags$script(
      
      "// -- button with class ktag
      $(document).on('click', '.ktag', function(event) {
        
        console.log(event.currentTarget.id);
        Shiny.setInputValue('ktag_event', {when: Date.now(), what: event.currentTarget.id});
        
      });"
      
    ),
    
    # -- implement modal window
    # so that it's available across the app
    custom_modal()
    
    ),

  # -- footer
  fillable = FALSE,
  footer = p(class = "footer", 
             paste("©", format(Sys.Date(), "%Y"), "TheKangarooFactory"), "|",
             actionLink(inputId = "legal_notice", label = "legal notice", class = "ktag")),
  

  # ----------------------------------------------------------------------------
  # Tabs (nav_panel)
  # ----------------------------------------------------------------------------

  # -- Home
  nav_panel(class = "p-5",
            value = "home",
            title = "Home", 
            
            hero_section(title = "Welcome!", description = "Jump back in, or explore something new."),
            
            div(id = "stats-placeholder",
                class = "section-container",
                loader(id = "loader", label = "Fetching data...")),
        
            # the bot    
            div(
              class = "section-container",
              div(class = "chat-container",
                  div(class = "message bot-message",
                      tags$span(id = "bot-text", "Waiting for the data..."),
                      tags$span(class = "cursor", HTML("&nbsp;"))))),
            
            # placeholder
            div(id = "next-steps-placeholder")
            
            ),
  
  # -- About
  nav_panel(class = "p-5",
            value = "about",
            title = "About", 
            
            about_ui()),
  
  # -- light / dark mode switch
  nav_item(
    input_dark_mode(id = "switch_mode", mode = "dark")),
  
  # -- Spacing
  nav_spacer()

)
