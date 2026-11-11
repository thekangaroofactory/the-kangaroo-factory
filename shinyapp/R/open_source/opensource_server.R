

# ------------------------------------------------------------------------------
# Module Server logic
# ------------------------------------------------------------------------------

opensource_server <- function(id, config, package_mart, parent_session) {
  moduleServer(id, function(input, output, session) {
    
    # -- get namespace
    ns <- session$ns
    
    
    # --------------------------------------------------------------------------
    # Insert tab
    # --------------------------------------------------------------------------
    
    # define UI
    nav <- nav_panel(class = "p-5",
                     value = "open-source",
                     title = "Open source", 
                     
                     # title section
                     hero_section(title = "Open Source", 
                                  description = "Featured work.",
                                  actions = list(primary = list(id = "os-github", 
                                                                label = "GitHub", 
                                                                icon = icon("github"),
                                                                link = config$github))),
                     
                     # templates (where to insert cards)
                     package_ui(),
                     guide_ui())
    
    # insert UI
    nav_insert(id = "navbar", 
               nav = nav, 
               target = "home", 
               position = "after", 
               session = parent_session)
    
    
    # --------------------------------------------------------------------------
    # Feed Package Placeholder
    # --------------------------------------------------------------------------

    # helper: build & insert card
    helper <- function(package){
      
      # generate card
      ui <- asset_card(id = package$id,
                       title = package$Package,
                       description = package$Title,
                       type = "Package",
                       icon = icon("code"),
                       img = "https://picsum.photos/520/270?random=1&grayscale&blur",
                       footer = tagList(span(icon("laptop")), a(href = package$`_pkgdown`, target = "_blank", "Page"),
                                        span(icon("rocket")), a(href = paste0(package$Repository, "/", package$Package), target = "_blank", "Repository")),
                       tag = package$Version)
      
      # insert UI
      insertUI(selector = "#package-placeholder",
               where = "beforeEnd",
               ui = ui)
      
    }
    
    # intro
    insertUI(selector = "#package-placeholder",
             where = "beforeBegin",
             ui = p("Packages published to ", popover(a(href = config$runiverse, target = "_blank", "R-universe"), "Go to the universe"), icon("rocket")))
    
    # apply helper
    lapply(package_mart, helper)
    
    
    # --------------------------------------------------------------------------
    # Feed Guides Placeholder
    # --------------------------------------------------------------------------
    
    # get info from config
    guides_mart <- config$guides
    
    # helper: build & insert card
    helper <- function(guide){
      
      # generate card
      ui <- asset_card(id = guide$id,
                       title = guide$title,
                       description = guide$description,
                       type = "Guide",
                       icon = icon("book"),
                       footer = tagList(span(icon("book-open")), a(href = guide$url, target = "_blank", "Book")),
                       tag = guide$version)
      
      # insert UI
      insertUI(selector = "#guide-placeholder",
               where = "beforeEnd",
               ui = ui)
      
    }
    
    # apply helper
    lapply(guides_mart, helper)
    
    
  })
}
