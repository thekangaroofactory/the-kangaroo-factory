

# ------------------------------------------------------------------------------
# Module Server logic
# ------------------------------------------------------------------------------

rss_server <- function(id, parent_session) {
  moduleServer(id, function(input, output, session) {
    
    # -- get namespace
    ns <- session$ns
    
    # -- module
    MODULE <- paste0("[", id, "]")
    
    
    # --------------------------------------------------------------------------
    # Observers
    # --------------------------------------------------------------------------

    # retrieve RSS feed
    blog_mart <- tidyRSS::tidyfeed(feed = "https://thekangaroofactory.github.io/the-kangaroo-factory-blog/index.xml", 
                                   list = TRUE, 
                                   clean_tags = FALSE)
    
    
    helper <- function(x){

      # generate card
      ui <- asset_card(title = x$item_title,
                       description = paste(x$item_category, collapse = " | "),
                       type = "Post",
                       icon = icon("angle-right"),
                       footer = tagList(span(icon("laptop")), a(href = "", target = "_blank", "Page")),
                       tag = as.POSIXct(x$item_pub_date))
      
      # insert UI
      insertUI(selector = "#blog-placeholder",
               where = "beforeEnd",
               ui = ui)
      
    }
    
    apply(blog_mart$entries, MARGIN = 1, helper)
    
    
  })
}
