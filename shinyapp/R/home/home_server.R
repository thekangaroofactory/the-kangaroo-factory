

# ------------------------------------------------------------------------------
# Module Server logic
# ------------------------------------------------------------------------------

home_server <- function(id, content, parent_session) {
  moduleServer(id, function(input, output, session) {
    
    # -- get namespace
    ns <- session$ns
    
    # --------------------------------------------------------------------------
    # Data engineering
    # --------------------------------------------------------------------------
    
    # get counts
    counts <- as.list(table(content$type))
    
    # prepare stats
    # package, project, guide, post, article
    stats <- list(list(title = "Packages", icon = "fa-solid fa-code", value = counts$package, label = "on r-universe", target = "jump_action", nav = "open-source", id = "packages"),
                  list(title = "Guides", icon = "fa-solid fa-book", value = counts$guide, label = "eBooks", target = "jump_action", nav = "open-source", id = "guides"),
                  list(title = "Projects", icon = "fa-solid fa-code", value = counts$project, label = "featured", target = "jump_action", nav = "project"),
                  list(title = "Posts", icon = "fa-solid fa-pen-to-square", value = counts$post, label = "on the blog", target = "jump_action", nav = "blog"),
                  list(title = "Articles", icon = "fa-solid fa-file-lines", value = counts$article, label = "in the wiki", target = "jump_action", nav = "wiki"))
    
    # prepare steps
    content <- content[order(content$date, decreasing = T), ]
    steps <- build_steps(trend = head(content, 3))

    
    # --------------------------------------------------------------------------
    # Update UI
    # --------------------------------------------------------------------------
    
    # drop loader
    # In last otherwise it's too quick
    removeUI(selector = "#stats-placeholder > *", immediate = TRUE)
    
    # add stats
    insertUI(
      selector = "#stats-placeholder",
      where = "beforeEnd",
      ui = div(
        class = "animated-fade",
        stat_ui(stats)))
    
    # add next steps
    insertUI(
      selector = "#next-steps-placeholder",
      where = "beforeEnd",
      ui = div(
        class = "animated-fade",
        next_steps(steps)))
    
    
  })
}
