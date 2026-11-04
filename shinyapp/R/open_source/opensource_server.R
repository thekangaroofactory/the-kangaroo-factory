

# ------------------------------------------------------------------------------
# Module Server logic
# ------------------------------------------------------------------------------

opensource_server <- function(id, config) {
  moduleServer(id, function(input, output, session) {
    
    # -- get namespace
    ns <- session$ns
    
    # -- module
    MODULE <- paste0("[", id, "]")
    
    
    # --------------------------------------------------------------------------
    # Packages
    # --------------------------------------------------------------------------

    # get package info from r-universe API
    package_mart <- universe::universe_all_packages(universe = "thekangaroofactory")

    # build & insert card
    helper <- function(package){
      
      # generate card
      ui <- asset_card(title = package$Package,
                       description = package$Title,
                       type = "Package",
                       icon = icon("code"),
                       footer = tagList(tags$span(icon("laptop")), a(href = package$`_pkgdown`, target = "_blank", "Page"),
                                        tags$span(icon("rocket")), a(href = paste0(package$Repository, "/", package$Package), target = "_blank", "Repository")),
                       tag = package$Version)
      
      # insert UI
      insertUI(selector = "#package-placeholder",
               where = "beforeEnd",
               ui = ui)
      
    }
    
    # apply helper
    insertUI(selector = "#package-placeholder",
             where = "beforeBegin",
             ui = p("Packages published to ", a(href = config$runiverse, target = "_blank", "R-universe")))
    lapply(package_mart, helper)
    
    
    # --------------------------------------------------------------------------
    # Guides
    # --------------------------------------------------------------------------
    
    # get info from config
    guides_mart <- config$opensource$guides
    
    # build & insert card
    helper <- function(guide){
      
      # generate card
      ui <- asset_card(title = guide$title,
                       description = guide$description,
                       type = "Guide",
                       icon = icon("book"),
                       footer = tagList(tags$span(icon("book-open")), a(href = guide$url, target = "_blank", "Book")),
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
