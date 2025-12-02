

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
