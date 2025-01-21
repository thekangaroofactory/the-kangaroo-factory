
# -- 
# This is the user-interface definition of a Shiny web application.
# --


# Define UI for application
page_navbar(
  
  # -- include css
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "./css/tkf.css")),
  
  # -- theme
  theme = bs_theme(
    bg = "#2d3037",
    fg = "#FFF",
    primary = "#ffeaa8", # try A28E6A + blue
    secondary = "#ececec",
    base_font = font_google("Quicksand")),
  
  # -- title
  title = "Philippe Peret",
  
  # -- footer
  fillable = FALSE,
  footer = p(style = "font-size:9pt;margin-top:20px;", "© 2025 TheKangarooFactory"),
 
  # -- portfolio
  nav_panel(title = "Portfolio", 
            
            # -- Todo: transform this into a back-end output
            # implement a shiny module for that
            
            card(
              class = "portfolio",
              max_height = "60%",
              full_screen = TRUE,
              
              # -- header
              card_header(h2("France Election"), br(), 
                          h5("Data visualization app")),
              
              # -- body / 2 columns
              layout_columns(
                
                # -- col1
                card_body(
                  "The app displays the results of an election on administrative
                  areas (cities, department) with gradient colors depending on the
                  candidate's performance.",
                  actionButton(inputId = "start_btn",
                               label = "Visit the page",
                               class = "rounded-pill btn-sm",
                               style = "padding: 5px 25px 5px 25px; width: 50%;")),
                
                # -- col2
                navset_underline(
                  
                  nav_panel(title = "Screenshots",
                            img(
                              width = "50%",
                              style = "margin: 20px 0;",
                              src = "./img/france_election.png",
                              alt = "Shiny's hex sticker")),
                  
                  nav_panel(title = "Stack",
                            tags$ul(
                              tags$li("R / Shiny"),
                              tags$li("Docker"))),
                  
                  nav_panel(title = "Data", 
                            p("The datasets are provided by data.gouv.fr")),
                  
                  nav_panel(title = "Activity",
                            p("Some awesome plot on top of API call to github or google analytics")))),
              
              # -- footer
              card_footer(style = "text-align: right;", icon(name = "github"), "links")),
            
            p(style = "text-align: center;", "This portfolio is a R Shiny module.")),
  
  
  
  # -- profile
  # insert ui & outputs + backend server logic (module)
  nav_panel(title = "Profile", 
            img(src = "./img/career_path.png",
                style = "width: 60%;"),
            
            htmlOutput('pdfviewer'),
            
            p("My profile goes here.")),
  
  
  # -- contact
  nav_panel(title = "Contact", 
            
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
