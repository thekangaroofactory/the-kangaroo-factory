

# ------------------------------------------------------------------------------
# Module Server logic
# ------------------------------------------------------------------------------

rss_server <- function(id, mart, parent_session) {
  moduleServer(id, function(input, output, session) {
    
    # -- get namespace
    ns <- session$ns
    
    # -- module
    MODULE <- paste0("[", id, "]")
    
    
    # --------------------------------------------------------------------------
    # Init
    # --------------------------------------------------------------------------
    
    # add unique ids
    mart$entries$id <- 1:nrow(mart$entries)
    
    # generate & insert UI
    helper <- function(x){
      
      # generate card
      ui <- asset_card(title = x$item_title,
                       description = paste(x$item_category, collapse = " | "),
                       type = ifelse(id == "blog", "Post", "Article"),
                       icon = icon("angle-right"),
                       img = sprintf("%s/%s", x$item_link, "thumbnail.jpg"),
                       footer = tagList(span(icon("laptop")), 
                                        actionLink(inputId = ns(x$id),
                                                   label = "Read",
                                                   onclick = sprintf("Shiny.setInputValue('%s', '%s', {priority: 'event'})",
                                                                     ns("open_article"), x$id))),
                       tag = as.POSIXct(x$item_pub_date))
      
      # insert UI
      insertUI(selector = paste0("#", id, "-placeholder"),
               where = "beforeEnd",
               ui = ui)
      
    }
    
    # apply helper
    apply(mart$entries, MARGIN = 1, helper)
    
    
    # --------------------------------------------------------------------------
    # Actions
    # --------------------------------------------------------------------------
    
    # open article
    observeEvent(input$open_article, {
      
      # drop tab (no matter if it already exits)
      nav_remove(id = "navbar", target = paste0(id, "-viewer"), session = parent_session)
      
      # prepare ui
      nav <- nav_panel(class = "p-5",
                       value = paste0(id, "-viewer"),
                       title = ifelse(id == "blog", "Post", "Article"), 
                       
                       rss_reader(id, 
                                  mart$entries[mart$entries$id == input$open_article, ]))
      
      # insert tab
      nav_insert(id = "navbar", 
                 nav = nav, 
                 target = id,
                 position = "after",
                 select = TRUE,
                 session = parent_session)
      
    })
    
  })
}
