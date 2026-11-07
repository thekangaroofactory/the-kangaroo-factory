

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
    
    # -- js
    tags$script(
      
      "// -- button with class ktag
      $(document).on('click', '.ktag', function(event) {
        
        console.log(event.currentTarget.id);
        Shiny.setInputValue('ktag_event', {when: Date.now(), what: event.currentTarget.id});
        
      });"
      
    )
    
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
                loader(id = "loader", label = "Fetching external data...")),
            
            next_steps(),
            
            # service_ui()
            
            ),
  
  # -- Open source
  nav_panel(class = "p-5",
            value = "open-source",
            title = "Open source", 

            hero_section(title = "Open Source", 
                         description = "Some cool stuff about my work goes here.",
                         actions = list(primary = list(id = "os-github", label = "GitHub", icon = icon("github")))),
            
            package_ui(),
            
            guide_ui(),
            
            ),
  
  # -- AI
  nav_panel(class = "p-5",
            value = "ai",
            title = "AI", 
            
            hero_section(title = "AI", 
                         description = "Model, performance & benchmark."),
            
            div(class = "section-container",
                h2("Models"),
                p("Get the metrics from Supabase Cloud.")),
            
            div(class = "section-container",
                h2("Benchmark"),
                p("Get the benchmark from Kaggle API."))
            
  ),
      
  # -- Portfolio
  nav_panel(class = "p-5",
            value = "projects",
            title = "Projects", 
            
            hero_section(title = "Projects", 
                         description = "Data-driven projects that showcase the power and flexibility of open source approaches."),
            
            div(class = "section-container",
                     h2("Featured")),
            
            div(id = "project-placeholder",
                     class="cards-container"),
            
            # portfolio_ui("portfolio")
            ),
  
  
  # -- Lab
  nav_panel(class = "p-5",
            value = "lab",
            title = "Lab", 
            
            h1("The Lab"),
            lab_ui("lab")),
  
  
  # -- Blog
  nav_panel(class = "p-5",
            value = "blog",
            title = "Blog", 
            
            hero_section(title = "Blog", description = "Take it from the RSS feed."),
            
            div(class = "section-container",
                h1("Posts"),
                p("The Quarto version is available", 
                  a(href = "https://thekangaroofactory.github.io/the-kangaroo-factory-blog/", target = "_blank", "here."))),
            
            div(id = "blog-placeholder",
                class="cards-container")),
  
  
  # -- Wiki
  nav_panel(class = "p-5",
            value = "wiki",
            title = "Wiki", 
            
            hero_section(title = "Wiki", description = "Take it from the RSS feed."),
            
            div(class = "section-container",
                h1("Articles"),
                p("The Quarto version is available", 
                  a(href = "https://thekangaroofactory.github.io/the-kangaroo-factory-wiki/", target = "_blank", "here."))),
            
            div(id = "wiki-placeholder",
                class="cards-container")),
  
  
  # -- About
  nav_panel(class = "p-5",
            value = "about",
            title = "About", 
            
            about_ui()),
  
  # -- light / dark mode switch
  nav_item(
    input_dark_mode(id = "switch_mode", mode = "dark")),
  
  # -- Spacing
  nav_spacer(),
  
  # -- Links (on the right)
  nav_item(
    a(id = "linkedin",
           class = "external-link nav-link ktag",
           href = "https://www.linkedin.com/in/philippeperet/",
           target = "_blank",
           icon("linkedin", class = "fa-xl"))),
  
  nav_item(
    a(id = "github",
           class = "external-link nav-link ktag",
           href = "https://github.com/thekangaroofactory",
           target = "_blank",
           icon("github", class = "fa-xl"))),
  
  nav_item(
    a(id = "youtube",
           class = "external-link nav-link",
           href = "https://www.youtube.com/@TheKangarooFactory",
           target = "_blank",
           icon("youtube", class = "fa-xl"))),
  
  nav_item(
    a(id = "mastodon",
           class = "external-link nav-link",
           href = "https://mastodon.social/@thekangaroofactory",
           target = "_blank",
           icon("mastodon", class = "fa-xl")))
  
) # page_navbar
