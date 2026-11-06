

# ------------------------------------------------------------------------------
# Module Server logic
# ------------------------------------------------------------------------------

rss_server <- function(id, feed, parent_session) {
  moduleServer(id, function(input, output, session) {
    
    # -- get namespace
    ns <- session$ns
    
    # -- module
    MODULE <- paste0("[", id, "]")
    
    
    # --------------------------------------------------------------------------
    # Observers
    # --------------------------------------------------------------------------

    # retrieve RSS feed
    mart <- tidyRSS::tidyfeed(feed = feed, 
                              list = TRUE, 
                              clean_tags = FALSE)
    
    # generate & insert UI
    helper <- function(x){

      # generate card
      ui <- asset_card(title = x$item_title,
                       description = paste(x$item_category, collapse = " | "),
                       type = ifelse(id == "blog", "Post", "Article"),
                       icon = icon("angle-right"),
                       img = sprintf("%s/%s", x$item_link, "thumbnail.jpg"),
                       footer = tagList(span(icon("laptop")), a(href = "", target = "_blank", "Page")),
                       tag = as.POSIXct(x$item_pub_date))
      
      # insert UI
      insertUI(selector = paste0("#", id, "-placeholder"),
               where = "beforeEnd",
               ui = ui)
      
    }
    
    # apply helper
    apply(mart$entries, MARGIN = 1, helper)
    
  })
}
