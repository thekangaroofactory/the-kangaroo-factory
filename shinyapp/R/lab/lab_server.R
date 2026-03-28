

# ------------------------------------------------------------------------------
# Module Server logic
# ------------------------------------------------------------------------------

lab_server <- function(id, user = NULL, path) {
  moduleServer(id, function(input, output, session) {
    
    # -- get namespace
    ns <- session$ns
    
    # -- module
    MODULE <- paste0("[", id, "]")
    
    # -- reactive object
    events <- reactiveVal()
    spy <- reactiveVal()
    
    
    # --------------------------------------------------------------------------
    # User
    # --------------------------------------------------------------------------
    
    # -- Path to user data
    # path_contact <- reactive(file.path(path$data, user(), "contact"))
    
    
    # --------------------------------------------------------------------------
    # Kitems
    # --------------------------------------------------------------------------
    
    # -- launch module server
    # admin FALSE // see lab_ui admin console
    data <- kitems::kitems(id = "lab", path = path$data, autosave = FALSE, admin = FALSE, trigger = events)
    
    
    # --------------------------------------------------------------------------
    # Analytics
    # --------------------------------------------------------------------------
    # dedicated kitems server
    
    # -- launch analytics server
    lab_stats <- kitems::kitems(id = "spy", path = path$data, trigger = spy)
    
    # -- cache
    data_row <- reactiveVal(0)
    
    # -- listener
    # because kitems buttons can't be tracked, listens to data object
    observeEvent(data$items(), {
      
      # -- flush
      spy(NULL)
      
      # -- cases
      if(nrow(data$items()) == 0)
        spy(kitems::trigger_event(workflow = "create", type = "task", values = list(session = session$token, action = "delete", parameter = "auto", quantity = data_row())))
      else {
        delta <- nrow(data$items()) - data_row()
        if(delta == 0)
          spy(kitems::trigger_event(workflow = "create", type = "task", values = list(session = session$token, action = "update", parameter = "manual", quantity = 0)))
        else if(delta == 1)
          spy(kitems::trigger_event(workflow = "create", type = "task", values = list(session = session$token, action = "create", parameter = "manual")))
        else if(delta == -1)
          spy(kitems::trigger_event(workflow = "create", type = "task", values = list(session = session$token, action = "delete", parameter = "manual", quantity = -1)))
        else if(delta == 10)
          spy(kitems::trigger_event(workflow = "create", type = "task", values = list(session = session$token, action = "create", parameter = "auto", quantity = 10)))
        else if(delta == 100)
          spy(kitems::trigger_event(workflow = "create", type = "task", values = list(session = session$token, action = "create", parameter = "auto", quantity = 100)))}
      
      # -- update cache
      data_row(nrow(data$items()))
      
    }, ignoreInit = TRUE)
    
    # -- output
    output$lab_stats <- renderUI({
      
      total <- sum(lab_stats$items()[lab_stats$items()$action == "create", ]$quantity)
      start <- format(as.POSIXct(min(lab_stats$items()$id) / 1000), "%Y-%m-%d")
      
      card(
        class = "mt-5 border-radius tkf-bg-camel color-dark",
        card_header("Stats"),
        p(total, "items have been created", if(total == 0) "." else paste("since", paste0(start, "."))),
        card_footer("Fun fact: this count is based on a dedicated kitems instance with full back-end implementation pattern."))
        
    })
    
    
    # --------------------------------------------------------------------------
    # Listener
    # --------------------------------------------------------------------------
    
    # -- helper function (generate items)
    generate_items <- function(n = 1){
      
      list(date = sample(seq(as.Date("2024-01-01"), Sys.Date(), by="day"), n),
           name = sample(c("xxx", "yyy", "zzz"), n, replace = T),
           value = sample.int(100, n),
           checked = sample(c(TRUE, FALSE), n, replace = T))
      
    }
    
    # -- generate items
    observeEvent(input$generate_10, {
    
      cat("[lab] Fire generate x10 \n")
      
      # -- fire event
      events(
        kitems::trigger_event(workflow = "create",
                              type = "task",
                              values = generate_items(n = 10)))
      
    })
    
    # -- generate items
    observeEvent(input$generate_100, {
      
      cat("[lab] Fire generate x100 \n")
      
      # -- fire event
      events(
        kitems::trigger_event(workflow = "create",
                              type = "task",
                              values = generate_items(n = 100)))
      
    })
    
    # -- clear items
    observeEvent(input$clear, {
      
      # -- check
      req(nrow(data$items()) > 0)
      
      # -- fire event
      events(
        kitems::trigger_event(workflow = "delete",
                              type = "task",
                              values = list(id = data$items()$id)))
      
    })
    
    
    # --------------------------------------------------------------------------
    # Outputs
    # --------------------------------------------------------------------------
    
    # -- plot theme
    plot_theme <- function()
      ggplot2::theme(plot.background = ggplot2::element_blank(),
                     panel.background = ggplot2::element_blank(),
                     panel.grid = ggplot2::element_blank(),
                     axis.title = ggplot2::element_blank(),
                     axis.text = ggplot2::element_text(colour = "#2d3037", size = ggplot2::rel(1.25)),
                     plot.title = ggplot2::element_text(colour = "#2d3037", size = ggplot2::rel(1.5)))

    # -- value
    output$plot_value <- renderPlot({
      
      # -- check
      req(nrow(data$filtered_items()) > 0)
      
      # -- plot & return
      ggplot2::ggplot(data$filtered_items(),
                      ggplot2::aes(x = date, y = value)) +
        ggplot2::geom_point(ggplot2::aes(size = value),
                            color = "#2d3037",
                            alpha = .25,
                            show.legend = FALSE) +
        ggplot2::ggtitle("Value over time") +
        plot_theme()
      
    }, bg = "transparent")
    
    # -- name
    output$plot_name <- renderPlot({
      
      # -- check
      req(nrow(data$filtered_items()) > 0)
      
      # -- prepare
      x <- data$filtered_items() |>
        dplyr::group_by(name) |>
        dplyr::summarise(count = dplyr::n())
      
      # -- plot & return
      ggplot2::ggplot(x,
                      ggplot2::aes(x = name, y = count)) +
        ggplot2::geom_segment(yend = 0,
                              color = "#2d3037",
                              linewidth = 3,
                              lineend = "round") +
        ggplot2::ggtitle("Names") +
        plot_theme()
      
    }, bg = "transparent")
    
    
    # -- layout
    output$layout <- renderUI(
      layout_column_wrap(
        plotOutput(ns("plot_value"), height = if(nrow(data$filtered_items()) > 0) 200 else 1),
        plotOutput(ns("plot_name"), height = if(nrow(data$filtered_items()) > 0) 200 else 1)))
    
    
  })
}
